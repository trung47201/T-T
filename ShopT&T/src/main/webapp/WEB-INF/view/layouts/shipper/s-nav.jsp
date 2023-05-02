<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navigation" id="navigation">
	<div class="logo">
		<div class="img-logo">
			<img src="<c:url value="/assets/images/logo/logo.png"/>" alt=""
				id="img-logo">
		</div>
		<div class="name-shop">
			<h2 id="name-shop">Shop</h2>
		</div>
		<div class="" id="shadow-nav"></div>
	</div>
	<div class="wrapper-nav">
		<a href="/ShopTandT/shipper"> <!-- DASHBOARD -->
			<ul class="dashboard selected">
				<li>
					<div class="menu" id="sub-menu-dashboard">
						<img
							src="<c:url value="/assets/images/icons/icons8-home-page.png"/>"
							alt="">
						<h3>Dashboard</h3>
					</div>

				</li>
			</ul>
		</a>

		<div class="tilte-cate">
			<h4>COMPONENTS</h4>
		</div>
		<ul>
			<!-- ORDER -->
			<li>
				<div class="menu" id="sub-menu-order">
					<img
						src="<c:url value="/assets/images/icons/icons8-purchase-order.png"/>"
						alt="">
					<h3>Order</h3>
					<p class="dropdown-sub-menu-order dropdown-menu" id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>
			</li>
		</ul>

		<div class="sub-menu-order none">
			<!-- SUB MENU ORDER -->
			<a href="/ShopTandT/shipper/order-management">
				<ul class="sub-menu-ul" id="">
					<li>Management</li>
				</ul>
			</a> <a href="/ShopTandT/shipper/delivery">
				<ul class="sub-menu-ul" id="">
					<li>Delivery</li>
				</ul>
			</a>
		</div>

		<ul>
			<!-- SHOES -->
			<li>
				<div class="menu" id="sub-menu-shoes">
					<img
						src="<c:url value="/assets/images/icons/icons8-test-account-64.png"/>"
						alt="">
					<h3>Profile</h3>
					<p class="dropdown-sub-menu-shoes dropdown-menu" id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>

			</li>
		</ul>

		<div class="sub-menu-shoes none">
			<!-- SUB MENU SHOES -->
			<a href="/ShopTandT/shipper/profile/order">
				<ul class="sub-menu-ul" id="">
					<li>Orders delivered</li>
				</ul>
			</a>
			<a href="/ShopTandT/shipper/profile/password">
				<ul class="sub-menu-ul" id="">
					<li>Change password</li>
				</ul>
			</a>
		</div>
		<div class="tilte-cate">
			<h4>DELIVERY</h4>
		</div>
		<ul>
			<li>
				<div class="menu" id="sub-menu-delivery">
					<img
						src="<c:url value="/assets/images/icons/icons8-qr-code-96.png"/>"
						alt="">
					<h3>QR Code</h3>
					<p class="dropdown-sub-menu-delivery dropdown-menu" id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>
			</li>
		</ul>
		<!-- SUB MENU POSTER -->
		<div class="sub-menu-delivery none">
			<a href="/ShopTandT/shipper/confirm-delivery">
				<ul class="sub-menu-ul" id="">
					<li>Confirm delivery</li>
				</ul>
			</a>
			<a href="/ShopTandT/shipper/cancel-delivery">
				<ul class="sub-menu-ul" id="">
					<li>Cancel delivery</li>
				</ul>
			</a>
		</div>
		<div class="tilte-cate">
			<h4>Other</h4>
		</div>
		<ul class="other-menu">
			<li>
				<div class="menu" id="sub-menu-poster">
					<img
						src="<c:url value="/assets/images/icons/icons8-settings-1000.png"/>"
						alt="">
					<h3>Setting</h3>
					<p class="dropdown-sub-menu-poster dropdown-menu" id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>
			</li>
		</ul>
		<!-- SUB MENU POSTER -->
		<div class="sub-menu-poster none">
			<a href="/ShopTandT/admin/poster/most-loved">
				<ul class="sub-menu-ul" id="">
					<li>Logout</li>
				</ul>
			</a>
		</div>
	</div>
</nav>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	if ('scrollRestoration' in history) {
		history.scrollRestoration = 'manual';
	}
</script>
<script>
	var arrDiv = document.getElementsByClassName("menu");
	var arrP = document.getElementsByClassName("dropdown-menu");
	$(document).ready(function() {
		$(".menu").click(function() {
			var classSubMenu = "." + this.id;
			$(classSubMenu).toggle("none");
			for (let i = 0; i < arrP.length; i++) {
				if (arrP[i].className.includes(this.id)) {
					$(arrP[i].firstElementChild).toggleClass("rotate");
				}
			}
		});
	});
</script>
<script type="text/javascript">
	document.getElementById('navigation').addEventListener('scroll',
			function() {
				let x = this.scrollTop;
				if (parseInt(x) <= 40) {
					$("#shadow-nav").removeClass("menu-inner-shadow");
				} else {
					$("#shadow-nav").addClass("menu-inner-shadow");
				}
			}, false);
</script>
<script>
	$('.other').click(function() {
		$(".other-menu").removeClass("none", 10000, "easeInBack");
	});
</script>