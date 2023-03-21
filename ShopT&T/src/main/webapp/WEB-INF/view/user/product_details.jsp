<!DOCTYPE html>
<html lang="en">
<title>Let's buy :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href='<c:url value="/assets/css/bootstrap.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/js/bootstrap.js"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/index.css"/>'>
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
<link rel="stylesheet"
	href='<c:url value="/assets/css/product_details.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/btn-effect.css"/>'>
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/navscroll.css"/>">
<body style="color: white;">
	<header class="container-xl header-content">
		<form method="post">
			<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
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
								<div class="img-hover first-hover"
									id="${ listGallery.thumbnail }">
									<img
										src="<c:url value="/assets/images/products/${ listGallery.thumbnail }"/>"
										alt="image">
								</div>
							</c:if>
							<c:if test="${ index.getIndex() != 0 }">
								<div class="img-hover" id="${ listGallery.thumbnail }">
									<img
										src="<c:url value="/assets/images/products/${ listGallery.thumbnail }"/>"
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
								$
								<fmt:formatNumber type="number" maxFractionDigits="2"
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
									<span class="select-color selected-color"
										id="${ product.id }_${ liColor.color.id }"
										style="background: ${ liColor.color.rgb }"></span>
										<input type="hidden" name="color" id="color"
												value="${ liColor.color.id }">
								</c:if>
								<c:if test="${ index.getIndex() != 0 }">
									<span class="select-color"
										id="${ product.id }_${ liColor.color.id }"
										style="background: ${ liColor.color.rgb }"></span>
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
									<c:forEach var="liSizeByColor" items="${ liSize.value }"
										varStatus="indexS">
										<c:if test="${ indexS.getIndex() == 0 }">
											<span class="select-size selected-color"
												id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span>
											<input type="hidden" name="size" id="size"
												value="${ liSizeByColor.size.id }">
										</c:if>
										<c:if test="${ indexS.getIndex() != 0 }">
											<span class="select-size"
												id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span>
										</c:if>
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${ index.getIndex() != 0 }">
								<div class="list-size-product-details none"
									id="${ idProd_Size }">
									<c:forEach var="liSizeByColor" items="${ liSize.value }"
										varStatus="indexS">
										<c:if test="${ indexS.getIndex() == 0 }">
											<span class="select-size"
												id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span>
										</c:if>
										<c:if test="${ indexS.getIndex() != 0 }">
											<span class="select-size"
												id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span>
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
							id="input_amount" value="1" readonly> <input
							class="minus-plus" type="button" name="" id=""
							onclick="amount(this)" value="+">
					</div>
					<div class="btn-add-buy">
						<div class="btn-add-to-cart">
							<input type="button" name="${ product.id }"
								id="add-to-cart-input" value="Add to cart">
						</div>
						<div class="btn-buy-now btn-add-to-cart-effect">
							<input type="button" name="" id="buy-now-input" value="Buy now"
								onclick="buynow()">
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
										<img
											src="<c:url value="/assets/images/users/avt-default.jpg"/>"
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
						<div class="details-content none" id="">
							<div class="description-product-details" id="">
								<div class="des-title">
									<p>Description</p>
								</div>
								<div class="des-content">&emsp;&nbsp;Lace up and feel the
									legacy with the Nike Air Max 90 LTR. An iconic Waffle outsole
									and moulded plastic accents help these kicks stay true to their
									roots, while Max Air cushioning adds comfort to your every
									step. Crisp leather and soft, textured suede bring a premium
									look and feel to this classic sneaker.</div>
							</div>
							<div class="features-product-details" id="">
								<div class="features-title">
									<p>Features</p>
								</div>
								<div class="features-content">
									<li>Hypoknit upper designed to provide strategic areas of
										stretch and support</li>
									<li>Nylon outsole designed specifically for firm ground
										use</li>
									<li>Firm ground studs</li>
									<li>Off-set lacing with cored-out canopy to increase
										strike zone and provide lockdown</li>
									<li>Hypoknit mesh collar for a lightweight and breathable
										feel</li>
									<li>3D tongue tab for added grip</li>
									<li>Flying NB wrap-around logo with multi-tone heel
										graphic</li>
									<li>Designed for athlete Bukayo Saka</li>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="recomment-product"></div>
		</form>
	</header>

	<jsp:include page="../layouts/user/footer.jsp"></jsp:include>

	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript">
	var user_prod = "";
	if(${ user_prod != null }) {
		user_prod = "${ user_prod }";
	}
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
			if(user_prod != "") {
				const myarr = txt_size.split("_");
				var xhr = new XMLHttpRequest();
		      	xhr.open("GET", "");
		      	xhr.onload = function () {
		      		var val = document.getElementById("size").value;
		      		var quantity = document.getElementById("input_amount").value;
		      		if(val != null || quantity != null) {
		      			window.location.assign("http://localhost:8888/SpringMVC/cart/checkout/"+user_prod + "?size="+val + "&quantity="+quantity);
		      		} else {
		      			window.location.assign("http://localhost:8888/SpringMVC/cart/checkout/"+user_prod);
		      		}
		      	};
		      	xhr.send();
			} else {
				const myarr = txt_size.split("_");
				var xhr = new XMLHttpRequest();
		      	xhr.open("GET", "");
		      	xhr.onload = function () { 
		      		window.location.assign("http://localhost:8888/SpringMVC/cart/checkout/"+myarr[0]+"?color="+myarr[1]+"&size="+myarr[2]);
		      	};
		      	xhr.send();
			}
			
		}
	}
	
	</script>


	<c:if test="${ userID != null }">
		<c:set var="id_user" value="${ userID }"></c:set>
	</c:if>


	<script> // add to cart
		var id_user = "";
		var id_prod = "";
		var user_prod = "";
		if(${ user_prod != null }) {
			user_prod = "${ user_prod }";
			id_user = user_prod.split("_")[0];
		}
		if(${ product != null }) {
			id_prod = "${ product.id }";
		}
		if(id_user != "") {
			$("#add-to-cart-input").click(function() {
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/add-to-cart/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart/"+id_user);
				};
				xhr.send();
			});
		} else {
			$("#add-to-cart-input").click(function() {
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
						xhr.open("GET",
								"http://localhost:8888/SpringMVC/cart?id="+id_prod+"&process="+txt_size+"&amount="+amount);
						xhr.onload = function() {
							window.location.assign("http://localhost:8888/SpringMVC/cart");
						};
						xhr.send();
					}
			});
		}
	</script>
	<script type="text/javascript"> <!-- select size  -->
		var sizes = document.getElementsByClassName("select-size");
		$(document).ready(function() {
			$(".select-size").click(function() {
				for (let i=0; i<sizes.length; i++) {
					if (sizes[i].id == this.id) {
						$(this).addClass("selected-color");
						var txt = this.id;
						const arr = txt.split("_");
						if (arr.length > 1) {
							document.getElementById("size").value = arr[2];
						}
					} else {
						$(sizes[i]).removeClass("selected-color");
					}
				}
				
			});
		});
	</script>
	<script type="text/javascript"> <!-- select color  -->
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

	<script type="text/javascript"> // scroll display search
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
	<!-- drop avt login -->
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"/>"></script>
	<!-- drop avt login -->
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"/>"></script>


</body>

</html>