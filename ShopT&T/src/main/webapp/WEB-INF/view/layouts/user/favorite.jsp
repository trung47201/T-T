<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="wrap-favorite none"></div>
<div class="favorite-btn">
	<img alt="" src="<c:url value="/assets/images/icons/favorite48.png"/>">
</div>
<div class="favorite-number">33</div>
<div class="wrap-list none">
	<div class="favorite-header">
		<div class="wrap-header">
			<div class="header-link">
				<a href="#">Login</a>&nbsp;/&nbsp;<a href="#">Sign Up</a>
			</div>
			<img id="close-favorite"
				src="<c:url value="/assets/images/icons/icons8-close-67.png"/>"
				alt="">
		</div>
	</div>
	<div class="favorite-body">
		<div class="list-title">
			<h4>My Wishlist</h4>
			<img
				src="<c:url value="/assets/images/icons/icons8-menu-vertical-102.png"/>"
				alt="">
		</div>
		<hr>
		<div class="favorite-list">
			<div class="favorite-list-ele">
				<div class="ele-img">
					<img
						src="<c:url value="/assets/images/products/522d7f56-1c34-43d5-a273-d7d1a145ffc1.webp"/>"
						alt="">
				</div>
				<div class="ele-content">
					<h5>Women's Interlocking G studs sandal</h5>
					<h3>$1,003.55</h3>
				</div>
				<div class="ele-addtocart">ADD TO CART</div>
			</div>
			<div class="favorite-list-ele">
				<div class="ele-img">
					<img
						src="<c:url value="/assets/images/products/522d7f56-1c34-43d5-a273-d7d1a145ffc1.webp"/>"
						alt="">
				</div>
				<div class="ele-content">
					<h5>Women's Interlocking G studs sandal</h5>
					<h3>$1,003.55</h3>
				</div>
				<div class="ele-addtocart">ADD TO CART</div>
			</div>
			<div class="favorite-list-ele">
				<div class="ele-img">
					<img
						src="<c:url value="/assets/images/products/522d7f56-1c34-43d5-a273-d7d1a145ffc1.webp"/>"
						alt="">
				</div>
				<div class="ele-content">
					<h5>Women's Interlocking G studs sandal</h5>
					<h3>$1,003.55</h3>
				</div>
				<div class="ele-addtocart">ADD TO CART</div>
			</div>
			<div class="favorite-list-ele">
				<div class="ele-img">
					<img
						src="<c:url value="/assets/images/products/522d7f56-1c34-43d5-a273-d7d1a145ffc1.webp"/>"
						alt="">
				</div>
				<div class="ele-content">
					<h5>Women's Interlocking G studs sandal</h5>
					<h3>$1,003.55</h3>
				</div>
				<div class="ele-addtocart">ADD TO CART</div>
			</div>
		</div>
		<div class="favorite-list">
			<div class="favorite-list-ele">
				<div class="ele-img">
					<img
						src="<c:url value="/assets/images/products/522d7f56-1c34-43d5-a273-d7d1a145ffc1.webp"/>"
						alt="">
				</div>
				<div class="ele-content">
					<h5>Women's Interlocking G studs sandal</h5>
					<h3>$1,003.55</h3>
				</div>
				<div class="ele-addtocart">ADD TO CART</div>
			</div>
			<div class="favorite-list-ele">
				<div class="ele-img">
					<img
						src="<c:url value="/assets/images/products/ti_shoes_1680932810299.jpg"/>"
						alt="">
				</div>
				<div class="ele-content">
					<h5>Women's Interlocking G studs sandal</h5>
					<h3>$1,003.55</h3>
				</div>
				<div class="ele-addtocart">ADD TO CART</div>
			</div>
			<div class="favorite-list-ele">
				<div class="ele-img">
					<img
						src="<c:url value="/assets/images/products/sf1fbs1_nb_02_i.webp"/>"
						alt="">
				</div>
				<div class="ele-content">
					<h5>Women's Interlocking G studs sandal</h5>
					<h3>$1,003.55</h3>
				</div>
				<div class="ele-addtocart">ADD TO CART</div>
			</div>
			<div class="favorite-list-ele">
				<div class="ele-img">
					<img
						src="<c:url value="/assets/images/products/522d7f56-1c34-43d5-a273-d7d1a145ffc1.webp"/>"
						alt="">
				</div>
				<div class="ele-content">
					<h5>Women's Interlocking G studs sandal</h5>
					<h3>$1,003.55</h3>
				</div>
				<div class="ele-addtocart">ADD TO CART</div>
			</div>
		</div>
	</div>
	<div class="favorite-footer"></div>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script type="text/javascript">
	$(".favorite-number").click(function() {
		$(".wrap-favorite").removeClass("none");
		$(".wrap-list").removeClass("none");
	});
	$(".favorite-btn").click(function() {
		$(".wrap-favorite").removeClass("none");
		$(".wrap-list").removeClass("none");
	});
</script>

<script type="text/javascript">
	$("#close-favorite").click(function() {
		$(".wrap-favorite").addClass("none");
		$(".wrap-list").addClass("none");
	});
</script>

