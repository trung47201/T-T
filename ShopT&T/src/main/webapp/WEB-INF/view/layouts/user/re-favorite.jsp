<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wrap-favorite none"></div>
<div class="favorite-btn">
	<img alt="" src="<c:url value="/assets/images/icons/favorite48.png"/>">
</div>
<c:if test="${ listProduct != null }">
<input class="favorite-number" id="favorite-number"
	value="${ listProduct.size() }" readonly>
</c:if>
<c:if test="${ listProduct == null }">
<input class="favorite-number" id="favorite-number"
	value="0" readonly>
</c:if>
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
		<c:set var="idx" value="${ 0 }" />
		<c:if test="${ listProduct != null || sessionScope.favorite != null }">
			<c:if test="${ sessionScope.favorite != ''}">
				<c:forEach var="it" items="${ listProduct }" varStatus="index">
					<c:set var="idx" value="${ index.getIndex() }" />
					<c:if test="${ idx % 4 == 0 }">
						<div class="favorite-list">
						<div class="favorite-list-ele" style="margin-right: 25px;">
							<div class="ele-img">
								<img
									src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
									alt="">
							</div>
							<div class="ele-content">
								<h5>${ it.title }</h5>
								<h3>$${ it.price }</h3>
							</div>
							<div class="ele-addtocart">ADD TO CART</div>
						</div>
					</c:if>
					<c:if test="${ idx % 4 == 1 ||  idx % 4 == 2 }">
						<div class="favorite-list-ele" style="margin-right: 25px;">
							<div class="ele-img">
								<img
									src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
									alt="">
							</div>
							<div class="ele-content">
								<h5>${ it.title }</h5>
								<h3>$${ it.price }</h3>
							</div>
							<div class="ele-addtocart">ADD TO CART</div>
						</div>
					</c:if>
					<c:if test="${ (idx+1) % 4 == 0 }">
						<div class="favorite-list-ele">
							<div class="ele-img">
								<img
									src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
									alt="">
							</div>
							<div class="ele-content">
								<h5>${ it.title }</h5>
								<h3>$${ it.price }</h3>
							</div>
							<div class="ele-addtocart">ADD TO CART</div>
						</div>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${ (idx+1) % 4 != 0 }">
					</div>
				</c:if>
			</c:if>
		</c:if>
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
