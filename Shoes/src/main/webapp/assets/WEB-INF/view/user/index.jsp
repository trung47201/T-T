<!DOCTYPE html>
<html lang="en">
<title>Who are you? :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href='<c:url value="/assets/css/bootstrap.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/js/bootstrap.js"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/style.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/bootstrap.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/js/bootstrap.min.js"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/login.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/swiper-bundle.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/slide.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/products_c.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/add-to-cart.css"/>'>
<link rel="stylesheet" href="<c:url value="/assets/css/zoom-img.css"/>">
<style>
.none {
	display: none;
}

button.icon-user-login {
	background: none !important;
	border: 0 !important;
}

button.icon-user-login:focus {
	outline-style: none !important;
}

img.icon-user-login {
	position: absolute;
	margin-top: 0 !important;
	margin-left: 0 !important;
	width: 40px;
	height: 40px;
	border-radius: 20px;
}

img.icon-user-login:hover {
	border-radius: 20px;
	box-shadow: 2px 4px 6px #0086ff;
}

a.dropdown-item {
	color: #0086ff;
}

.dropdown-item:hover {
	color: white;
	background: #0086ff;
}

.dropdown-menu {
	margin-left: -120px;
	margin-top: 23px;
}

.img-dropdown-menu {
	position: absolute;
	margin-top: 8px;
	z-index: 1001;
}

.img-dropdown-menu img {
	width: 18px;
	height: 18px;
	margin-left: 10px;
	z-index: 1001;
}
</style>
<body style="color: white;">
	<header class="container-xl header-content">
		<form method="post">
			<div class="container-xl header-1">
				<a href="/Shoes"><img class="img-fluid logo-header"
					src="<c:url value="/assets/images/logo/logo_header.jpg"/>"
					alt="logo_UchihaShoes"></a> <img class="smartphone-icon"
					src="<c:url value="/assets/images/icons/smartphone48.png"/>"
					alt="icon-smartphone">
				<p class="customer-support-content">
					Custormer Support<br> <a class="phone" href="#">0346 643
						755</a>
				</p>

				<!--################################################## btn LOGIN ################################################################### -->
				<div class="container-xl icon-user">
					<c:if test="${ userID != null }">
						<button type="button" class="icon-user btn btn-primary none"
							data-toggle="modal" data-target="#login">
							<img class="icon-user"
								src="<c:url value="/assets/images/icons/user48.png"/>"
								alt="icon-user">
						</button>
						<button type="button" class="icon-user-login dropdown-toggle"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<img class="icon-user-login"
								src="<c:url value="/assets/images/icons/emiuuu.jpg"/>"
								alt="icon-user">
						</button>
						<div class="img-dropdown-menu none">
							<img src="<c:url value="/assets/images/icons/triangle-up.png"/>">
						</div>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#">Order</a> <a
								class="dropdown-item" onclick="logout()">Logout</a>
						</div>
					</c:if>
					<c:if test="${ userID == null }">
						<button type="button" class="icon-user btn btn-primary"
							data-toggle="modal" data-target="#login">
							<img class="icon-user"
								src="<c:url value="/assets/images/icons/user48.png"/>"
								alt="icon-user">
						</button>
						<button type="button" class="icon-user btn btn-primary none">
							<img class="icon-user-login"
								src="<c:url value="/assets/images/icons/emiuuu.jpg"/>"
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
								<div class="login_form_container">
									<div class="login_form">
										<h2>Login</h2>
										<div class="input_group">
										
											<i class="fa fa-user"></i> <input type="text" id="username"
												name="username" placeholder="Username" class="input_text"
												autocomplete="off" <c:if test="${ username != '' || username != null }">
													value="${ username }"
												</c:if>/>
										</div>
										<div class="input_group">
											<i class="fa fa-unlock-alt"></i> <input type="password"
												id="password" name="password" placeholder="Password"
												class="input_text" autocomplete="off" <c:if test="${ password != '' || password != null }">
													value="${ password }"
												</c:if>
												/>
												
												
										</div>
										<div class="form-check">

											<input class="form-check-input" type="checkbox"
												name="rememberme" value="" id="flexCheckChecked"
												<c:if test="${rememberme != null && rememberme=='true' }">
											<c:out value="checked"></c:out>
											</c:if>>
											<label class="form-check-label" for="flexCheckChecked">
												Remember me </label>
										</div>
										<div class="button_group" id="login_button">
											<a onclick="login()">Login</a>
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
				</div>
				<!--####################################   btn CART    ################################################# -->
				<div class="container-xl icon-cart">
					<a href="/Shoes/cart">
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
							<li><a class="menu" href="/Shoes"><b>Home</b></a></li>
							<li><a href="/Shoes/products" class="desktop-link menu"><b>Shoes</b></a>
								<ul>
									<c:forEach var="li_style" items="${ style }" varStatus="index">
										<c:if test="${ index.getIndex() < 9 }">
											<li><a class="menu"
												href="http://localhost:8888/Shoes/products?stylename=${ li_style.id }">${ li_style.style_name }</a></li>
										</c:if>
									</c:forEach>
									<li><a href="" class="desktop-link menu">More</a>
										<ul class="more-shoes">
											<c:forEach var="li_style" items="${ style }"
												varStatus="index">
												<c:if test="${ index.getIndex() >= 9 }">
													<li><a class="menu"
														href="http://localhost:8888/Shoes/products?stylename=${ li_style.id }">${ li_style.style_name }</a></li>
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
							<li><a href="/Shoes/news" class="desktop-link menu"><b>News</b></a>
								<ul>
									<li><a class="menu" href="#">Newest</a></li>
									<li><a class="menu" href="#">Hot</a></li>
									<li><a class="menu" href="#">Trending</a></li>
								</ul></li>
							<li><a class="menu" href="/Shoes/questions"><b>Questions</b></a></li>
							<li><a class="menu" href="/Shoes/contact"><b>Contact</b></a></li>
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

			<div class="header-slide">
				<div class="slider">
					<div class="slides">
						<!--radio buttons start-->
						<input type="radio" name="radio-btn" id="radio1"> <input
							type="radio" name="radio-btn" id="radio2"> <input
							type="radio" name="radio-btn" id="radio3"> <input
							type="radio" name="radio-btn" id="radio4">

						<!--radio buttons end-->
						<!--slide images start-->
						<div class="slide first">
							<img src="<c:url value="/assets/images/slide/bg2.jpg"/>" alt="">
						</div>
						<c:forEach var="item" items="${ slides }" varStatus="index">
							<div class="slide">
								<img src="<c:url value="/assets/images/slide/${ item.img }"/>"
									alt="">
							</div>
						</c:forEach>



						<!--slide images end-->
						<!--automatic navigation start-->
						<div class="navigation-auto">
							<div class="auto-btn1"></div>
							<div class="auto-btn2"></div>
							<div class="auto-btn3"></div>
							<div class="auto-btn4"></div>
						</div>
						<!--automatic navigation end-->
					</div>
					<!--manual navigation start-->
					<div class="navigation-manual">
						<label for="radio1" class="manual-btn"></label> <label
							for="radio2" class="manual-btn"></label> <label for="radio3"
							class="manual-btn"></label> <label for="radio4"
							class="manual-btn"></label>
					</div>
					<!--manual navigation end-->
				</div>
				<!--image slider end-->
			</div>

			<div class="container-xl freeship">
				<img src="<c:url value="/assets/images/icons/freeship64.png"/>"
					alt="icon-freeship">
				<div class="show2">Free ship</div>
				<br>
				<div class="show1">Free shipping for orders > $50</div>
			</div>

			<div class="container-xl payment">
				<img src="<c:url value="/assets/images/icons/payment.png"/>"
					alt="icon-freeship">
				<div class="show2">Payment COD</div>
				<br>
				<div class="show1">Payment on delivery (COD)</div>


			</div>

			<div class="container-xl vip">
				<img src="<c:url value="/assets/images/icons/vip.png"/>"
					alt="icon-freeship">
				<div class="show2">VIP Customers</div>
				<br>
				<div class="show1">Offers for VIP customers</div>


			</div>

			<div class="container-xl warranty">
				<img src="<c:url value="/assets/images/icons/warranty64.png"/>"
					alt="icon-warranty">
				<div class="show2">Warranty Suppor</div>
				<br>
				<div class="show1">Exchange, repair at all stores</div>
			</div>
			<!-- ###########################     SECTION 0 - NEW ARRIVALS  ################################################### -->
			<div class="section">
				<div class="h">NEW ARRIVALS</div>
				<div class="position-product">

					<c:forEach var="it" items="${ listNewArrivals }" varStatus="index">
						<div class="products-el">
							<c:if test="${ it.discount > 0 }">
								<div class="img-product-products zoom zoo" id="ex1"
									name="${it.discount }%" style="">
									<img
										src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
										alt="img-product">
								</div>
							</c:if>
							<c:if test="${ it.discount <= 0 }">
								<div class="img-product-products zoom" id="ex1"
									name="${it.discount }%" style="">
									<img
										src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
										alt="img-product">
								</div>
							</c:if>
							<div class="content-product-products">
								<div class="brand-product-products">${ it.style.style_name }</div>
								<div class="name-product-products">${ it.title }</div>
								<div class="show-products">
									<div class="price-product-products">
										<c:if test="${ it.discount > 0}">
											<div class="price-sale-products">
												$
												<fmt:formatNumber
													value="${it.price - it.price*it.discount/100 }"
													type="number" maxFractionDigits="2" />
											</div>
											<div class="price-old-products">
												<b>$${ it.price }</b>
											</div>
										</c:if>
										<c:if test="${ it.discount <= 0}">
											<div class="price-sale-products">$${ it.price }</div>
										</c:if>

									</div>
									<div class="rate-product-products">
										5.0
										<div class="img-rate-product-products">
											<img src="<c:url value="/assets/images/icons.star24.png"/>"
												alt="">
										</div>
										| Sold (${ it.sold })
									</div>
									<div class="favorite-product-products">
										<c:set var="vfirstColor" value="${ firstColor }"></c:set>
										<div class="show-function" style="margin-left: 5px;">
											<button class="favorite-product">
												<img class="shadow-1"
													src="<c:url value="/assets/images/icons/favorite32.png"/>"
													alt="favorite32">
											</button>
											<button type="submit" class="add-to-cart" name="add-to-cart"
												value="${ it.id }">
												<img class="shadow-2"
													src="<c:url value="/assets/images/icons/addcart32.png"/>"
													alt="addcart32">
											</button>


											<button class="buy-now" class="shadow-1">
												<a
													href="/Shoes/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod=${ it.id }">Buy
													now</a>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
			<div class="img_poster-new-arrivals container-xl">
				<img
					src="<c:url value="/assets/images/poster/poster_new_arrivals.jpg"/>"
					class="img_poster-new-arrivals img-fluid"
					alt="img_poster-new-arrivals">
				<div class="content-poster container-xl">
					<span class="line1-poster">New Year, New Shoes</span> <br> <span
						class="line2-poster"><p>See what just hit the site from
							your favorite</p></span> <br> <span class="line3-poster">famous
						brands</span> <br> <a class="poster" id="a-poster" href="#">SHOP
						NEW ARRIVALS</a>
				</div>
			</div>

			<!-- ###########################     SECTION 3 - MOST LOVED PRODUCTS     ################################################### -->
			<div class="section-3">
				<div class="h">MOST LOVED PRODUCTS</div>
				<div class="position-product-effect">
					<div class="swiper mySwiper">
						<div class="swiper-wrapper">

							<c:forEach var="item" items="${ listMostLovedProducts}"
								varStatus="index">
								<div class="swiper-slide">
									<div class="effect">
										<c:if test="${ item.discount > 0 }">
											<div class="zoom-most-loved zoo" id="ee${ index.getIndex() }"
												name="${item.discount }%">
												<img class="product-effect"
													src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
											</div>
										</c:if>
										<c:if test="${ item.discount <= 0 }">
											<div class="zoom-most-loved" id="ee${ index.getIndex() }"
												name="${item.discount }%">
												<img class="product-effect"
													src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
											</div>
										</c:if>
										<div class="content-effect">
											<div class="details">
												<a class="product-link-effect" href="#"><p
														class="name-product-effect">${ item.title }</p></a>
												<div class="fun-hover-effect">
													<div class="price-effect">
														<c:if test="${ item.discount > 0}">
															<p class="price-sale-effect">
																<b>$<fmt:formatNumber
																		value="${item.price + item.price*item.discount/100 }"
																		type="number" maxFractionDigits="2" /></b>
															</p>
															<p class="price-old-effect"
																style="text-decoration-line: line-through;">
																<b>$${ item.price}</b>
															</p>
														</c:if>
														<c:if test="${ item.discount <= 0}">
															<p class="price-sale-effect">
																<b>$${ item.price}</b>
															</p>
														</c:if>


													</div>
													<div class="rate-product-effect">
														<div class="rate-effect">
															4.8 <img class="star-rate-effect"
																src="<c:url value="/assets/images/icons/star24.png"/>"
																alt="img-product"> | Sold ${ item.sold }
														</div>
													</div>
													<div class="favorite-product-products-effect">
														<div class="show-function-effect">
															<button class="favorite-effect">
																<img
																	src="<c:url value="/assets/images/icons/favorite32.png"/>"
																	alt="favorite32">
															</button>
															<button class="add-to-cart-effect">
																<img
																	src="<c:url value="/assets/images/icons/addcart32.png"/>"
																	alt="addcart32">
															</button>
															<button class="buy-effect">
																<a
																	href="/Shoes/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod=${ item.id }">
																	Buy now</a>
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>


						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>

			</div>
			<!-- ###########################     SECTION 1 - SELL SAME PRICE    ################################################### -->
			<div class="section-1">
				<div class="h">SELL SAME PRICE</div>
				<div class="position-product container-xl">
					<c:forEach var="it" items="${ listNewArrivals }" varStatus="">
						<div class="products-el">

							<c:if test="${ it.discount > 0 }">
								<div class="img-product-products zoom-same-price-product zoo"
									id="exe${ index.getIndex() }" name="${ it.discount }%">
									<img
										src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
										alt="">
								</div>
							</c:if>
							<c:if test="${ it.discount <= 0 }">
								<div class="img-product-products zoom-same-price-product"
									id="exe${ index.getIndex() }">
									<img
										src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
										alt="">
								</div>
							</c:if>
							<div class="content-product-products">
								<div class="brand-product-products">${ it.style.style_name }</div>
								<div class="name-product-products">${ it.title }</div>
								<div class="show-products">
									<div class="price-product-products">
										<c:if test="${ it.discount > 0}">
											<div class="price-sale-products">
												$
												<fmt:formatNumber
													value="${it.price+ it.price*it.discount/100 }"
													type="number" maxFractionDigits="2" />
											</div>
											<div class="price-old-products">$${ it.price }</div>
										</c:if>
										<c:if test="${ it.discount <= 0}">
											<div class="price-sale-products">$${ it.price }</div>
										</c:if>
									</div>
									<div class="rate-product-products">
										5.0
										<div class="img-rate-product-products">
											<img src="<c:url value="/assets/images/icons.star24.png"/>"
												alt="">
										</div>
										| Sold (${ it.sold })
									</div>
									<div class="favorite-product-products">
										<div class="show-function">
											<button class="favorite-product">
												<img class="shadow-1"
													src="<c:url value="/assets/images/icons/favorite32.png"/>"
													alt="favorite32">
											</button>
											<button class="add-to-cart">
												<img class="shadow-2"
													src="<c:url value="/assets/images/icons/addcart32.png"/>"
													alt="addcart32">
											</button>
											<button class="buy-now" class="shadow-1">
												<a
													href="/Shoes/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod=${ it.id }">
													Buy now</a>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
				<div class="poster2 container-xl">
					<img src="<c:url value="/assets/images/poster/poster2.jpg"/>"
						class="poster2 img-fluid" alt="img_poster2">
					<div class="content-poster2 container-xl">
						<a class="poster2-1"></a> <a class="poster2 hidden-poster2"
							id="a-poster" href="#">SHOP NOW</a>
					</div>
				</div>
			</div>

			<div class="section-2">
				<div class="h">NEWS</div>
				<div class="position-product">
					<c:forEach var="item" items="${ listNewsHomeLeft }">
						<a href="#">
							<div class="left-news">
								<img class="img-fluid img-news"
									src="<c:url value="/assets/images/news/${ item.image }"/>"
									alt="image-news">
								<fmt:formatDate value="${ item.post_date }"
									pattern="yyyy, MMM dd" var="post_date" />
								<div class="news-content-left">
									${ post_date } - by ${ item.by_name } <br> <span
										class="news-name"> ${ item.title } </span>
									<c:set var="string1" value="${item.content }" />
									<c:set var="string2" value="${fn:substring(string1, 0, 150)}" />
									<div class="news-desription">${string2}...</div>
								</div>
							</div>
						</a>
					</c:forEach>
					<div class="right-news">
						<c:forEach var="item" items="${ listNewsHomeRight }">
							<a href="#">
								<div class="sub-news">
									<img class="img-fluid img-news1"
										src="<c:url value="/assets/images/news/${ item.image }"/>"
										alt="image-news">
									<fmt:formatDate value="${ item.post_date }"
										pattern="yyyy, MMM dd" var="post_date" />
									<div class="news-content">
										${ post_date } - by ${ item.by_name } <br> <span
											class="news-name"> ${ item.title } </span>
										<c:set var="string1" value="${item.content }" />
										<c:set var="string2" value="${fn:substring(string1, 0, 100)}" />
										<div class="news-desription">${string2}...</div>
									</div>
								</div>
							</a>
						</c:forEach>

					</div>
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
			<div class="footer-copyright">T&T SHOES © 2022 All rights
				reserved.</div>
		</form>
	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		 $(".form-check-input").click(function(){
			 var rememberme = this.checked;
			  var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/Shoes/home?rememberme="+rememberme);
				// What to do when server responds
				xhr.onload = function() {
					//window.location.assign("http://localhost:8888/Shoes/");
				};
				xhr.send();
		  });
		  
	});
</script>
	<script>
	
	function logout() {
		$(document).ready(function(){
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"http://localhost:8888/Shoes/home?logout=true");
			// What to do when server responds
			xhr.onload = function() {
				window.location.assign("http://localhost:8888/Shoes/");
			};
			xhr.send();
		});
	}
	</script>
	<script>
		$(document).ready(function(){
		  $(".dropdown-toggle").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		  $(".dropdown-item").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		  $(".img-dropdown-menu").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		});
	</script>
	<script>
		if(${userID == null }) {
			$(document).ready(function() {
				if(${message != "logout"}) {
					$('#login').modal('toggle');
				}
			});
		}
	</script>
	<script type="text/javascript">
	
	if(${ message != null }) {
		if(${message == "true"}) {
			alert("Welcome to Ti Shoes!");
		} else if(${message == "false"}){
			alert("Login unsuccess!");
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
		} else if(${message == "logout"}) {
			alert("Looking forward to seeing you again soon!");
		}
	}
		function login() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			if (username=="" || password=="") {
				alert("Username or password is empty");
			} else {
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/Shoes/home?username="
								+ username +"&password="+password);
				// What to do when server responds
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/Shoes/");
				};
				xhr.send();
			}
			
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

	<script src="<c:url value="/assets/js/jquery.zoom.js"/>"></script>
	<script>
		var div1 = document.getElementsByClassName('zoom');
		$(document).ready(function() {
			for (let i = 0; i < div1.length; i++) {
				$(div1[i]).zoom();
			}
		});
		var div2 = document.getElementsByClassName('zoom-most-loved');
		$(document).ready(function() {
			for (let i = 0; i < div2.length; i++) {
				$(div2[i]).zoom();
			}
		});
		var div3 = document.getElementsByClassName('zoom-same-price-product');
		$(document).ready(function() {
			for (let i = 0; i < div3.length; i++) {
				$(div3[i]).zoom();
			}
		});
	</script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"/>"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"/>"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="<c:url value="js/login.js"/>"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"/>"></script>
	<script
		src="<c:url value="https://kit.fontawesome.com/a076d05399.js"/>"></script>

</body>

</html>