<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${ handbags == 'true' }">
	<title>Handbags</title>
</c:if>
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-admin-product2.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-admin-login.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-search3.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-message.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/re-admin3.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-dashboard4.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-nav2.css'/>">

<style>
th.td-addnewshoes a {
	display: flex;
	width: 140px !important;
}
td.td-date {
	min-width: 95px;
}
.behind-zoom-img {
	background: black;
	position: fixed;
	height: 100%;
	z-index: 100;
	opacity: .5;
}
.zoom-img {
	z-index: 100;
}
th.td-date {
	min-width: 100px;
}
</style>
<body>
	<%
	if (session.getAttribute("adminID") == null) {
		response.sendRedirect("/ShopTandT/login");
	}
	%>
	<div class="admin-body">
		<jsp:include page="../../layouts/admin/a-nav.jsp"></jsp:include>
		<!-- PRODUCT -->
		<section class="admin-shoes-product">
			<jsp:include page="../../layouts/admin/a-header.jsp"></jsp:include>
			<div class="nav-history">
				<div class="origin">
					<img
						src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
						alt=""> <a href="/ShopTandT/admin">Home</a>
				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-dirty-clothes-100.png"/>"
						alt=""> <a href="">Products</a>
				</div>
				<div>
					<p>/</p>
					<img src="<c:url value="/assets/images/icons/icons8-bag-100.png"/>"
						alt=""> <a href="/ShopTandT/admin/product/handbags">Hangbags</a>
				</div>
			</div>

			<div class="table-order">
				<table class="order">
					<thead>
						<tr>
							<th colspan="1000" class="td-addnewshoes"><a
								href="/ShopTandT/admin/product/handbags/add">
									<button class="addnewshoes addnewproduct"
										id="addnewshoes-product">
										<img
											src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
											alt="icon-plus">Add New
									</button>
							</a></th>
						</tr>
						<tr>
							<th></th>
							<th>ID</th>
							<th>Name</th>
							<th>Price</th>
							<th>Discount</th>
							<th>Style</th>
							<th>Brand</th>
							<th>Gender</th>
							<th class="td-date">Created at</th>
							<th>Sold</th>
							<th>Most loved</th>
							<th class="th-description">Description</th>
							<th class="td-action">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="liProduct" items="${ listProduct }">
							<tr>
								<td class="td-img-product">
									<div class="td-img-avt">
										<img
											src="<c:url value="/assets/images/products/${ liProduct.thumbnail }"/>"
											alt="">
									</div>
								</td>
								<td>${ liProduct.id }</td>
								<td>${ liProduct.title }</td>
								<td>${ liProduct.price }</td>
								<td>${ liProduct.discount }</td>
								<td>${ liProduct.sub_category.sub_category_name }</td>
								<td>${ liProduct.brand.brand_name }</td>
								<td>${ liProduct.gender.gender_name }</td>
								<td class="td-date">${ liProduct.created_at }</td>
								<td>${ liProduct.sold }</td>
								<td>${ liProduct.most_loved }</td>
								<td><textarea id="w3review" name="w3review">${ liProduct.description }
								</textarea></td>
								<td class="td-action">
									<button class="btn-edit-order btn-edit-product"
										id="btn-edit-product" name="${ liProduct.id }"
										onclick="productedit(this)">
										<img
											src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
											alt="">
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<jsp:include page="../../layouts/admin/a-footer.jsp"></jsp:include>
		</section>
		<div class="behind-zoom-img importantNone"></div>
		<div class="zoom-img importantNone" id="zoom-img">
			<img id="display-img-onclick" alt="img-onclick"
				src="<c:url value="/assets/images/users/emiuuu.jpg"/>">
		</div>
	</div>

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<script>
	<!-- ZOOM IMG -->
		$(".td-img-avt img").click(function() {
			var get = this.src;
			$("#display-img-onclick").attr("src", get);
			$(".zoom-img").removeClass("importantNone");
			$(".behind-zoom-img").removeClass("importantNone");
		});
		$(".behind-zoom-img").click(function() {
			$(".zoom-img").addClass("importantNone");
			$(".behind-zoom-img").addClass("importantNone");
		});
	</script>

	<script>
	<!-- EDIT PRODUCT -->
		function productedit(x) {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				window.location.assign("/ShopTandT/admin/product/update/"
						+ x.name);
			};
			xhr.send();
			return false;
		}
	</script>
</body>
</html>