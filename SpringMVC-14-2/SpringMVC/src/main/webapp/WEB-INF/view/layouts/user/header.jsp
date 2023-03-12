<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${ userID != null }">
	<c:set var="id_user" value="${ userID }" />
</c:if>
<div class="container-xl header-1 header-div">
	<div class="logo-header">
		<a href="/SpringMVC"><img class="img-fluid "
			src="<c:url value="/assets/images/logo/result.png"/>"
			alt="logo_UchihaShoes"></a>
	</div>

	<div class="search-header-form">
		<form action="/SpringMVC/products" method="post">
			<div class="search-keys">
				<c:if test="${ search != null }">
					<input class="container-xl search key-search" type="text"
						name="search" id="search" placeholder="Search..."
						value="${ search }">
				</c:if>
				<c:if test="${ search == null }">
					<input class="container-xl search key-search" type="text"
						name="search" id="search" placeholder="Search...">
				</c:if>
				<button type="button" class="search-triangle-btn">
					<img class="search-triangle"
						src="<c:url value="/assets/images/icons/triangle32.png"/>"
						alt="icon-triangle">
					<div class="listkeys" id="listkeys">
						<p>People also search</p>
						<div class="listkeys-span1">
							<div class="keys-search-span">
								<span class="keys-search-span" id="span_Id1"
									onclick="test('1');">New shoes</span> <span
									class="keys-search-span" id="span_Id2" onclick="test('2');">shoes</span>
								<span class="keys-search-span" id="span_Id3"
									onclick="test('3');">boot</span> <span class="keys-search-span"
									id="span_Id4" onclick="test('4');">sneaker</span> <span
									class="keys-search-span" id="span_Id5" onclick="test('5');">nike</span>
								<span class="keys-search-span" id="span_Id6"
									onclick="test('6');">adidas</span> <span
									class="keys-search-span" id="span_Id7" onclick="test('7');">shoes
									adidas</span> <span class="keys-search-span" id="span_Id8"
									onclick="test('8');">shoes nike</span> <span
									class="keys-search-span" id="span_Id9" onclick="test('9');">shoes
									sneaker</span> <span class="keys-search-span" id="span_Id10"
									onclick="test('10');">shoes boot</span>
							</div>
						</div>
					</div>
				</button>
				<button type="button" class="search-link-icon" id="search-link-icon"
					style="background: none;">
					<img class="search-icon"
						src="<c:url value="/assets/images/icons/search48.png"/>"
						alt="icon-search" width="32px">
				</button>
			</div>
		</form>
	</div>

	<div class="customer-support-content-header">
		<div class="img-phone-header">
			<img src="<c:url value="/assets/images/icons/smartphone48.png"/>"
				alt="icon-smartphone">
		</div>
		<div class="customer-support-content">
			<p>
				Custormer Support<br> <a class="phone" href="#">0346 643
					755</a>
			</p>
		</div>
	</div>
	<!--################################################## btn LOGIN ################################################################### -->
	<div class="container-xl icon-user">
		<c:if test="${ userID != null }">
			<button type="button" class="icon-user btn none" data-toggle="modal"
				data-target="#login">
				<img class="icon-user"
					src="<c:url value="/assets/images/users/${ avatar }"/>"
					alt="icon-user">
			</button>
			<button type="button" class="icon-user-login drop-icon"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
				<img class="icon-user-login"
					src="<c:url value="/assets/images/users/${ avatar }"/>"
					alt="icon-user">
			</button>

			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"
				id="dropdown-menu">
				<div class="img-dropdown-menu">
					<img src="<c:url value="/assets/images/icons/triangle-up.png"/>">
				</div>
				<div>
					<a class="dropdown-item" href="/SpringMVC/order/${ id_user }">Order</a>
					<a class="dropdown-item" href="#">Personal details</a> <a
						class="dropdown-item" onclick="logout()">Logout</a>
				</div>
			</div>
		</c:if>
		<c:if test="${ userID == null }">
			<button type="button" class="icon-user btn" data-toggle="modal"
				data-target="#login">
				<img class="icon-user"
					src="<c:url value="/assets/images/icons/user48.png"/>"
					alt="icon-user">
			</button>
		</c:if>
		<div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="btn-close-login">
						<button type="button" class="btn btn-secondary close"
							data-dismiss="modal">
							<img class="close-login-icon"
								src="<c:url value="/assets/images/icons/close48.png"/>"
								alt="icon-close" width="32px">
						</button>
					</div>
					<div class="login_form_container" id="login_form_container">
						<form action="/SpringMVC/" method="post">
							<div class="login_form">
								<h2>LOGIN</h2>
								<div class="input_group">

									<i class="fa fa-user"></i> <input type="text" id="username"
										name="username" placeholder="Username" class="input_text"
										autocomplete="off" />
								</div>
								<div class="input_group">
									<i class="fa fa-unlock-alt"></i> <input type="password"
										id="password" name="password" placeholder="Password"
										class="input_text" autocomplete="off" />
								</div>

								<div class="error-login none">
									<p id="msg-error">Username or password is not correct!</p>
								</div>

								<div class="form-check">

									<input class="form-check-input" type="checkbox"
										name="rememberme" value="" id="flexCheckChecked"> <label
										class="form-check-label" for="flexCheckChecked">
										Remember me </label>
								</div>
								<div class="button_group" id="login_button">
									<input type="submit" name="login" id="login-btn" value="Login">
								</div>
								<div class="fotter">
									<a>Forgot Password ?</a> <a href="/SpringMVC/sign-up">SignUp</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--################################################## btn Love Product ###################################################### -->
	<div class="container-xl icon-heart">
		<button type="button" class="icon-user btn" data-toggle="modal"
			data-target="#heart">
			<img class="icon-heart"
				src="<c:url value="/assets/images/icons/heart.png"/>"
				alt="icon-user">
		</button>
	</div>
	<!--####################################   btn CART    ################################################# -->
	<div class="container-xl icon-cart">
		<c:if test="${ userID == null }">
			<a href="/SpringMVC/cart">
				<button type="button" class="icon-user btn">
					<img class="icon-cart"
						src="<c:url value="/assets/images/icons/cart48.png"/>"
						alt="icon-user">
				</button>
			</a>
		</c:if>
		<c:if test="${ userID != null }">
			<a href="/SpringMVC/cart/${ userID }">
				<button type="button" class="icon-user btn">
					<img class="icon-cart"
						src="<c:url value="/assets/images/icons/cart48.png"/>"
						alt="icon-user">
				</button>
			</a>
		</c:if>
	</div>
</div>

<!--########################################3   START NAVIGATION ###########################################-->
<div class="wrapper container-xl" style="background-color: #212122;">
	<nav>
		<div class="content">
			<ul class="links">
				<li><a class="menu" href="/SpringMVC"><b>Home</b></a></li>
				<li><c:if test="${ id_user != null }">
						<a href="/SpringMVC/products/${ id_user }"
							class="desktop-link menu"><b>Shoes</b></a>
					</c:if> <c:if test="${ id_user == null }">
						<a href="/SpringMVC/products" class="desktop-link menu"><b>Shoes</b></a>
					</c:if>
					<ul>
						<c:forEach var="li_style" items="${ style }" varStatus="index">
							<c:if test="${ index.getIndex() < 9 }">
								<li><a class="menu"
									href="http://localhost:8888/SpringMVC/products?stylename=${ li_style.id }">${ li_style.style_name }</a></li>
							</c:if>
						</c:forEach>
						<li><a href="" class="desktop-link menu">More</a>
							<ul class="more-shoes">
								<c:forEach var="li_style" items="${ style }" varStatus="index">
									<c:if test="${ index.getIndex() >= 9 }">
										<li><a class="menu"
											href="http://localhost:8888/SpringMVC/products?stylename=${ li_style.id }">${ li_style.style_name }</a></li>
									</c:if>
								</c:forEach>
							</ul></li>
					</ul></li>
				<li><a href="#" class="desktop-link menu"><b>Accessories</b></a>
					<ul>
						<li><a class="menu" href="#">Bootlace</a></li>
						<li><a class="menu" href="#">Socklinning</a></li>
						<li><a class="menu" href="#">Leather Care</a></li>
						<li><a class="menu" href="#">Suede & Brush</a></li>
						<li><a href="" class="desktop-link menu">More</a>
							<ul class="more-accessories">
								<li><a class="menu" href="#">Sunglasses</a></li>
								<li><a class="menu" href="#">Hats</a></li>
								<li><a class="menu" href="#">Watches</a></li>
								<li><a class="menu" href="#">Jewelry</a></li>
								<li><a class="menu" href="#">Belts</a></li>
							</ul></li>
					</ul></li>
				<li><a href="/SpringMVC/news" class="desktop-link menu"><b>News</b></a>
					<ul>
						<li><a class="menu" href="#">Newest</a></li>
						<li><a class="menu" href="#">Hot</a></li>
						<li><a class="menu" href="#">Trending</a></li>
					</ul></li>
				<c:if test="${ userID =! null }">
					<li><a class="menu" href="/SpringMVC/questions/${id_user }"><b>Questions</b></a></li>
					<li><a class="menu" href="/SpringMVC/contact/${id_user }"><b>Contact</b></a></li>
				</c:if>
				<c:if test="${ userID == null }">
					<li><a class="menu" href="/SpringMVC/questions"><b>Questions</b></a></li>
					<li><a class="menu" href="/SpringMVC/contact"><b>Contact</b></a></li>
				</c:if>

			</ul>
		</div>
		<form action="/SpringMVC/products" method="post">
			<div class="nav-search" id="nav-search">
				<input class="container-xl search-nav" type="text" name="search-nav"
					id="search-nav" placeholder="Search..."> <img
					class="search-triangle-nav-icon"
					src="<c:url value="/assets/images/icons/triangle32.png"/>"
					alt="icon-triangle"> 
				<button class="nav-btn-search" type="button" id="nav-btn-search">
					<img class="search-nav-icon" id="search-nav-icon"
						src="<c:url value="/assets/images/icons/search48.png"/>"
						alt="icon-search" width="32px">
				</button>
			</div>
		</form>
	</nav>
</div>
