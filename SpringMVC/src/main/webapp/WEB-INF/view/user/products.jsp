<!DOCTYPE html>
<html lang="en">
<title>Products :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/swiper-bundle.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/slide.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/products.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/zoom-img.css"/>">
<style>
.zoo:after {
	content: attr(name);
	display: flex;
	width: 64px;
	height: 64px;
	position: absolute;
	top: 5px;
	right: 5px;
	font-weight: bold;
	justify-content: center;
	display: flex;
	color: white;
	align-items: center;
	background:
		url("<c:url value='/assets/images/icons/icons8-starburst-shape-64.png'/>");
}
</style>
<body style="color: white;">
	<header class="container-xl header-content">
		<form method="post">
			<div class="container-xl header-1">
				<a href="index.html"><img class="img-fluid logo-header"
					src="<c:url value="/assets/images/logo/logo_header.jpg"/>"
					alt="logo_UchihaShoes"></a> <img class="smartphone-icon"
					src="<c:url value="/assets/images/icons/smartphone48.png"/>"
					alt="icon-smartphone">
				<p class="customer-support-content">
					Customer Support<br> <a class="phone" href="#">0346 643
						755</a>
				</p>

				<!--################################################## btn LOGIN ################################################################### -->
				<div class="container-xl icon-user">
					<button type="button" class="icon-user btn btn-primary"
						data-toggle="modal" data-target="#login">
						<img class="icon-user"
							src="<c:url value="/assets/images/icons/user48.png"/>"
							alt="icon-user">
					</button>
					<div class="modal fade" id="login" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<button type="button" class="btn btn-secondary close"
									data-dismiss="modal">
									<img class="close-login-icon"
										src="<c:url value="/assets/images/icons/close48.png"/>"
										alt="icon-close" width="32px">
								</button>
								<div class="login_form_container">
									<div class="login_form">
										<h2>Login</h2>
										<div class="input_group">
											<i class="fa fa-user"></i> <input type="text"
												placeholder="Username" class="input_text" autocomplete="off" />
										</div>
										<div class="input_group">
											<i class="fa fa-unlock-alt"></i> <input type="password"
												placeholder="Password" class="input_text" autocomplete="off" />
										</div>
										<div class="button_group" id="login_button">
											<a>Login</a>
										</div>
										<div class="fotter">
											<a>Forgot Password ?</a> <a>SingUp</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--################################################## btn Love Product ###################################################### -->
				<div class="container-xl icon-heart">
					<button type="button" class="icon-user btn btn-primary"
						data-toggle="modal" data-target="#heart">
						<img class="icon-heart"
							src="<c:url value="/assets/images/icons/heart.png"/>"
							alt="icon-user">
					</button>
					<div class="modal fade" id="heart" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">...</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save
										changes</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--####################################   btn CART    ################################################# -->
				<div class="container-xl icon-cart">
					<a href="cart.html">
						<button type="button" class="icon-user btn btn-primary">
							<img class="icon-cart"
								src="<c:url value="/assets/images/icons/cart48.png"/>"
								alt="icon-user" style="margin-top: -15px; margin-left: -15px;">
						</button>
					</a>
				</div>
			</div>

			<!--########################################3   START NAVIGATION ###########################################-->
			<div class="wrapper container-xl" style="background-color: #212122;">
				<nav>
					<div class="content">
						<ul class="links">
							<li><a class="menu" href="index.html"><b>Home</b></a></li>
							<li><a href="#" class="desktop-link menu"><b>Shoes</b></a>
								<ul>
									<li><a class="menu" href="#">Drop Menu 1</a></li>
									<li><a class="menu" href="#">Drop Menu 2</a></li>
									<li><a class="menu" href="#">Drop Menu 3</a></li>
									<li><a class="menu" href="#">Drop Menu 4</a></li>
								</ul></li>
							<li><a href="#" class="desktop-link menu"><b>Accessories</b></a>
								<ul>
									<li><a class="menu" href="#">Drop Menu 1</a></li>
									<li><a class="menu" href="#">Drop Menu 2</a></li>
									<li><a class="menu" href="#">Drop Menu 3</a></li>
									<li><a class="menu" href="#">Drop Menu 4</a></li>
								</ul></li>
							<li><a href="#" class="desktop-link menu"><b>News</b></a>
								<ul>
									<li><a class="menu" href="#">Drop Menu 1</a></li>
									<li><a class="menu" href="#">Drop Menu 2</a></li>
									<li><a class="menu" href="#">Drop Menu 3</a></li>
									<li><a href="#" class="desktop-link menu">More Items</a>
										<ul>
											<li><a class="menu" href="#">Sub Menu 1</a></li>
											<li><a class="menu" href="#">Sub Menu 2</a></li>
											<li><a class="menu" href="#">Sub Menu 3</a></li>
										</ul></li>
								</ul></li>
							<li><a class="menu" href="questions.html"><b>Questions</b></a></li>
							<li><a class="menu" href="contact.html"><b>Contact</b></a></li>
						</ul>
					</div>
					<div class="nav-search" id="nav-search">
						<input class="container-xl search-nav" type="text"
							name="search-nav" id="search-nav" placeholder="Search...">
						<img class="search-triangle-nav-icon"
							src="<c:url value="/assets/images/icons/triangle32.png"/>"
							alt="icon-triangle"> <a href="#"
							class="search-nav-link-icon"> <img class="search-nav-icon"
							src="<c:url value="/assets/images/icons/search48.png"/>"
							alt="icon-search" width="32px"></a>
					</div>
				</nav>
			</div>

			<div class="search-keys">
				<input class="container-xl search key-search" type="text"
					name="search" id="search" placeholder="Search...">
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
				<a href="#" class="search-link-icon"> <img class="search-icon"
					src="<c:url value="/assets/images/icons/search48.png"/>"
					alt="icon-search" width="32px"></a>
			</div>

			<!--########################################3   START PRODUCTS   ###########################################-->
			<div class="title-page">
				<h3>Shoes</h3>
				<span><a href="/welcome-to-uchiha-shoes/">Home</a> / <a
					href="products">All shoes</a></span>
			</div>
			<div class="content-products">
				<!-- CATEGORY PRODUCTS -->
				<div>
					<div class="category-products">
						<div class="sortby-products">
							<h5>Sort by</h5>
							<div class="sortby-cbb">
								<select name="" id="" onchange="sortby(this)">
									<option value="" disabled
										<c:if test="${ selectedSortBy == null }">
										<c:out value="selected"></c:out>
									</c:if>>Choose...</option>
									<option value="toprate"
										<c:if test="${ selectedSortBy == 'toprate' }">
										<c:out value="selected"></c:out>
									</c:if>>Top
										Rated</option>
									<option value="newest"
										<c:if test="${ selectedSortBy == 'newest' }">
										<c:out value="selected"></c:out>
									</c:if>>Newest</option>
									<option value="price"
										<c:if test="${ selectedSortBy == 'price' }">
										<c:out value="selected"></c:out>
									</c:if>>Price</option>
									<option value="stylename"
										<c:if test="${ selectedSortBy == 'stylename' }">
										<c:out value="selected"></c:out>
									</c:if>>Style
										Name</option>
									<option value="salesoff"
										<c:if test="${ selectedSortBy == 'salesoff' }">
										<c:out value="selected"></c:out>
									</c:if>>Sales
										Off</option>
								</select>
							</div>
						</div>
						<hr class="cartegory">
						<div class="cost-products">
							<h5>Cost</h5>
							<div class="cost-table">
								<table>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '0_25' }">
												<input type="radio" name="filterbycost" id="1" value="0_25"
													onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '0_25' }">
												<input type="radio" name="filterbycost" id="1" value="0_25"
													onclick="price(this)">
											</c:if></td>
										<td>Up to $25</td>
									</tr>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '25_50' }">
												<input type="radio" name="filterbycost" id="2" value="25_50"
													onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '25_50' }">
												<input type="radio" name="filterbycost" id="2" value="25_50"
													onclick="price(this)">
											</c:if></td>
										<td>$25 to $50</td>
									</tr>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '50_100' }">
												<input type="radio" name="filterbycost" id="3"
													value="50_100" onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '50_100' }">
												<input type="radio" name="filterbycost" id="3"
													value="50_100" onclick="price(this)">
											</c:if></td>
										<td>$50 to $100</td>
									</tr>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '100_250' }">
												<input type="radio" name="filterbycost" id="4"
													value="100_250" onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '100_250' }">
												<input type="radio" name="filterbycost" id="4"
													value="100_250" onclick="price(this)">
											</c:if></td>
										<td>$100 to $250</td>
									</tr>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '250_more' }">
												<input type="radio" name="filterbycost" id="5"
													value="250_more" onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '250_more' }">
												<input type="radio" name="filterbycost" id="5"
													value="250_more" onclick="price(this)">
											</c:if></td>
										<td>$250 or more</td>
									</tr>
								</table>
							</div>
							<div class="cost-input">
								<input type="number" name="priceMin" id="priceMin" min="0"
									placeholder="Min"> <input type="number" name="priceMax"
									id="priceMax" min="0" placeholder="Max">
							</div>
							<div class="cost-submit">
								<input type="button" onclick="goPrice()" value="Go">
							</div>
						</div>
						<hr class="cartegory">
						<div class="brand-products">
							<h5>Style name</h5>
							<div class="brand-list">
								<c:forEach var="liStyle" items="${ style }">
									<c:if test="${ checkedStyleName == liStyle.id }">
										<div class="brank-link style-link" onclick="stylename(this)"
											id="${ liStyle.id }">
											<a>${ liStyle.style_name }<img
												src="<c:url value="/assets/images/icons/sortright30.png"/>"
												alt=""></a>
										</div>
									</c:if>
									<c:if test="${ checkedStyleName != liStyle.id }">
										<div class="brank-link" onclick="stylename(this)"
											id="${ liStyle.id }">
											<a>${ liStyle.style_name }<img
												src="<c:url value="/assets/images/icons/sortright30.png"/>"
												alt=""></a>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<hr class="cartegory">
						<div class="size-products">
							<h5>Size</h5>
							<div class="size-list">
								<c:set var="idx" value="${ 0 }" />
								<c:forEach var="listSize" items="${ listSize }" varStatus="i">

									<c:set var="idxS" value="${ i.getIndex() }"></c:set>
									<c:if test="${ idxS < 14 }">
										<c:set var="idx" value="${ i.getCount() }" />
										<c:if test="${ (idxS)%4==0 }">
											<div class="line1">
												<c:if test="${not empty checkedSize[listSize.id] }">
													<span class="sizeColor active" onclick="getSize(this)"
														id="${ listSize.id }">${ listSize.size_number }</span>
												</c:if>
												<c:if test="${ empty checkedSize[listSize.id] }">
													<span class="sizeColor" onclick="getSize(this)"
														id="${ listSize.id }">${ listSize.size_number }</span>
												</c:if>
										</c:if>
										<c:if test="${ (idxS-1)%4==0 || (idxS-2)%4==0 }">
											<c:if test="${not empty checkedSize[listSize.id] }">
												<span class="sizeColor active" onclick="getSize(this)"
													id="${ listSize.id }">${ listSize.size_number }</span>
											</c:if>
											<c:if test="${ empty checkedSize[listSize.id] }">
												<span class="sizeColor" onclick="getSize(this)"
													id="${ listSize.id }">${ listSize.size_number }</span>
											</c:if>
										</c:if>
										<c:if test="${ (idxS+1)%4==0 }">
											<c:if test="${not empty checkedSize[listSize.id] }">
												<span class="sizeColor active" onclick="getSize(this)"
													id="${ listSize.id }">${ listSize.size_number }</span>
											</c:if>
											<c:if test="${ empty checkedSize[listSize.id] }">
												<span class="sizeColor" onclick="getSize(this)"
													id="${ listSize.id }">${ listSize.size_number }</span>
											</c:if>
							</div>
							</c:if>
							</c:if>
							<c:if test="${ idxS == 14 }">
								<c:if test="${not empty checkedSize[listSize.id] }">
									<span class="sizeColor active" onclick="getSize(this)"
										id="${ listSize.id }">${ listSize.size_number }</span>
									<span class="moreSize" id="noneMore">+</span>
								</c:if>
								<c:if test="${ empty checkedSize[listSize.id] }">
									<span class="moreSize" id="noneMore">+</span>
									<span class="none sizeColor more-Size" onclick="getSize(this)"
										id="${ listSize.id }">${ listSize.size_number }</span>
								</c:if>

							</c:if>
							<c:if test="${ idxS > 14 }">
								<c:set var="idx" value="${ i.getCount() }" />
								<c:if test="${ (idxS)%4==0 }">
									<div class="line1">
										<c:if test="${not empty checkedSize[listSize.id] }">
											<span class="none more-Size sizeColor active"
												onclick="getSize(this)" id="${ listSize.id }">${ listSize.size_number }</span>
										</c:if>
										<c:if test="${ empty checkedSize[listSize.id] }">
											<span class="none more-Size" onclick="getSize(this)"
												id="${ listSize.id }">${ listSize.size_number }</span>
										</c:if>
								</c:if>
								<c:if test="${ (idxS-1)%4==0 || (idxS-2)%4==0 }">
									<c:if test="${not empty checkedSize[listSize.id] }">
										<span class="none more-Size sizeColor active"
											onclick="getSize(this)" id="${ listSize.id }">${ listSize.size_number }</span>
									</c:if>
									<c:if test="${ empty checkedSize[listSize.id] }">
										<span class="none more-Size" onclick="getSize(this)"
											id="${ listSize.id }">${ listSize.size_number }</span>
									</c:if>
								</c:if>
								<c:if test="${ (idxS+1)%4==0 }">
									<c:if test="${not empty checkedSize[listSize.id] }">
										<span class="none more-Size sizeColor active"
											onclick="getSize(this)" id="${ listSize.id }">${ listSize.size_number }</span>
									</c:if>
									<c:if test="${ empty checkedSize[listSize.id] }">
										<span class="none more-Size" onclick="getSize(this)"
											id="${ listSize.id }">${ listSize.size_number }</span>
									</c:if>
						</div>
						</c:if>
						</c:if>
						</c:forEach>

						<c:if test="${ idx%4 != 0 }">
					</div>
					</c:if>
				</div>
			</div>
			<hr class="cartegory">
			<div class="rate-products">
				<h5>Rate</h5>
				<div class="rate-list">
					<div class="line1-rate-product">
						<!-- one star -->
						<c:if test="${ checkedRate == 'onestar' }">
							<span class="sizeColor active" onclick="getRate(this)"
								id="onestar">1<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
						<c:if test="${ checkedRate != 'onestar' }">
							<span class="sizeColor" onclick="getRate(this)" id="onestar">1<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
						<!-- two stars -->
						<c:if test="${ checkedRate == 'twostars' }">
							<span class="sizeColor active" onclick="getRate(this)"
								id="twostars">2<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
						<c:if test="${ checkedRate != 'twostars' }">
							<span class="sizeColor" onclick="getRate(this)" id="twostars">2<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
					</div>
					<div class="line2-rate-product">
						<!-- three stars -->
						<c:if test="${ checkedRate == 'threestars' }">
							<span class="sizeColor active" onclick="getRate(this)"
								id="threestars">3<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
						<c:if test="${ checkedRate != 'threestars' }">
							<span class="sizeColor" onclick="getRate(this)" id="threestars">3<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
						<!-- four stars -->
						<c:if test="${ checkedRate == 'fourstars' }">
							<span class="sizeColor active" onclick="getRate(this)"
								id="fourstars">4<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
						<c:if test="${ checkedRate != 'fourstars' }">
							<span class="sizeColor" onclick="getRate(this)" id="fourstars">4<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>


					</div>
					<div class="line3-rate-product">
						<!-- five stars -->
						<c:if test="${ checkedRate == 'fivestars' }">
							<span class="sizeColor active" onclick="getRate(this)"
								id="fivestars">5<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
						<c:if test="${ checkedRate != 'fivestars' }">
							<span class="sizeColor" onclick="getRate(this)" id="fivestars">5<img
								src="<c:url value="/assets/images/icons/star24.png"/>" alt=""></span>
						</c:if>
					</div>
				</div>
			</div>
			<hr class="cartegory">
			<div class="color-products">
				<h5>Color</h5>
				<div class="color-list">
					<c:forEach var="liColor" items="${ color }" varStatus="index">
						<c:if test="${ index.getIndex() < 9 }">
							<div class="line">
								<c:if test="${not empty checkedColor[liColor.id] }">
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="color active2" style="background: ${ liColor.rgb };"></span>
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="txt checked-color">${ liColor.color_name }</span>
								</c:if>
								<c:if test="${ empty checkedColor[liColor.id] }">
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="color" style="background: ${ liColor.rgb };"></span>
									<span onclick="getColor(this)" id="${ liColor.id }" class="txt">${ liColor.color_name }</span>
								</c:if>
							</div>
						</c:if>

						<c:if test="${ index.getIndex() >= 9 }">
							<c:if test="${ index.getIndex() != 13 }">
								<div class="line more-color lmc">
									<c:if test="${not empty checkedColor[liColor.id] }">
										<span onclick="getColor(this)" id="${ liColor.id }"
											class="color active2" style="background: ${ liColor.rgb };"></span>
										<span onclick="getColor(this)" id="${ liColor.id }"
											class="txt checked-color">${ liColor.color_name }</span>
									</c:if>
									<c:if test="${ empty checkedColor[liColor.id] }">
										<span onclick="getColor(this)" id="${ liColor.id }"
											class="color" style="background: ${ liColor.rgb };"></span>
										<span onclick="getColor(this)" id="${ liColor.id }"
											class="txt">${ liColor.color_name }</span>
									</c:if>
								</div>
							</c:if>
						</c:if>
						<c:if test="${ index.getIndex() == 13 }">
							<div class="line">
								<c:if test="${fn:contains(checkedColor, liColor.id)}">
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="color active2" style="background: ${ liColor.rgb };"></span>
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="txt checked-color">${ liColor.color_name }</span>
								</c:if>
								<c:if test="${not fn:contains(checkedColor, liColor.id)}">
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="color" style="background: ${ liColor.rgb };"></span>
									<span onclick="getColor(this)" id="${ liColor.id }" class="txt">${ liColor.color_name }</span>
								</c:if>
							</div>
							<div class="line btn-more" id="moreColor">
								<span id="" class="more color" style="background: none;">+</span>
								<span id="" class="txt">More</span>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<hr class="cartegory">
			<div class="gender-products">
				<h5>Gender</h5>
				<div class="gender-list">
					<div class="line1-gender-product">
						<!-- Men -->
						<c:if test="${ checkedGender == 'men' }">
							<span class="sizeColor active" onclick="getGender(this)" id="men">Men</span>
							<span class="sizeColor" onclick="getGender(this)" id="women">Women</span>
						</c:if>

						<c:if test="${ checkedGender == 'women' }">
							<span class="sizeColor" onclick="getGender(this)" id="men">Men</span>
							<span class="sizeColor active" onclick="getGender(this)"
								id="women">Women</span>
						</c:if>

						<c:if
							test="${checkedGender != 'men' && checkedGender != 'women' }">
							<span class="sizeColor" onclick="getGender(this)" id="men">Men</span>
							<span class="sizeColor" onclick="getGender(this)" id="women">Women</span>
						</c:if>
					</div>
				</div>
			</div>

			</div>
			<div class="reset-apply-products">
				<div class="reset-products">
					<input type="button" onclick="resetAll()" value="Reset">
				</div>
			</div>

			</div>
			<!-- LIST PRODUCTS -->
			<div class="list-products">
				<!--Line 1-->
				<c:if test="${ listProducts == null }">
					<div class="msg-empty-product">
						<h4>Sorry! Product is being updated.</h4>
						<img alt="icon-crying"
							src="<c:url value="/assets/images/icons/crying-64.png"/>">
					</div>
				</c:if>
				<c:set var="prodCount" value="${ 0 }"></c:set>
				<c:forEach var="listProd" items="${ listProducts }" varStatus="i">
					<c:set var="prodCount" value="${ i.getCount() }"></c:set>
					<c:if test="${ i.getIndex() < 20 }">
						<c:set var="idx" value="${ i.getIndex() }"></c:set>
						<c:if test="${ idx%4==0 }">
							<div class="line-products">
								<div class="products-el">
									<c:if test="${listProd.discount > 0 }">
										<div class="img-product-products zoom zoo"
											id="exe${ i.getIndex() }" name="${listProd.discount }%">
											<img
												src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
												alt="img-product">
										</div>
									</c:if>
									<c:if test="${listProd.discount <= 0 }">
										<div class="img-product-products zoom"
											id="exe${ i.getIndex() }">
											<img
												src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
												alt="img-product">
										</div>
									</c:if>
									<div class="content-product-products">
										<div class="brand-product-products">${ listProd.style.style_name }</div>
										<div class="name-product-products">${ listProd.title }</div>
										<div class="show-products">
											<div class="price-product-products">
												<c:if test="${ listProd.discount <= 0 }">
													<div class="price-sale-products">$${ listProd.price }</div>
												</c:if>
												<c:if test="${ listProd.discount > 0 }">
													<div class="price-sale-products">$${ listProd.price -
														listProd.price*discount/100 }</div>
													<div class="price-old-products">
														<s>$${ listProd.price }</s>
													</div>
												</c:if>

											</div>
											<div class="rate-product-products">
												5.0
												<div class="img-rate-product-products">
													<img src="<c:url value="/assets/images/icons/star24.png"/>"
														alt="">
												</div>
												| Sold (${ listProd.sold })
											</div>
											<div class="favorite-product-products">
												<div class="show-function">
													<button class="favorite-product">
														<img class="shadow-1"
															src="<c:url value="/assets/images/icons/favorite32.png"/>"
															alt="favorite32">
													</button>

													<button type="submit" class="add-to-cart"
														name="add-to-cart" value="${ listProd.id }">
														<img class="shadow-2"
															src="<c:url value="/assets/images/icons/addcart32.png"/>"
															alt="addcart32">
													</button>

													<button class="buy-now" class="shadow-1">
														<a
															href="/SpringMVC/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod=${ listProd.id }">Buy
															now</a>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
						</c:if>

						<c:if test="${ (idx+1)%4==0 }">
							<div class="products-el">
								<c:if test="${listProd.discount > 0 }">
									<div class="img-product-products zoom zoo"
										id="exe${ i.getIndex() }" name="${listProd.discount }%">
										<img
											src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
											alt="img-product">
									</div>
								</c:if>
								<c:if test="${listProd.discount <= 0 }">
									<div class="img-product-products zoom"
										id="exe${ i.getIndex() }">
										<img
											src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
											alt="img-product">
									</div>
								</c:if>
								<div class="content-product-products">
									<div class="brand-product-products">${ listProd.style.style_name }</div>
									<div class="name-product-products">${ listProd.title }</div>
									<div class="show-products">
										<div class="price-product-products">
											<c:if test="${ listProd.discount <= 0 }">
												<div class="price-sale-products">$${ listProd.price }</div>
											</c:if>
											<c:if test="${ listProd.discount > 0 }">
												<div class="price-sale-products">$${ listProd.price -
													listProd.price*discount/100 }</div>
												<div class="price-old-products">
													<s>$${ listProd.price }</s>
												</div>
											</c:if>

										</div>
										<div class="rate-product-products">
											5.0
											<div class="img-rate-product-products">
												<img src="<c:url value="/assets/images/icons/star24.png"/>"
													alt="">
											</div>
											| Sold (${ listProd.sold })
										</div>
										<div class="favorite-product-products">
											<div class="show-function">
												<button class="favorite-product">
													<img class="shadow-1"
														src="<c:url value="/assets/images/icons/favorite32.png"/>"
														alt="favorite32">
												</button>
												<button type="submit" class="add-to-cart" name="add-to-cart"
													value="${ listProd.id }">
													<img class="shadow-2"
														src="<c:url value="/assets/images/icons/addcart32.png"/>"
														alt="addcart32">
												</button>
												<button class="buy-now" class="shadow-1">
													<a
														href="/SpringMVC/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod=${ listProd.id }">Buy
														now</a>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
			</div>
			</c:if>

			<c:if test="${ (idx-1 )%4==0 || (idx-2)%4==0 }">
				<div class="products-el">
					<c:if test="${listProd.discount > 0 }">
						<div class="img-product-products zoom zoo"
							id="exe${ i.getIndex() }" name="${listProd.discount }%">
							<img
								src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
								alt="img-product">
						</div>
					</c:if>
					<c:if test="${listProd.discount <= 0 }">
						<div class="img-product-products zoom" id="exe${ i.getIndex() }">
							<img
								src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
								alt="img-product">
						</div>
					</c:if>
					<div class="content-product-products">
						<div class="brand-product-products">${ listProd.style.style_name }</div>
						<div class="name-product-products">${ listProd.title }</div>
						<div class="show-products">
							<div class="price-product-products">
								<c:if test="${ listProd.discount <= 0 }">
									<div class="price-sale-products">$${ listProd.price }</div>
								</c:if>
								<c:if test="${ listProd.discount > 0 }">
									<div class="price-sale-products">$${ listProd.price -
										listProd.price*discount/100 }</div>
									<div class="price-old-products">
										<s>$${ listProd.price }</s>
									</div>
								</c:if>

							</div>
							<div class="rate-product-products">
								5.0
								<div class="img-rate-product-products">
									<img src="<c:url value="/assets/images/icons/star24.png"/>"
										alt="">
								</div>
								| Sold (${ listProd.sold })
							</div>
							<div class="favorite-product-products">
								<div class="show-function">
									<button class="favorite-product">
										<img class="shadow-1"
											src="<c:url value="/assets/images/icons/favorite32.png"/>"
											alt="favorite32">
									</button>
									<button type="submit" class="add-to-cart" name="add-to-cart"
										value="${ listProd.id }">
										<img class="shadow-2"
											src="<c:url value="/assets/images/icons/addcart32.png"/>"
											alt="addcart32">
									</button>

									<button class="buy-now" class="shadow-1">
										<a
											href="/SpringMVC/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod=${ listProd.id }">Buy
											now</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			</c:if>
			</c:forEach>


			<c:if test="${ prodCount%4 != 0 && prodCount<=20 }">
				</div>
			</c:if>



			<c:if test="${ listProducts != null }">
				<div class="next-page-products">
					<div class="backward-page">
						<img src="<c:url value="/assets/images/icons/back48.png"/>" alt="">
					</div>
					<div class="slide-number-page">
						<span>1</span> <span>2</span> <span>3</span>
					</div>
					<div class="forward-page">
						<img
							src="<c:url value="/assets/images/icons/forward48_page.png"/>"
							alt="">
					</div>
				</div>
			</c:if>
			</div>

			</div>

			<div class="error none-error">
				<h5>Message</h5>
				<div class="content-error" id="content-error"></div>
				<div class="btn-ok-error">
					<input class="okey-error" type="button" value="Okey">
				</div>
			</div>
		</form>
	</header>


	<hr class="shadow">

	<footer>
		<form action="" method="post">
			<div class="footer">
				<div class="logo-footer">
					<a href="index.html"><img class="logo-footer"
						src="<c:url value="/assets/images/logo/logo_footer.jpg"/>"
						alt="logo-footer"></a>
					<div class="shop-name">
						<p class="text-shadow">
							<a href="index.html">UCHIHA SHOES</a>
						</p>
					</div>
				</div>
				<div class="content-footer">
					<div class="text-shadow">CONTACT WITH US</div>
					<div class="content-footer-sub">
						<div class="col1">
							ABOUT US
							<div class="content-col">
								<a href="#">UCHIHA SHOES Community</a> <br> <a href="#">UCHIHA
									SHOES Agency</a>
							</div>
						</div>
						<div class="col2">
							ADDRESS
							<div class="content-col">
								dovantrung47201@gmail.com <br> Mr. Trung - 036 97 96 359
							</div>
						</div>
						<div class="col3">
							FOLLOW
							<div class="follow-app">
								<a href="https://www.facebook.com/trung472"><img
									src="<c:url value="/assets/images/icons/facebook60.png"/>"
									alt="facebook60" class="app"></a> <a
									href="https://github.com/trung47201/QLYTHUVIEN"><img
									src="<c:url value="/assets/images/icons/instagram60.png"/>"
									alt="instagram60" class="app"></a> <a
									href="https://www.youtube.com/channel/UCB_GgY-I9WyNOOjVAax3ayg"><img
									src="<c:url value="/assets/images/icons/youtube60.png"/>"
									alt="youtube60" class="app"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr class="copyright">
			<div class="footer-copyright">UCHIHA SHOES © 2022 All rights
				reserved.</div>
		</form>
	</footer>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$("span.moreSize").click(function() {
				$("span.more-Size").toggleClass("none");
				$("span.moreSize").toggleClass("none");
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$("div.btn-more").click(function() {
				$("div.lmc").toggleClass("more-color");
				$("div.btn-more").toggleClass("more-color");
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$(".okey-error").click(function() {
				$(".error").toggleClass("none-error");
			});
		});
	</script>
	<script type="text/javascript">
		function getGender(x) {
			let txt = window.location.href;
			if (txt.includes("gender")) {
				if (txt.includes("&gender")) {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("gender")) {
							if (arr[i] == ("gender=" + x.id)) {
								txt = txt.replace("&" + arr[i], "");
							} else {
								txt = txt.replace(arr[i], "gender=" + x.id);
							}
						}
					}
				} else {
					const arr1 = txt.split("?");
					const arr = arr1[1].split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("gender")) {
							if (arr[i] == ("gender=" + x.id)) {
								if (arr.length == 1) {
									txt = txt.replace("?" + arr[i], "");
								} else {
									txt = txt.replace(arr[i] + "&", "");
								}
							} else {
								txt = txt.replace(arr[i], "gender=" + x.id);
							}
						}
					}
				}
			} else if (txt.includes("products?") && !txt.includes("gender")) {
				txt += "&gender=" + x.id;
			} else {
				txt += "?gender=" + x.id;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();
		}
		function getRate(x) {
			let txt = window.location.href;
			if (txt.includes("rate")) {
				if (txt.includes("&rate")) {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("rate")) {
							if (arr[i] == ("rate=" + x.id)) {
								txt = txt.replace("&" + arr[i], "");
							} else {
								txt = txt.replace(arr[i], "rate=" + x.id);
							}
						}
					}
				} else {
					const arr1 = txt.split("?");
					const arr = arr1[1].split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("rate")) {
							if (arr[i] == ("rate=" + x.id)) {
								if (arr.length == 1) {
									txt = txt.replace("?" + arr[i], "");
								} else {
									txt = txt.replace(arr[i] + "&", "");
								}
							} else {
								txt = txt.replace(arr[i], "rate=" + x.id);
							}
						}
					}
				}
			} else if (txt.includes("products?") && !txt.includes("rate")) {
				txt += "&rate=" + x.id;
			} else {
				txt += "?rate=" + x.id;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();

		}
		function getSize(x) {
			$(document).ready(function() {
				$(x).toggleClass("active");
			});
			let txt = window.location.href;
			if (txt.includes("size")) {
				//edit
				if (txt.includes("products?size")) {
					const arr = txt.split("products?");
					for (let i = 0; i < arr.length; i++) {
						const arr1 = arr[i].split("&");
						if (arr1[0].includes("size")) {
							const arr2 = arr1[0].split("=");
							const arr3 = arr2[1].split("/");
							if (arr3.length == 1 && arr3[0] == x.id) {
								if (arr1.length == 1) {
									txt = txt.replace("?" + arr1[0], "");
								} else {
									txt = txt.replace(arr1[0] + "&", "");
								}

							} else {
								if (arr3.includes(x.id)) {
									var getTxt = "";
									for (let j = 0; j < arr3.length; j++) {
										if (arr3[j] == x.id) {
											arr3[j] = 0;
										}
									}
									for (let j = 0; j < arr3.length; j++) {
										if (arr3[j] != 0) {
											getTxt += arr3[j] + "/";
										}
									}
									txt = txt
											.replace(arr1[0], "size=" + getTxt);
								} else {
									if (arr1[0][arr1[0].length - 1] == "/") {
										txt = txt.replace(arr1[0], arr1[0] + ""
												+ x.id);
									} else {
										txt = txt.replace(arr1[0], arr1[0]
												+ "/" + x.id);
									}
								}
							}
						}
					}
				} else {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("size")) {
							const arr1 = arr[i].split("=");
							const arr2 = arr1[1].split("/");
							if (arr2.length == 1 && arr2[0] == x.id) {
								txt = txt.replace("&" + arr[i], "");
							} else {
								if (arr2.includes(x.id)) {
									var getTxt = "";
									for (let j = 0; j < arr2.length; j++) {
										if (arr2[j] == x.id) {
											arr2[j] = 0;
										}
									}
									for (let j = 0; j < arr2.length; j++) {
										if (arr2[j] != 0) {
											getTxt += arr2[j] + "/";
										}
									}
									txt = txt.replace(arr1[1], getTxt);
								} else {
									if (arr[i][arr[i].length - 1] == "/") {
										txt = txt.replace(arr[i], arr[i] + ""
												+ x.id);
									} else {
										txt = txt.replace(arr[i], arr[i] + "/"
												+ x.id);
									}
								}
							}
						}
					}
				}
			} else {
				//not allowed edit
				if (txt.includes("products?")) {
					txt = window.location.href + "&size=" + x.id;
				} else {
					txt = window.location.href + "?size=" + x.id;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();

		}
		function getColor(x) {
			let txt = window.location.href;
			if (txt.includes("color")) {
				//edit
				if (txt.includes("products?color")) {
					const arr = txt.split("products?");
					for (let i = 0; i < arr.length; i++) {
						const arr1 = arr[i].split("&");
						if (arr1[0].includes("color")) {
							const arr2 = arr1[0].split("=");
							const arr3 = arr2[1].split("/");
							if (arr3.length == 1 && arr3[0] == x.id) {
								if (arr1.length == 1) {
									txt = txt.replace("?" + arr1[0], "");
								} else {
									txt = txt.replace(arr1[0] + "&", "");
								}

							} else {
								if (arr3.includes(x.id)) {
									var getTxt = "";
									for (let j = 0; j < arr3.length; j++) {
										if (arr3[j] == x.id) {
											arr3[j] = 0;
										}
									}
									for (let j = 0; j < arr3.length; j++) {
										if (arr3[j] != 0) {
											getTxt += arr3[j] + "/";
										}
									}
									txt = txt.replace(arr1[0], "color="
											+ getTxt);
								} else {
									if (arr1[0][arr1[0].length - 1] == "/") {
										txt = txt.replace(arr1[0], arr1[0] + ""
												+ x.id);
									} else {
										txt = txt.replace(arr1[0], arr1[0]
												+ "/" + x.id);
									}
								}
							}
						}
					}
				} else {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("color")) {
							const arr1 = arr[i].split("=");
							const arr2 = arr1[1].split("/");
							if (arr2.length == 1 && arr2[0] == x.id) {
								txt = txt.replace("&" + arr[i], "");
							} else {
								if (arr2.includes(x.id)) {
									var getTxt = "";
									for (let j = 0; j < arr2.length; j++) {
										if (arr2[j] == x.id) {
											arr2[j] = 0;
										}
									}
									for (let j = 0; j < arr2.length; j++) {
										if (arr2[j] != 0) {
											getTxt += arr2[j] + "/";
										}
									}
									txt = txt.replace(arr1[1], getTxt);
								} else {
									if (arr[i][arr[i].length - 1] == "/") {
										txt = txt.replace(arr[i], arr[i] + ""
												+ x.id);
									} else {
										txt = txt.replace(arr[i], arr[i] + "/"
												+ x.id);
									}
								}
							}
						}
					}
				}
			} else {
				//not allowed edit
				if (txt.includes("products?")) {
					txt = window.location.href + "&color=" + x.id;
				} else {
					txt = window.location.href + "?color=" + x.id;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();

		}
		function goPrice() {
			let a = document.getElementById('priceMin').value;
			let b = document.getElementById('priceMax').value;
			if (a > b) {
				$(document)
						.ready(
								function() {
									$(".error").toggleClass("none-error");
									document.getElementById("content-error").innerHTML = "Min price must be less than max price";

								});
			} else if (a <= b) {
				let x = a + "_" + b;
				let txt = window.location.href;
				if (txt.includes("price")) {
					if (txt.includes("products?price")) {
						const arr = txt.split("?");
						for (let i = 0; i < arr.length; i++) {
							if (arr[i].includes("price")) {
								const arr1 = arr[i].split("&");
								txt = txt.replace(arr1[0], "price=" + x);
							}
						}

					} else {
						const arr = txt.split("&");
						for (let i = 0; i < arr.length; i++) {
							if (arr[i].includes("price")) {
								txt = txt.replace(arr[i], "price=" + x);
							}
						}
					}
				} else {
					if (txt.includes("products?")) {
						txt = window.location.href + "&price=" + x;
					} else {
						txt = window.location.href + "?price=" + x;
					}
				}
				var xhr = new XMLHttpRequest();
				xhr.open("GET", txt);
				xhr.onload = function() {
					window.location.assign(txt);
				};
				xhr.send();
			}
		}
	</script>

	<script>
		function price(x) {
			let txt = window.location.href;
			if (txt.includes("price")) {
				if (txt.includes("products?price")) {
					const arr = txt.split("?");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("price")) {
							const arr1 = arr[i].split("&");
							txt = txt.replace(arr1[0], "price=" + x.value);
						}
					}

				} else {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("price")) {
							txt = txt.replace(arr[i], "price=" + x.value);
						}
					}
				}
			} else {
				if (txt.includes("products?")) {
					txt = window.location.href + "&price=" + x.value;
				} else {
					txt = window.location.href + "?price=" + x.value;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();
		}
		function stylename(x) {
			let txt = window.location.href;
			if (txt.includes("stylename")) {
				if (txt.includes("products?stylename")) {
					const arr = txt.split("?");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("stylename")) {
							const arr1 = arr[i].split("&");
							txt = txt.replace(arr1[0], "stylename=" + x.id);
						}
					}

				} else {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("stylename")) {
							txt = txt.replace(arr[i], "stylename=" + x.id);
						}
					}
				}
			} else {
				if (txt.includes("products?")) {
					txt = window.location.href + "&stylename=" + x.id;
				} else {
					txt = window.location.href + "?stylename=" + x.id;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();

		}
		function sortby(x) {
			let txt = window.location.href;
			if (txt.includes("sortby")) {
				if (txt.includes("products?sortby")) {
					const arr = txt.split("?");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("sortby")) {
							const arr1 = arr[i].split("&");
							txt = txt.replace(arr1[0], "sortby=" + x.value);
						}
					}

				} else {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("sortby")) {
							txt = txt.replace(arr[i], "sortby=" + x.value);
						}
					}
				}
			} else {
				if (txt.includes("products?")) {
					txt = window.location.href + "&sortby=" + x.value;
				} else {
					txt = window.location.href + "?sortby=" + x.value;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();
		}
		function resetAll() {
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "http://localhost:8888/SpringMVC/products");
			xhr.onload = function() {
				window.location
						.assign("http://localhost:8888/SpringMVC/products");
			};
			xhr.send();
		}
	</script>

	<script>
		function test($a) {
			for (let i = 1; i <= 10; i++) {
				if (i == $a) {
					var span_Text = document.getElementById("span_Id" + $a).innerText;
					document.querySelector('input[name="search"]').value = span_Text;
				}
			}
		}
	</script>
	<script type="text/javascript">
		window.addEventListener("scroll", function() {
			var div = document.getElementById('nav-search');
			var div1 = document.getElementsByClassName('hidden-poster2');
			if (window.scrollY > 80) {
				div.style.visibility = 'visible';
			} else {
				div.style.visibility = 'hidden';
			}
			if (window.scrollY > 2280 && window.scrollY < 2380) {
				div1.style.visibility = 'hidden';
			} else {
				div1.style.visibility = 'visible';
			}
		})
	</script>

	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			effect : "coverflow",
			grabCursor : true,
			centeredSlides : true,
			slidesPerView : "auto",
			coverflowEffect : {
				rotate : 0,
				stretch : 0,
				depth : 150,
				modifier : 1,
				slideShadows : true,
			},
			loop : true,
		});
	</script>
	<!-- auto play header slide -->
	<script type="text/javascript">
		var counter = 1;
		setInterval(function() {
			document.getElementById('radio' + counter).checked = true;
			counter++;
			if (counter > 4) {
				counter = 1;
			}
		}, 5000);
	</script>

	<script>
		function bigImg(x) {
			var listkeys = document.getElementById("listkeys");
			listkeys.style.visibility = 'visible';
		}

		function normalImg(x) {
			var listkeys = document.getElementById("listkeys");
			listkeys.style.visibility = 'hidden';
		}
	</script>


	<script
		src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"/>"></script>
	<script src="<c:url value="/assets/js/jquery.zoom.js"/>"></script>
	<script>
		var div1 = document.getElementsByClassName('zoom');
		$(document).ready(function() {
			for (let i = 0; i < div1.length; i++) {
				$(div1[i]).zoom();
			}
		});
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="js/login.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>