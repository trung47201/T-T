<!DOCTYPE html>
<html lang="en">
<title>Let's buy :)</title>
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
<link rel="stylesheet"
	href='<c:url value="/assets/css/product_details.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/btn-effect.css"/>'>

<body style="color: white;">
	<header class="container-xl header-content">
		<form method="post">
			<div class="container-xl header-1">
				<a href="/SpringMVC"><img class="img-fluid logo-header"
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
					<a href="/SpringMVC/cart">
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
							<li><a class="menu" href="/SpringMVC"><b>Home</b></a></li>
							<li><a href="/SpringMVC/products" class="desktop-link menu"><b>Shoes</b></a>
								<ul>
									<c:forEach var="li_style" items="${ style }" varStatus="index">
										<c:if test="${ index.getIndex() < 9 }">
											<li><a class="menu"
												href="http://localhost:8888/SpringMVC/products?stylename=${ li_style.id }">${ li_style.style_name }</a></li>
										</c:if>
									</c:forEach>
									<li><a href="" class="desktop-link menu">More</a>
										<ul class="more-shoes">
											<c:forEach var="li_style" items="${ style }"
												varStatus="index">
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
							<li><a class="menu" href="/SpringMVC/questions"><b>Questions</b></a></li>
							<li><a class="menu" href="/SpringMVC/contact"><b>Contact</b></a></li>
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


			<div class="title-page">
				<h3>Product Details</h3>
				<span><a href="home">Home</a> / <a href="products">Products</a>
					/ <a href="product-details">Product Details</a></span>
			</div>
			<!--####################################   btn CART    ################################################# -->
			<div class="wrapper-product_details">
				<div class="hover-img-product-details">
					<div class="img-product-details-hover">
						<c:forEach var="listGallery" items="${ gallery }"
							varStatus="index">
							<c:if test="${ index.getIndex() == 0 }">
								<div class="img-hover first-hover" id="${ listGallery.thumbnail }">
									<img src="<c:url value="/assets/images/products/${ listGallery.thumbnail }"/>"
										alt="image">
								</div>
							</c:if>
							<c:if test="${ index.getIndex() != 0 }">
								<div class="img-hover" id="${ listGallery.thumbnail }">
									<img src="<c:url value="/assets/images/products/${ listGallery.thumbnail }"/>"
										alt="image">
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="img-product-details">
						<img id="image-hover"
							src="<c:url value="/assets/images/products/${ product.thumbnail }"/>"
							alt="image">
					</div>
				</div>
				<div class="product-details-infor">
					<div class="title-product-details">
						<h4>${ product.title }</h4>
						<div class="icon-favorite">
							<img id="image-favorite-hover"
								src="<c:url value="/assets/images/icons/favorite48.png"/>"
								alt="image" onclick="favorite(this)">
						</div>
					</div>
					<div class="stylename-product-details">
						<p>${ product.style.style_name }</p>
					</div>
					<div class="rate-product-details">
						<p>${ averageRating }</p>
						<img src="<c:url value="/assets/images/icons/star24.png"/>"
							alt="image">
						<p>| Sold ${ product.sold }</p>
					</div>
					<div class="price-product-details">

						<c:if test="${ product.discount > 0 }">
							<h2>
								$<fmt:formatNumber type="number" maxFractionDigits="2"
									value="${ product.price - product.price * product.discount/100 }" />
							</h2>
							<p>$${ product.price }</p>
						</c:if>
						<c:if test="${ product.discount <= 0 }">
							<h2>$${ product.price }</h2>
						</c:if>


					</div>

					<div class="color-product-details">
						<p>Color: name of color</p>
						<div class="list-color-product-details">
							<c:forEach var="liColor" items="${ listColor }" varStatus="index">
								<c:if test="${ index.getIndex() == 0 }">
									<span class="select-color selected-color" id="${ product.id }_${ liColor.color.id }" style="background: ${ liColor.color.rgb }"></span>
								</c:if>
								<c:if test="${ index.getIndex() != 0 }">
									<span class="select-color" id="${ product.id }_${ liColor.color.id }" style="background: ${ liColor.color.rgb }"></span>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="size-product-details">
						<div class="fit-guide-size">
							<p>Size</p>
							<a href="#"> Size & Fit guide</a>
						</div>
						<c:forEach var="liSize" items="${ listSize }" varStatus="index">
							<c:set var="idProd_Size" value="${ product.id }_${ liSize.key }"></c:set>
							<c:if test="${ index.getIndex() == 0 }">
								<div class="list-size-product-details" id="${ idProd_Size }">
									<c:forEach var="liSizeByColor"  items="${ liSize.value }" varStatus="indexS">
										<c:if test="${ indexS.getIndex() == 0 }">
											<span class="select-size selected-color" id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span> 
										</c:if>
										<c:if test="${ indexS.getIndex() != 0 }">
											<span class="select-size" id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span> 
										</c:if>
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${ index.getIndex() != 0 }">
								<div class="list-size-product-details none" id="${ idProd_Size }">
									<c:forEach var="liSizeByColor"  items="${ liSize.value }" varStatus="indexS">
										<c:if test="${ indexS.getIndex() == 0 }">
											<span class="select-size" id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span> 
										</c:if>
										<c:if test="${ indexS.getIndex() != 0 }">
											<span class="select-size" id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span> 
										</c:if>
									</c:forEach>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="amount-product-details">
						<input class="minus-plus" type="button" name="" id=""
							onclick="amount(this)" value="-"> <input
							class="input_amount" type="text" name="input_amount"
							id="input_amount" value="1"> <input class="minus-plus"
							type="button" name="" id="" onclick="amount(this)" value="+">
					</div>
					<div class="btn-add-buy">
						<div class="btn-add-to-cart">
							<input type="button" name="" id="add-to-cart-input"
								value="Add to cart" onclick="addtocart()">
						</div>
						<div class="btn-buy-now btn-add-to-cart-effect">
							<input type="button" name="" id="buy-now-input" value="Buy now" onclick="buynow()">
						</div>
					</div>

				</div>
			</div>
			<div class="tab-product-details">
				<div class="nav-product-details">
					<div class="btn-nav btn-effect-show" id="btn-reviews">
						<input type="button" id="" name="" value="Reviews">
					</div>
					<div class="btn-nav" id="btn-product-details">
						<input type="button" id="" name="" value="Product Details">
					</div>
					<div class="btn-nav-strike"></div>
				</div>

				<div class="tab-content-prod" id="">
					<div class="reviews-content" id="">
						<div class="list-reviews">
							<div class="customer-reviews">
								<div class="infor-customoer-reviews">
									<div class="avt-customoer-reviews">
										<img src="<c:url value="/assets/images/icons/user48.png"/>"
											alt="image">
									</div>
									<div class="name-customoer-reviews">
										<h6>Dao Thu Teng</h6>
									</div>
								</div>
								<div class="infor-customoer-reviews"></div>
							</div>
							<div class="content-reviews">
								<div class="number-star-rating">
									<img src="<c:url value="/assets/images/icons/star24.png"/>"
										alt="image"> <img
										src="<c:url value="/assets/images/icons/star24.png"/>"
										alt="image"> <img
										src="<c:url value="/assets/images/icons/star24.png"/>"
										alt="image"> <img
										src="<c:url value="/assets/images/icons/star24.png"/>"
										alt="image"> <img
										src="<c:url value="/assets/images/icons/star24.png"/>"
										alt="image">
								</div>
								<div class="date-rating">2022-10-22 12:00 |</div>
								<div class="content-rating">Trước có mượn son hãng này của
									em gái xài thử nên ko nhớ rõ mùi nhưng 2 cây này có mùi hoa
									hồng nhẹ, hơi hăng ko đáng kể. 2 màu lên tay ưng, 940 đúng tone
									màu mình thích, 909 đi tiệc đẹp. Test lên tay thấy ok, lên môi
									có khô hay ko thì chưa biết.</div>
								<div class="img-video-rating">
									<img src="<c:url value="/assets/images/products/0.png"/>"
										alt="img-reviews"> <img
										src="<c:url value="/assets/images/products/0.png"/>"
										alt="img-reviews"> <img
										src="<c:url value="/assets/images/products/0.png"/>"
										alt="img-reviews">
								</div>
								<div class="feedback-rating">
									<h6>Phản Hồi Của Người Bán</h6>
									<p>Cảm ơn bạn đã tin dùng và ủng hộ Perfect Diary, Perfect
										Diary sẽ cố gắng hơn nữa để mang lại trải nghiệm tốt nhất cho
										khách hàng. Bạn đừng quên follow Perfect Diary trên shopee để
										cập nhật nhiều chương trình khuyến mãi! Nếu có vấn đề nào cần
										hỗ trợ đừng ngại ngùng chat với gian hàng bạn nhé.</p>
								</div>
								<div class="connect-rating">
									<div class="favorite-rating">
										<img
											src="<c:url value="/assets/images/icons/favorite24.png"/>"
											alt="image">
									</div>
									<div class="comment-rating">
										<img
											src="<c:url value="/assets/images/icons/icons8-comments-24.png"/>"
											alt="image">
									</div>
									<div class="share-rating">
										<img
											src="<c:url value="/assets/images/icons/icons8-share-24.png"/>"
											alt="image">
									</div>
								</div>
							</div>
						</div>
						<div class="list-reviews">
							<div class="customer-reviews">
								<div class="infor-customoer-reviews">
									<div class="avt-customoer-reviews">
										<img src="images/icons/user48.png" alt="image">
									</div>
									<div class="name-customoer-reviews">
										<h6>Dao Thu Teng</h6>
									</div>
								</div>
								<div class="infor-customoer-reviews"></div>
							</div>
							<div class="content-reviews">
								<div class="number-star-rating">
									<img src="images/icons/star24.png" alt="image"> <img
										src="images/icons/star24.png" alt="image"> <img
										src="images/icons/star24.png" alt="image"> <img
										src="images/icons/star24.png" alt="image"> <img
										src="images/icons/star24.png" alt="image">
								</div>
								<div class="date-rating">2022-10-22 12:00 |</div>
								<div class="content-rating">Trước có mượn son hãng này của
									em gái xài thử nên ko nhớ rõ mùi nhưng 2 cây này có mùi hoa
									hồng nhẹ, hơi hăng ko đáng kể. 2 màu lên tay ưng, 940 đúng tone
									màu mình thích, 909 đi tiệc đẹp. Test lên tay thấy ok, lên môi
									có khô hay ko thì chưa biết.</div>
								<div class="img-video-rating">
									<img src="images/products/0.png" alt="img-reviews"> <img
										src="images/products/0.png" alt="img-reviews"> <img
										src="images/products/0.png" alt="img-reviews">
								</div>
								<div class="feedback-rating">
									<h6>Phản Hồi Của Người Bán</h6>
									<p>Cảm ơn bạn đã tin dùng và ủng hộ Perfect Diary, Perfect
										Diary sẽ cố gắng hơn nữa để mang lại trải nghiệm tốt nhất cho
										khách hàng. Bạn đừng quên follow Perfect Diary trên shopee để
										cập nhật nhiều chương trình khuyến mãi! Nếu có vấn đề nào cần
										hỗ trợ đừng ngại ngùng chat với gian hàng bạn nhé.</p>
								</div>
								<div class="connect-rating">
									<div class="favorite-rating">
										<img src="images/icons/favorite24.png" alt="image">
									</div>
									<div class="comment-rating">
										<img src="images/icons/icons8-comments-24.png" alt="image">
									</div>
									<div class="share-rating">
										<img src="images/icons/icons8-share-24.png" alt="image">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="details-content none" id="">
						<div class="description-product-details" id="">
							<div class="des-title">
								<p>Description</p>
							</div>
							<div class="des-content">&emsp;&nbsp;Lace up and feel the
								legacy with the Nike Air Max 90 LTR. An iconic Waffle outsole
								and moulded plastic accents help these kicks stay true to their
								roots, while Max Air cushioning adds comfort to your every step.
								Crisp leather and soft, textured suede bring a premium look and
								feel to this classic sneaker.</div>
						</div>
						<div class="features-product-details" id="">
							<div class="features-title">
								<p>Features</p>
							</div>
							<div class="features-content">
								<li>Hypoknit upper designed to provide strategic areas of
									stretch and support</li>
								<li>Nylon outsole designed specifically for firm ground use</li>
								<li>Firm ground studs</li>
								<li>Off-set lacing with cored-out canopy to increase strike
									zone and provide lockdown</li>
								<li>Hypoknit mesh collar for a lightweight and breathable
									feel</li>
								<li>3D tongue tab for added grip</li>
								<li>Flying NB wrap-around logo with multi-tone heel graphic</li>
								<li>Designed for athlete Bukayo Saka</li>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="recomment-product"></div>

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


	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
	<script type="text/javascript">
	function buynow () {
		var size = document.getElementsByClassName("select-size");
		var amount = document.getElementById("input_amount").value;
		var txt_size = "";
		for (let i=0; i<size.length; i++) {
			if (size[i].className == "select-size selected-color") {
				txt_size = size[i].id;
			}
		}
		if (txt_size == "") {
			alert("You haven't chosen a size yet");
		} else {
			const myarr = txt_size.split("_");
			var xhr = new XMLHttpRequest();
	      	xhr.open("GET", "http://localhost:8888/SpringMVC/cart/checkout?id_prod="+myarr[0]+"&id_color="+myarr[1]+"&id_size="+myarr[2]);
	      	xhr.onload = function () { 
	      		window.location.assign("http://localhost:8888/SpringMVC/cart/checkout?id_prod="+myarr[0]+"&id_color="+myarr[1]+"&id_size="+myarr[2]);
	      	};
	      	xhr.send();
		}
	}
	function addtocart () {
		var size = document.getElementsByClassName("select-size");
		var amount = document.getElementById("input_amount").value;
		var txt_size = "";
		for (let i=0; i<size.length; i++) {
			if (size[i].className == "select-size selected-color") {
				txt_size = size[i].id;
			}
		}
		if (txt_size == "") {
			alert("You haven't chosen a size yet");
		} else {
			var xhr = new XMLHttpRequest();
	      	xhr.open("GET", "http://localhost:8888/SpringMVC/cart?product="+txt_size);
	      	xhr.onload = function () { 
	      		window.location.assign("http://localhost:8888/SpringMVC/cart");
	      	};
	      	xhr.send();
		}
	}
	</script>
		
	<script type="text/javascript">
		var sizes = document.getElementsByClassName("select-size");
		$(document).ready(function() {
			$(".select-size").click(function() {
				for (let i=0; i<sizes.length; i++) {
					if (sizes[i].id == this.id) {
						$(this).addClass("selected-color");
					} else {
						$(sizes[i]).removeClass("selected-color");
					}
				}
				
			});
		});
	</script>
	<script type="text/javascript">
		var size = document.getElementsByClassName("list-size-product-details");
		var color = document.getElementsByClassName("select-color");
		var sizes = document.getElementsByClassName("select-size");
		$(document).ready(function() {
			$(".select-color").click(function() {
				for (let i=0; i<color.length; i++) {
					if (color[i].id == this.id) {
						$(this).addClass("selected-color");
					} else {
						$(color[i]).removeClass("selected-color");
						for (let j=0; j<sizes.length; j++) {
							$(sizes[j]).removeClass("selected-color");
						}
					}
				}
				for (let i=0; i<size.length; i++) {
					if (size[i].id == this.id) {
						$(size[i]).removeClass("none");
					} else {
						$(size[i]).addClass("none");
					}
				}
			});
		});
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
	
	<script>
		$(document).ready(function() {
			$(".btn-nav").hover(function() {

				if (this.id == "btn-reviews") {
					//show-hide border bottom nav
					$(this).addClass("btn-effect-show");
					$("#btn-product-details").removeClass("btn-effect-show");
					//show-hide content
					$(".details-content").addClass("none");
					$(".reviews-content").removeClass("none");
				} else if (this.id == "btn-product-details") {
					//show-hide border bottom nav
					$(this).addClass("btn-effect-show");
					$("#btn-reviews").removeClass("btn-effect-show");
					//show-hide content
					$(".details-content").removeClass("none");
					$(".reviews-content").addClass("none");
				}
			}), function() {

			};
		});
	</script>
	<script>
		$(document).ready(function() {
			$(".btn-add-to-cart").hover(function() {
				$(".btn-add-to-cart").addClass("btn-add-to-cart-effect");
				$(".btn-buy-now").removeClass("btn-add-to-cart-effect");
			});
		});
		$(document).ready(function() {
			$(".btn-buy-now").hover(function() {

				$(".btn-buy-now").addClass("btn-add-to-cart-effect");
				$(".btn-add-to-cart").removeClass("btn-add-to-cart-effect");
			});
		});
	</script>
	<script>
		function favorite(x) {
			let txt = x.src;
			var root = window.location.origin;
			if (txt.includes("/assets/images/icons/favorite48red.png")) {
				x.setAttribute('src', root
						+ '/SpringMVC/assets/images/icons/favorite48.png');
			} else {
				x.setAttribute('src', root
						+ '/SpringMVC/assets/images/icons/favorite48red.png');
			}
		}
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$(".btn-add-to-cart")
									.hover(
											function() {
												document
														.getElementById("add-to-cart-input").style.background = "#0086ff";
												document
														.getElementById("add-to-cart-input").style.color = "white";

												document
														.getElementById("add-to-cart-input").style.cursor = "pointer";
												document
														.getElementById("buy-now-input").style.background = "white";
												document
														.getElementById("buy-now-input").style.color = "#0086ff";
											}, function() {

											});
						});
		$(document)
				.ready(
						function() {
							$(".btn-buy-now")
									.hover(
											function() {
												document
														.getElementById("add-to-cart-input").style.background = "white";
												document
														.getElementById("add-to-cart-input").style.color = "#0086ff";

												document
														.getElementById("buy-now-input").style.background = "#0086ff";
												document
														.getElementById("buy-now-input").style.color = "white";
												document
														.getElementById("buy-now-input").style.cursor = "pointer";
											}, function() {

											});
						});
	</script>
	<script>
		var root = window.location.origin;
		const arr = document.getElementsByClassName("img-hover");
		$(document)
				.ready(
						function() {
							$(".img-hover")
									.hover(
											function() {
												document
														.getElementById("image-hover").src = root
														+ "/SpringMVC/assets/images/products/"
														+ this.id;
												document
														.getElementById(this.id).style.boxShadow = "-1px -1px 10px #ff523E";
												if (arr[i].id != this.id) {
													document
															.getElementById(arr[i].id).style.boxShadow = "none";
												}

											},
											function() {
												for (let i = 0; i < arr.length; i++) {
													if (arr[i].id == this.id) {
														document
																.getElementById("image-hover").src = root
																+ "/SpringMVC/assets/images/products/"
																+ this.id;
														document
																.getElementById(this.id).style.boxShadow = "-0px -0px 10px #ff523E";
													} else {
														document
																.getElementById(arr[i].id).style.boxShadow = "none";
														//document.getElementById("image-hover").src = "images/products/"+this.id;
													}
												}

											});
						});
	</script>
	<script>
		function amount(x) {
			let txt = x.value;
			var valueInput = 1;
			if (txt == "+") {
				var input = document.getElementById("input_amount").value;
				valueInput = parseInt(input) + 1;
				document.getElementById("input_amount").value = valueInput;
			} else {
				var input = document.getElementById("input_amount").value;
				if (parseInt(input) > 1) {
					valueInput = parseInt(input) - 1;
				}
				document.getElementById("input_amount").value = valueInput;
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
		function bigImg(x) {
			var listkeys = document.getElementById("listkeys");
			listkeys.style.visibility = 'visible';
		}

		function normalImg(x) {
			var listkeys = document.getElementById("listkeys");
			listkeys.style.visibility = 'hidden';
		}
	</script>



	<script src="<c:url value="js/login.js"/>"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"/>"></script>
	<script
		src="<c:url value="https://kit.fontawesome.com/a076d05399.js"/>"></script>

</body>

</html>