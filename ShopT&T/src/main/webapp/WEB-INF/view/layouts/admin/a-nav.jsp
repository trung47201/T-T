<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navigation" id="navigation">
	<div class="logo">
		<div class="img-logo">
			<a href="/ShopTandT/admin"><img
				src="<c:url value="/assets/images/logo/logo.png"/>" alt=""
				id="img-logo"></a>
		</div>
		<div class="name-shop">
			<h2 id="name-shop">
				<a href="/ShopTandT/admin">Shop</a>
			</h2>
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
				</ul> <a href="/ShopTandT/admin/packing">
					<ul class="sub-menu-ul">
						<li>Packing</li>
					</ul>
			</a> <a id="shipping-a" href="/ShopTandT/admin/shipping">
					<ul class="sub-menu-ul">
						<li>Shipping</li>
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
			<a href="/ShopTandT/admin/product/clothing">
				<ul class="sub-menu-ul" id="">
					<li>Clothing</li>
				</ul>
			</a> <a href="/ShopTandT/admin/product/shoes">
				<ul class="sub-menu-ul" id="">
					<li>Shoes</li>
				</ul>
			</a> <a href="/ShopTandT/admin/product/gifts">
				<ul class="sub-menu-ul" id="">
					<li>Gifts</li>
				</ul>
			</a> <a href="/ShopTandT/admin/product/jewelry">
				<ul class="sub-menu-ul" id="">
					<li>Jewelry</li>
				</ul>
			</a> <a href="/ShopTandT/admin/product/handbags">
				<ul class="sub-menu-ul" id="">
					<li>Handbags</li>
				</ul>
			</a> <a href="/ShopTandT/admin/product/accessories">
				<ul class="sub-menu-ul" id="">
					<li>Accessories</li>
				</ul>
			</a> </a> <a href="/ShopTandT/admin/voucher">
				<ul class="sub-menu-ul">
					<li>Voucher</li>
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
			<a href="/ShopTandT/admin/shipper-tables">
				<ul class="sub-menu-ul" id="">
					<li>Tables</li>
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
						src="<c:url value="/assets/images/icons/icons8-template-96.png"/>"
						alt="" style="width: 36px; height: 36px; margin-left: 7px;">
					<h3>Layout</h3>
					<p class="dropdown-sub-menu-parameters dropdown-menu"
						id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>

			</li>
		</ul>
		<div class="sub-menu-parameters none">
			<!-- SUB MENU PARAMETERS -->
			<a href="/ShopTandT/admin/layout/slider">
				<ul class="sub-menu-ul" id="">
					<li>Slider</li>
				</ul>
			</a> <a href="/ShopTandT/admin/layout/posts">
				<ul class="sub-menu-ul" id="">
					<li>Posts</li>
				</ul>
			</a>
		</div>
		<ul>
			<!-- PARAMETERS -->
			<li>
				<div class="menu" id="sub-menu-content">
					<img
						src="<c:url value="/assets/images/icons/icons8-content-64.png"/>"
						alt="">
					<h3>Content</h3>
					<p class="dropdown-sub-menu-content dropdown-menu" id="drop-menu">
						<img
							src="<c:url value="/assets/images/icons/icons8-more-than-100.png"/>"
							alt="">
					</p>
				</div>

			</li>
		</ul>
		<!-- SUB MENU PARAMETERS -->
		<div class="sub-menu-content none">
			<a href="/ShopTandT/admin/content/header">
				<ul class="sub-menu-ul" id="">
					<li>Header</li>
				</ul>
			</a> <a href="/ShopTandT/admin/content/footer">
				<ul class="sub-menu-ul" id="">
					<li>Footer</li>
				</ul>
			</a> <a href="/ShopTandT/admin/content/category">
				<ul class="sub-menu-ul" id="">
					<li>Category - Sub</li>
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
						src="<c:url value="/assets/images/icons/icons8-poster-64-re.png"/>"
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
			<a href="/ShopTandT/admin/poster/most-loved">
				<ul class="sub-menu-ul" id="">
					<li>Most loved</li>
				</ul>
			</a> <a href="/ShopTandT/admin/poster/new-arrivals">
				<ul class="sub-menu-ul" id="">
					<li>New arrivals</li>
				</ul>
			</a>
		</div>

		<ul class="other-menu">
			<li>
				<div class="menu" id="sub-menu-news">
					<img
						src="<c:url value="/assets/images/icons/icons8-setting-64.png"/>"
						alt="">
					<h3>Menu</h3>
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
			<a href="/ShopTandT/admin/menu/about">
				<ul class="sub-menu-ul">
					<li>About</li>
				</ul>
			</a> <a href="/ShopTandT/admin/menu/size-chart">
				<ul class="sub-menu-ul" id="">
					<li>Size chart</li>
				</ul>
			</a> <a href="/ShopTandT/admin/menu/contact">
				<ul class="sub-menu-ul" id="">
					<li>Contact</li>
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
<script>
	$('#shipping-a').click(function() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/ShopTandT/admin/shipping?shipping");
		xhr.onload = function() {
		};
		xhr.send();
	});
</script>