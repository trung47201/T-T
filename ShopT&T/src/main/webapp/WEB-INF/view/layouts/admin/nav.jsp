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
		<a href="/ShopTandT/admin"> <!-- DASHBOARD -->
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
			<a href="/ShopTandT/admin/order-management">
				<ul class="sub-menu-ul" id="">
					<li>Management</li>
				</ul>
			</a> <a href="/ShopTandT/admin/search-order">
				<ul class="sub-menu-ul" id="">
					<li>Search</li>
				</ul>
			</a> <a href="/ShopTandT/admin/voucher">
				<ul class="sub-menu-ul">
					<li>Voucher</li>
				</ul>
			</a>
		</div>

		<ul>
			<!-- SHOES -->
			<li>
				<div class="menu" id="sub-menu-shoes">
					<img
						src="<c:url value="/assets/images/icons/icons8-dirty-clothes-100.png"/>"
						alt="">
					<h3>Products</h3>
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
			<a href="/ShopTandT/admin/product">
				<ul class="sub-menu-ul" id="">
					<li>Product</li>
				</ul>
			</a> <a href="/ShopTandT/admin/color-size">
				<ul class="sub-menu-ul" id="">
					<li>Color-Size</li>
				</ul>
			</a> <a href="/ShopTandT/admin/gallery">
				<ul class="sub-menu-ul" id="">
					<li>Gallery</li>
				</ul>
			</a> <a href="/ShopTandT/admin/brand-style-gender">
				<ul class="sub-menu-ul" id="">
					<li>B-S-G</li>
				</ul>
			</a>
		</div>

		<ul>
			<!-- CUSTOMER -->
			<li>
				<div class="menu" id="sub-menu-customer">
					<img
						src="<c:url value="/assets/images/icons/icons8-dona-sarkar-100.png"/>"
						alt="">
					<h3>Customer</h3>
					<p class="dropdown-sub-menu-customer dropdown-menu" id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>

			</li>
		</ul>
		<div class="sub-menu-customer none">
			<!-- SUB MENU CUSTOMER -->
			<a href="/ShopTandT/admin/customer">
				<ul class="sub-menu-ul" id="">
					<li>User</li>
				</ul>
			</a> <a href="/ShopTandT/admin/role">
				<ul class="sub-menu-ul" id="">
					<li>Role</li>
				</ul>
			</a>
		</div>
		<ul>
			<!-- SHiPPER -->
			<li>
				<div class="menu" id="sub-menu-shipper">
					<img
						src="<c:url value="/assets/images/icons/icons8-supplier-100.png"/>"
						alt="">
					<h3>Shipper</h3>
					<p class="dropdown-sub-menu-shipper dropdown-menu" id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>

			</li>
		</ul>
		<div class="sub-menu-shipper none">
			<!-- SUB MENU CUSTOMER -->
			<a href="/ShopTandT/admin/customer">
				<ul class="sub-menu-ul" id="">
					<li>User</li>
				</ul>
			</a> <a href="/ShopTandT/admin/role">
				<ul class="sub-menu-ul" id="">
					<li>Role</li>
				</ul>
			</a>
		</div>
		<div class="tilte-cate">
			<h4>PAGES</h4>
		</div>

		<ul>
			<!-- PARAMETERS -->
			<li>
				<div class="menu" id="sub-menu-parameters">
					<img
						src="<c:url value="/assets/images/icons/icons8-setting-100.png"/>"
						alt="">
					<h3>Parameters</h3>
					<p class="dropdown-sub-menu-parameters dropdown-menu"
						id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>

			</li>
		</ul>
		<!-- SUB MENU PARAMETERS -->
		<div class="sub-menu-parameters none">
			<a href="/ShopTandT/admin/revenue">
				<ul class="sub-menu-ul" id="">
					<li>Revenue</li>
				</ul>
			</a> <a href="/ShopTandT/admin/selling-products">
				<ul class="sub-menu-ul" id="">
					<li>Selling products</li>
				</ul>
			</a>
		</div>

		<ul class="other-menu none">
			<li>
				<div class="menu" id="sub-menu-news">
					<img
						src="<c:url value="/assets/images/icons/icons8-newspaper-64.png"/>"
						alt="">
					<h3>New</h3>
					<p class="dropdown-sub-menu-news dropdown-menu" id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>
			</li>
		</ul>
		<!-- SUB MENU NEWS -->
		<div class="sub-menu-news none">
			<ul class="sub-menu-ul" id="news.html?revenue">
				<li>Revenue</li>
			</ul>
			<ul class="sub-menu-ul" id="news.html?selling">
				<li>Selling products</li>
			</ul>
		</div>

		<ul class="other-menu none">
			<li>
				<div class="menu" id="sub-menu-poster">
					<img
						src="<c:url value="/assets/images/icons/icons8-poster-64.png"/>"
						alt="">
					<h3>Poster</h3>
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
			<ul class="sub-menu-ul" id="poster.html?revenue">
				<li>Revenue</li>
			</ul>
			<ul class="sub-menu-ul" id="poster.html?selling">
				<li>Selling products</li>
			</ul>
		</div>

		<!-- OTHER -->
		<ul class="other">
			<li>
				<div class="menu">
					<img
						src="<c:url value="/assets/images/icons/icons8-view-more-100.png"/>"
						alt="">
					<h3>Other</h3>
				</div>
			</li>
		</ul>
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
				if(parseInt(x)<=40) {
					$("#shadow-nav").removeClass("menu-inner-shadow");
				} else {
					$("#shadow-nav").addClass("menu-inner-shadow");
				}
			}, false);
</script>