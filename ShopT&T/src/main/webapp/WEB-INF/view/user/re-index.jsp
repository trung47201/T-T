<!DOCTYPE html>
<html lang="en">
<title>Who are you? :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href='<c:url value="/assets/css/bootstrap.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/js/bootstrap.js"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/re-index.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/login-icon.css"/>'>
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
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">

<link rel="stylesheet"
	href="<c:url value="/assets/css/re-headers.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/re-menu.css"/>">
<style>
body::-webkit-scrollbar {
	width: 15px;
}
/* Track */
body::-webkit-scrollbar-track {
	border-radius: 10px;
	box-shadow: inset 0 0 5px #0086ff;
}
/* Handle */
body::-webkit-scrollbar-thumb {
	background: #ccc;
	border-radius: 10px;
}
/* Handle on hover */
body::-webkit-scrollbar-thumb:hover {
	background: #cb82a9;
}

.manual-btn {
	border: 2px solid black !important;
}

.wrapper-nav {
	width: 100%;
	display: flex;
	height: 100%;
	justify-content: space-between;
	align-items: center;
}

.nav-mid-img {
	position: absolute;
	border-radius: 500px;
	left: calc(50% - 80px);
	border: 5px solid #f5c6dc;
	top: 30px;
	transition: all .5s ease-out;
}

.nav-mid-img:hover, .nav-mid-img img:hover {
	cursor: pointer;
}

.nav-mid-img img {
	width: 160px;
	border-radius: 500px;
	border: 2px solid white;
	transition: all .7s ease-out;
}

.nav-c {
	display: flex;
	height: 90px;
	align-items: center;
	padding: 0 60px;
	width: 100%;
}

.nav-btn {
	display: flex;
	width: 120px;
	justify-content: space-between;
}

.nav-left {
	width: 40%;
}

.nav-left ul li.link:hover {
	color: #cb82a9 !important;
	text-decoration: none;
}

.nav-btn i:hover {
	color: #cb82a9;
	cursor: pointer;
}
.back-header {
    position: sticky;
    top: -40px;
    z-index: 100;
    background: white;
    box-shadow: 0 1px 5px black;
}
.list-menu ul li {
	list-style-type: none; /* Remove bullets */
	padding: 0;
	margin: 0;
	margin-bottom: 15px;
}

.list-menu {
    margin-left: 60px;
    margin-top: 10px;
    
}
.menu {
    width: 0;
    transition: all .25s ease-out;
    overflow-y: auto;
}

.list-menu a {
	color: black;
}

.list-menu a:hover {
    cursor: pointer;
    color: #cb82a9 !important;
    text-decoration: none;
}

.menu-contact i{
	color: #4a4a4a;
	font-size: 24px;
    margin-left: 2px;
}


.menu-contact a {
    width: 41px;
    border: 1px solid black;
    display: flex;
    height: 41px;
    border-radius: 20px;
    justify-content: center;
    align-items: center;
}
.menu-contact a:hover {
	cursor: pointer;
    background: #f9e1ee !important;
    text-decoration: none;
    border: 0;
}

.menu-contact {
	justify-content: space-between;
    display: flex;
    margin: 40px 60px;
}
</style>

<body style="color: black;">
	<!--  cart  -->
	<jsp:include page="../layouts/user/re-menu.jsp"></jsp:include>

	
		<div class="back-header">
			<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
		</div>
<header class="container-xl header-content">
		<!-- important -->
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

					<c:forEach var="item" items="${ slides }" varStatus="index">
						<c:if test="${ index.getIndex() == 0 }">
							<div class="slide first">
								<img src="<c:url value="/assets/images/slides/${ item.img }"/>"
									alt="">
							</div>
						</c:if>
						<c:if test="${ index.getIndex() != 0 }">
							<div class="slide">
								<img src="<c:url value="/assets/images/slides/${ item.img }"/>"
									alt="">
							</div>
						</c:if>
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
					<label for="radio1" class="manual-btn"></label> <label for="radio2"
						class="manual-btn"></label> <label for="radio3" class="manual-btn"></label>
					<label for="radio4" class="manual-btn"></label>
				</div>
				<!--manual navigation end-->
			</div>
			<!--image slider end-->
		</div>

		<!-- ###########################     SECTION 0 - NEW ARRIVALS  ################################################### -->
		<div class="section">
			<div class="h">NEW ARRIVALS</div>
			<div class="position-product">

				<c:forEach var="it" items="${ listNewArrivals }" varStatus="index">
					<div class="products-el">
						<c:if test="${ userID == null }">
							<c:if test="${ it.discount > 0 }">
								<a
									href="http://localhost:8888/SpringMVC/product-details?product-id=${ it.id }">
									<div class="img-product-products zoom zoo" id="ex1"
										name="${it.discount }%" style="">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="img-product">
									</div>
								</a>
							</c:if>
							<c:if test="${ it.discount <= 0 }">
								<a
									href="http://localhost:8888/SpringMVC/product-details?product-id=${ it.id }">
									<div class="img-product-products zoom" id="ex1"
										name="${it.discount }%" style="">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="img-product">
									</div>
								</a>
							</c:if>
						</c:if>
						<c:if test="${ userID != null }">
							<c:if test="${ it.discount > 0 }">
								<a
									href="http://localhost:8888/SpringMVC/product-details/${ id_user }_${ it.id }">
									<div class="img-product-products zoom zoo" id="ex1"
										name="${it.discount }%" style="">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="img-product">
									</div>
								</a>
							</c:if>
							<c:if test="${ it.discount <= 0 }">
								<a
									href="http://localhost:8888/SpringMVC/product-details/${ id_user }_${ it.id }">
									<div class="img-product-products zoom" id="ex1"
										name="${it.discount }%" style="">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="img-product">
									</div>
								</a>
							</c:if>
						</c:if>
						<div class="content-product-products">
							<div class="brand-product-products">${ it.style.style_name }</div>
							<div class="name-product-products">
								<c:if test="${ userID != null }">
									<a
										href="http://localhost:8888/SpringMVC/product-details/${ id_user }_${ it.id }">${ it.title }</a>
								</c:if>
								<c:if test="${ userID == null }">
									<a
										href="http://localhost:8888/SpringMVC/product-details?product-id=${ it.id }">${ it.title }</a>
								</c:if>
							</div>
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
										<button type="button" class="add-to-cart" name="add-to-cart"
											id="add-to-cart" value="${ it.id }">
											<img class="shadow-2"
												src="<c:url value="/assets/images/icons/addcart32.png"/>"
												alt="addcart32">
										</button>
										<button class="buy-now" class="shadow-1" id="${ it.id }">Buy
											now</button>
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
									<c:if test="${ userID != null }">
										<c:if test="${ item.discount > 0 }">
											<a
												href="http://localhost:8888/SpringMVC/product-details/${ id_user }_${ item.id }">
												<div class="zoom-most-loved zoo"
													id="ee${ index.getIndex() }" name="${item.discount }%">
													<img class="product-effect"
														src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
												</div>
											</a>
										</c:if>
										<c:if test="${ item.discount <= 0 }">
											<a
												href="http://localhost:8888/SpringMVC/product-details/${ id_user }_${ item.id }">
												<div class="zoom-most-loved" id="ee${ index.getIndex() }"
													name="${item.discount }%">
													<img class="product-effect"
														src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
												</div>
											</a>
										</c:if>
									</c:if>
									<c:if test="${ userID == null }">
										<c:if test="${ item.discount > 0 }">
											<a
												href="http://localhost:8888/SpringMVC/product-details?product-id=${ item.id }">
												<div class="zoom-most-loved zoo"
													id="ee${ index.getIndex() }" name="${item.discount }%">
													<img class="product-effect"
														src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
												</div>
											</a>
										</c:if>
										<c:if test="${ item.discount <= 0 }">
											<a
												href="http://localhost:8888/SpringMVC/product-details?product-id=${ item.id }">
												<div class="zoom-most-loved" id="ee${ index.getIndex() }"
													name="${item.discount }%">
													<img class="product-effect"
														src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
												</div>
											</a>
										</c:if>
									</c:if>
									<div class="content-effect">
										<div class="details">
											<a class="product-link-effect"
												href="http://localhost:8888/SpringMVC/product-details?product-id=${ item.id }"><p
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
														<button class="add-to-cart-effect" id="add-to-cart-effect"
															value="${ item.id }">
															<img
																src="<c:url value="/assets/images/icons/addcart32.png"/>"
																alt="addcart32">
														</button>
														<button class="buy-effect" id="${ item.id }">Buy
															now</button>
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
						<c:if test="${ userID == null }">
							<c:if test="${ it.discount > 0 }">
								<a
									href="http://localhost:8888/SpringMVC/product-details?product-id=${ it.id }">
									<div class="img-product-products zoom-same-price-product zoo"
										id="exe${ index.getIndex() }" name="${ it.discount }%">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="">
									</div>
								</a>
							</c:if>
							<c:if test="${ it.discount <= 0 }">
								<a
									href="http://localhost:8888/SpringMVC/product-details/${ id_user }_${ it.id }">
									<div class="img-product-products zoom-same-price-product"
										id="exe${ index.getIndex() }">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="">
									</div>
								</a>
							</c:if>
						</c:if>
						<c:if test="${ userID != null }">
							<c:if test="${ it.discount > 0 }">
								<a
									href="http://localhost:8888/SpringMVC/product-details/${ id_user }_${ it.id }">
									<div class="img-product-products zoom-same-price-product zoo"
										id="exe${ index.getIndex() }" name="${ it.discount }%">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="">
									</div>
								</a>
							</c:if>
							<c:if test="${ it.discount <= 0 }">
								<a
									href="http://localhost:8888/SpringMVC/product-details/${ id_user }_${ it.id }">
									<div class="img-product-products zoom-same-price-product"
										id="exe${ index.getIndex() }">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="">
									</div>
								</a>
							</c:if>
						</c:if>
						<div class="content-product-products">
							<div class="brand-product-products">${ it.style.style_name }</div>
							<a
								href="http://localhost:8888/SpringMVC/product-details?product-id=${ it.id }">
								<div class="name-product-products">${ it.title }</div>
							</a>
							<div class="show-products">
								<div class="price-product-products">
									<c:if test="${ it.discount > 0}">
										<div class="price-sale-products">
											$
											<fmt:formatNumber
												value="${it.price+ it.price*it.discount/100 }" type="number"
												maxFractionDigits="2" />
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
										<button class="add-to-cart" id="add-to-cart"
											value="${ it.id }">
											<img class="shadow-2"
												src="<c:url value="/assets/images/icons/addcart32.png"/>"
												alt="addcart32">
										</button>
										<button class="buy-now" class="shadow-1" id="${ it.id }">
											Buy now</button>
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
	</header>

	<jsp:include page="../layouts/user/footer.jsp"></jsp:include>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<script> // add to cart
		var id_user = "";
		if(${ id_user != null }) {
			id_user = "${ id_user }";
		}
		if(id_user != "") {
			$(".add-to-cart").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/add-to-cart/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart/"+id_user);
				};
				xhr.send();
			});
			$(".add-to-cart-effect").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/add-to-cart/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart/"+id_user);
				};
				xhr.send();
			});
		} else {
			$(".add-to-cart").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/cart?id="+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart");
				};
				xhr.send();
			});
			$(".add-to-cart-effect").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/cart?id="+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart");
				};
				xhr.send();
			});
		}
	</script>
	<script> // buy now
		var id_user = "";
		if(${ id_user != null }) {
			id_user = "${ id_user }";
		}
		if(id_user != "") {
			$(".buy-now").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/cart/checkout/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart/checkout/"+id_user+"_"+id_prod);
				};
				xhr.send();
			});
			
			$(".buy-effect").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/cart/checkout/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart/checkout/"+id_user+"_"+id_prod);
				};
				xhr.send();
			});
		} else {
			$(".buy-now").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/cart/checkout/"+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart/checkout/"+id_prod);
				};
				xhr.send();
			});
			
			$(".buy-effect").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/cart/checkout/"+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart/checkout/"+id_prod);
				};
				xhr.send();
			});
		}
	</script>


	<script type="text/javascript"> // msg search input empty
	$("#search-link-icon").click(function () {
		var txt = $('#search').val();
		if(txt == "") {
			$("#wrapper-search").removeClass("importantNone");
			$("#welcome-search").removeClass("none");
			$("#welcome-search h3").html("You have not entered search information!");
		} else {
			$("#search-link-icon").attr("type", "submit");
		}
	});
	</script>

	<script>
	$(".ok-btn").click(function () {
		$(".welcome").addClass("none");
		$(".wrapper-wel").addClass("importantNone");
	});
	</script>



	<script>
	function logout() {
		$(document).ready(function(){
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"http://localhost:8888/SpringMVC/home?logout=true");
			xhr.onload = function() {
				window.location.assign("http://localhost:8888/SpringMVC/");
			};
			xhr.send();
		});
	}
	</script>
	<!-- <script>
		if(${userID == null }) {
			$(document).ready(function() {
				if(${message != "logout"}) {
					$('#login').modal('toggle');
				}
			});
		}
	</script> -->
	<script type="text/javascript">
	
	if(${ message != null }) {
		if(${message == "true"}) {
			//alert("Welcome to Ti Shoes!");
		} else if(${message == "false"}){
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Username or password is not correct!";  
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
		} else if(${message == "logout"}) {
			//alert("Looking forward to seeing you again soon!");
		} else if(${message == "block"}){
			document.getElementById("login_form_container").style.maxHeight = "550px";
			document.getElementById("login_form_container").style.height = "550px";
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Your account has been locked, please contact hotline: 0346 643 755 for more details!";  
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
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