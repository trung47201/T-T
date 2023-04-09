<!DOCTYPE html>
<html lang="en">
<title>Don't shopping, don't lose money? :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href='<c:url value="/assets/css/bootstrap.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/js/bootstrap.js"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/f-index.css"/>'>
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
	href='<c:url value="/assets/css/products_c.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/add-to-cart.css"/>'>
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/re-view_receipt.css"/>">
	<link rel="stylesheet"
	href="<c:url value="/assets/css/f-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">

<style>
.ok-btn button {
	border: 1px solid;
	background: #0086ff;
	color: white;
	font-size: 20px;
	box-shadow: 0 0 5px #666;
}

.welcome {
	box-shadow: 0px 5px 15px;
}
.product-ele {
    display: flex;
    margin: 10px;
    height: 130px;
    border-bottom: 1px solid;
    border-top: 1px solid;
    border-radius: 4px;
}

.img {
    min-width: 115px;
    overflow-x: hidden;
    display: flex;
    justify-content: center;
}
</style>
<body style="color: black;">
	<c:set var="id_user" value="${ sessionScope.userid }"></c:set>
	<jsp:include page="../layouts/user/re-menu.jsp"></jsp:include>

	<div class="back-header">
		<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
	</div>
	
	<div class="img-header">
		<img alt=""
			src="<c:url value="/assets/images/poster/storepic2_1200x.webp"/>">
	</div>

	<div class="text">
		<p class="cool">
			<span data-text="Order" style="color: white;">Order</span>
		</p>
	</div>
	<header class="container-xl header-content">
		<form method="post">
			<!-- ######################################################################################################################################### -->
			<div class="order">
				<c:forEach var="liOrder" items="${ listReceipt }">
				<hr>
					<div class="list-order">
						<div class="order-form">
							<div class="order-form-hearder">
								<div class="order-code">
									<h5>
										INVOICE <span>#${ liOrder.bill }</span>
									</h5>
								</div>
								<div class="order-infor">
									<div>
										<a
											href="/ShopTandT/order-details/${ id_user }_${ liOrder.id }" class="view-receipt" id="${ id_user }_${ liOrder.id }">View
											Details ></a>
									</div>
								</div>
							</div>
						</div>

						<c:forEach var="liOrder_detalis" items="${ listReceipt_detalis }">
							<c:if test="${ liOrder.id == liOrder_detalis.receipt.id }">
								<div class="order-list-product">
									<div class="product-ele">
										<div class="img">
											<img
												src="<c:url value="/assets/images/products/${ liOrder_detalis.prod.thumbnail }"/>"
												alt="">
										</div>
										<div class="title">
											<div class="form-prod-col2">
												<h5>${ liOrder_detalis.prod.title }</h5>
												<p>${ liOrder_detalis.color.color_name }- ${ liOrder_detalis.size.size_number }</p>
											</div>
											<div class="form-prod-col3">
												<div class="row1">
													<p>x${ liOrder_detalis.quantity }</p>
												</div>
												<div class="row2">
													<h5>$${ liOrder_detalis.price_at }</h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</form>
	</header>
	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>

	<jsp:include page="../layouts/user/search.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<script type="text/javascript">
	$(".view-receipt").click(function() {
		var vid = this.id;
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/ShopTandT/order-details/block/"+vid);
		xhr.onload = function() {
		};
		xhr.send();
	});
	</script>

	<script type="text/javascript">
	$(document).ready(function(){
		 $(".form-check-input").click(function(){
			 var rememberme = this.checked;
			  var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/ShopTandT/home?rememberme="+rememberme);
				// What to do when server responds
				xhr.onload = function() {
					//window.location.assign("http://localhost:8888/ShopTandT/");
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
					"http://localhost:8888/ShopTandT/home?logout=true");
			// What to do when server responds
			xhr.onload = function() {
				window.location.assign("http://localhost:8888/ShopTandT/");
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
		} else if(${message == "false"}){
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
		} else if(${message == "logout"}) {
			alert("Looking forward to seeing you again soon!");
		} else if(${message == "block"}){
			alert("Your account has been locked, please contact hotline: 0346 643 755 for more details!");
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
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
						"http://localhost:8888/ShopTandT/home?username="
								+ username +"&password="+password);
				// What to do when server responds
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/ShopTandT/");
				};
				xhr.send();
			}
			
		}
		
	</script>
	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
		}
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