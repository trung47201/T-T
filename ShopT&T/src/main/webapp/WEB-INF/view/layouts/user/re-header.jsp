<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<header>
	<div class="top-nav">
		<div class="title-nav">
			<p>Free Shipping On Orders Over $100 or In-Store Pick Up
				Available.</p>
		</div>

		<div class="login-signup">
			<c:if
				test="${ sessionScope.userid != null && sessionScope.avatar != null && sessionScope.fullname != null}">
				<div class="customer" id="customer">
					<p>${ sessionScope.fullname }</p>
					<i class="fa fa-caret-down" aria-hidden="true"></i>
				</div>
			</c:if>
			<c:if
				test="${ sessionScope.userid == null || sessionScope.avatar == null || sessionScope.fullname == null }">
				<a class="a-login" href="/ShopTandT/account/login">Login</a> / <a class="a-signup" href="/ShopTandT/account/register">Sign Up</a>
			</c:if>
		</div>
	</div>
	<!--########################################3   START NAVIGATION ###########################################-->
	<div class="nav-c">
		<div class="wrapper-nav">
			<div class="nav-left">
				<ul>
					<li class="link"><a href="/ShopTandT/products/new-arrivals">NEW
							ARRIVALS</a></li>
					<li class="link"><a href="/ShopTandT/products/clothing">CLOTHING</a></li>
					<li class="link"><a href="/ShopTandT/products/gifts">GIFTS</a></li>
					<li class="link"><a href="/ShopTandT/products/shoes">SHOES</a></li>
				</ul>
			</div>
			<div class="nav-middle">
				<div class="nav-mid-img" id="home">
					<img id="re-logo" alt=""
						src="<c:url value="/assets/images/logo/Thnk.png"/>">
				</div>
			</div>
			<div class="nav-left">
				<ul>
					<li class="link"><a href="/ShopTandT/products/handbags">HANDBAGS</a></li>
					<li class="link"><a href="/ShopTandT/products/accessories">ACCESSORIES</a></li>
					<li class="link"><a href="/ShopTandT/voucher">VOUCHER</a></li>
					<li>
						<div class="nav-btn">
							<div>
								<i class="fa fa-search" aria-hidden="true"></i>
							</div>
							<div id="cart">
								<i class="fa fa-shopping-bag" aria-hidden="true"></i>
							</div>
							<div class="btn-menu" id="btn-menu">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>

<div class="customer-menu" id="customer-menu" style="width: 0;">
	<div class="customer-close">
		<i class="fa fa-times" aria-hidden="true" id="c-close"></i>
	</div>

	<div class="follow1">
		<img alt=""
			src="<c:url value="/assets/images/users/${ sessionScope.avatar }"/>">
	</div>

	<div class="follow2">
		<p>${ sessionScope.fullname }</p>
	</div>

	<div class="list-menu">
		<ul>
			<li><a href="/ShopTandT/order/${ sessionScope.userid }" class="receipt">ORDER</a></li>
			<li><a href="/ShopTandT/profile/${ sessionScope.userid }" class="profile">PROFILE</a></li>
			<li><a href="/ShopTandT/account/logout">LOGOUT</a></li>
		</ul>
	</div>
	<div class="follow3">Follow us on</div>
	<div class="menu-contact">
		<a href="#"> <i class="fab fa-instagram" aria-hidden="true"></i></a> <a
			href="#"> <i class="fab fa-facebook" aria-hidden="true"></i></a> <a
			href="#"> <i class="fab fa-twitter" aria-hidden="true"></i></a> <a
			href="#"> <i class="fab fa-youtube" aria-hidden="true"></i></a>
	</div>
</div>

<script type="text/javascript">
var userid = "${ sessionScope.userid }";
$(".profile").click(function() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/ShopTandT/profile/block/"+userid);
	xhr.onload = function() {
	};
	xhr.send();
});
</script>

<script type="text/javascript">
var userid = "${ sessionScope.userid }";
$(".receipt").click(function() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/ShopTandT/order/block/"+userid);
	xhr.onload = function() {
	};
	xhr.send();
});
</script>

<script type="text/javascript">
$("#home").click(function() {
	window.location.href = "/ShopTandT/";
}); 
</script>

<script type="text/javascript"> //open
	$("#btn-menu").click(function() {
		$("#menu").css("width", 350+"px");
	});
</script>

<script type="text/javascript"> //open
	$("#customer").click(function() {
		$("#customer-menu").css("width", 350+"px");
	});
</script>
<script type="text/javascript"> //close
	$("#c-close").click(function() {
		$("#customer-menu").css("width", 0 + "px");
	});
</script>


<script type="text/javascript">
window.addEventListener("scroll", (event) => {
    let scroll = this.scrollY;
    if(scroll >= 20) {
    	document.getElementById("re-logo").style.width = "80px";
    	$(".nav-mid-img").css({marginTop: 0 , position:'sticky'});
    } else {
    	document.getElementById("re-logo").style.width = "160px";
    	$(".nav-mid-img").css({marginTop: 0, position:'sticky'});
    }
});
</script>

<script type="text/javascript">
	var userid = "";
	if(${ sessionScope.userid != null }) {
		userid = "${ sessionScope.userid }";
	}
	$("#cart").click(function() {
		if(userid != "") {
			window.location.href = "/ShopTandT/cart/"+userid;
		} else {
			window.location.href = "/ShopTandT/cart";
		}
	});
</script>
