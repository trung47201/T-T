<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navigation">
	<!-- DASHBOARD -->
	<a href="/SpringMVC/admin">
		<ul class="dashboard">
			<li>
				<div class="menu" id="sub-menu-dashboard">
					<img
						src="<c:url value="/assets/images/icons/icons8-home-page-96.png"/>"
						alt="">
					<h3>Dashboard</h3>
				</div>
	
			</li>
		</ul>
	</a>
	<!-- ORDER -->
	<ul>
		<li>
			<div class="menu" id="sub-menu-order">
				<img
					src="<c:url value="/assets/images/icons/icons8-purchase-order-100.png"/>"
					alt="">
				<h3>Order</h3>
				<p class="dropdown-sub-menu-order dropdown-menu">></p>
			</div>
		</li>
	</ul>
	<!-- SUB MENU ORDER -->
	<div class="sub-menu-order none">
		<a href="/SpringMVC/admin/order-management">
			<ul class="sub-menu-ul" id="">
				<li>Management</li>
			</ul>
		</a>
		<a href="/SpringMVC/admin/search-order">
			<ul class="sub-menu-ul" id="">
				<li>Search</li>
			</ul>
		</a>
		<a href="/SpringMVC/admin/voucher">
			<ul class="sub-menu-ul">
				<li>Voucher</li>
			</ul>
		</a>
	</div>
	<!-- SHOES -->
	<ul>
		<li>
			<div class="menu" id="sub-menu-shoes">
				<img
					src="<c:url value="/assets/images/icons/icons8-trainers-100.png"/>"
					alt="">
				<h3>Shoes</h3>
				<p class="dropdown-sub-menu-shoes dropdown-menu">></p>
			</div>

		</li>
	</ul>
	<!-- SUB MENU SHOES -->
	<div class="sub-menu-shoes none">
		<a href="/SpringMVC/admin/product">
			<ul class="sub-menu-ul" id="">
				<li>Product</li>
			</ul>
		</a>
		<a href="/SpringMVC/admin/color-size">
			<ul class="sub-menu-ul" id="">
				<li>Color-Size</li>
			</ul>
		</a>
		<a href="/SpringMVC/admin/gallery">
			<ul class="sub-menu-ul" id="">
				<li>Gallery</li>
			</ul>
		</a>
		<a href="/SpringMVC/admin/brand-style-gender">
			<ul class="sub-menu-ul" id="">
				<li>B-S-G</li>
			</ul>
		</a>
	</div>
	<!-- CUSTOMER -->
	<ul>
		<li>
			<div class="menu" id="sub-menu-customer">
				<img src="<c:url value="/assets/images/icons/icons8-user-100.png"/>"
					alt="">
				<h3>Customer</h3>
				<p class="dropdown-sub-menu-customer dropdown-menu">></p>
			</div>

		</li>
	</ul>
	<!-- SUB MENU CUSTOMER -->
	<div class="sub-menu-customer none">
		<a href="/SpringMVC/admin/customer">
			<ul class="sub-menu-ul" id="">
				<li>User</li>
			</ul>
		</a>
		<a href="/SpringMVC/admin/role">
			<ul class="sub-menu-ul" id="">
				<li>Role</li>
			</ul>
		</a>
	</div>
	<!-- PARAMETERS -->
	<ul>
		<li>
			<div class="menu" id="sub-menu-parameters">
				<img
					src="<c:url value="/assets/images/icons/icons8-setting-100.png"/>"
					alt="">
				<h3>Parameters</h3>
				<p class="dropdown-sub-menu-parameters dropdown-menu">></p>
			</div>

		</li>
	</ul>
	<!-- SUB MENU PARAMETERS -->
	<div class="sub-menu-parameters none">
		<a href="/SpringMVC/admin/revenue">
			<ul class="sub-menu-ul" id="">
				<li>Revenue</li>
			</ul>
		</a>
		<a href="/SpringMVC/admin/selling-products">
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
				<p class="dropdown-sub-menu-news dropdown-menu">></p>
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
				<img src="<c:url value="/assets/images/icons/icons8-poster-64.png"/>"
					alt="">
				<h3>Poster</h3>
				<p class="dropdown-sub-menu-poster dropdown-menu">></p>
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
					src="<c:url value="/assets/images/icons/icons8-view-more-80-white.png"/>"
					alt="">
				<h3>Other</h3>
			</div>
		</li>
	</ul>

</nav>