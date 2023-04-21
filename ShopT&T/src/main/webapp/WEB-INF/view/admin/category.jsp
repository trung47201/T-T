<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>Category</title>
<style>
th.td-addnewshoes a {
	display: flex;
	width: 140px !important;
}

td.td-date {
	min-width: 95px;
}

table.table-new-product td {
	width: 20%;
}

.id-new-product input {
	width: 100%;
}

.message {
	z-index: 105;
}

.message input {
	width: 127px;
}

.wrap-c {
	position: absolute;
	width: 100%;
	height: 800px;
	background: black;
	top: 0;
	z-index: 100;
	opacity: .5;
}

.bg-c {
	position: absolute;
	height: 400px;
	width: 27%;
	background: #f9e1ee;
	top: 47%;
	z-index: 101;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 7px;
	text-align: center;
}

.bg-c p {
	color: red;
	margin-top: 12px;
}

.input {
	margin-top: 20px;
}

.input input {
	width: 70%;
	height: 40px;
	padding: 0px 10px;
	border: 0;
	font-size: 18px;
	border-left: 2px solid #cb82a9;
}

.title-c {
	color: #cb82a9;
}

.close {
	height: 24px;
	display: flex;
	justify-content: right;
	width: 100%;
	margin-left: -15px;
	margin-top: 15px;
}

.close img {
	cursor: pointer;
}

.btn-add input {
	background: #cb82a9;
	color: white;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	border: 0;
	border-radius: 4px;
	margin-top: 0;
}

.input p {
	color: black;
	text-align: left;
	margin-left: 15%;
	margin-bottom: 3px;
}

.table-brand, .table-style, .table-gender {
	min-width: 49%;
}
.input select {
    height: 40px;
    width: 70%;
}
</style>
<body>
	<%
	if (session.getAttribute("adminID") == null) {
		response.sendRedirect("/ShopTandT/login");
	}
	%>

	<div class="admin-body">
		<jsp:include page="../layouts/admin/a-nav.jsp"></jsp:include>
		<!-- BRAND - STYLE - GENDER -->
		<section class="admin-shoes-brand-style-gender">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
			<div class="nav-history">
				<div class="origin">
					<img
						src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
						alt=""> <a href="">Home</a>
				</div>
				<p>/</p>
				<div>
					<img
						src="<c:url value="/assets/images/icons/icons8-dirty-clothes-100.png"/>"
						alt=""> <a href="">Content</a>
				</div>
				<p>/</p>
				<div>
					<img
						src="<c:url value="/assets/images/icons/icons8-brand-58.png"/>"
						alt=""> <a href="">CATEGORY</a>
				</div>
			</div>
			<div class="list-table">
				<div class="table-brand">
					<table class="order">
						<thead>
							<tr>
								<th colspan="1000" class="td-addnewshoes">
									<button class="addnewshoes" id="add-br">
										<img
											src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
											alt="icon-plus"> Add New
									</button>
								</th>
							</tr>
							<tr>
								<th class="td-center">ID</th>
								<th>Category name</th>
								<th class="td-action">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="liCategory" items="${ listCategory }">
								<tr>
									<td class="td-center">${ liCategory.id }</td>
									<td>${ liCategory.category_name }</td>
									<td class="td-action">
										<button class="btn-edit-order" id="${ liCategory.id }">
											<img
												src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
												alt="">
										</button>
										<button class="btn-del-order" id="${ liCategory.id }">
											<img
												src="<c:url value="/assets/images/icons/icons8-remove-60.png"/>"
												alt="">
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="table-style">
					<table class="order">
						<thead>
							<tr>
								<th colspan="1000" class="td-addnewshoes">
									<button class="addnewshoes" id="add-st">
										<img
											src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
											alt="icon-plus"> Add New
									</button>
								</th>
							</tr>
							<tr>
								<th class="td-center">ID</th>
								<th>Sub category name</th>
								<th>Category</th>
								<th class="td-action">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="liSubCategory" items="${ listSubCategory }">
								<tr>
									<td class="td-center">${ liSubCategory.id }</td>
									<td>${ liSubCategory.sub_category_name }</td>
									<td>${ liSubCategory.category.category_name }</td>
									<td class="td-action">
										<button class="btn-edit-order" id="${ liSubCategory.id }">
											<img
												src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
												alt="">
										</button>
										<button class="btn-del-order" id="${ liSubCategory.id }">
											<img
												src="<c:url value="/assets/images/icons/icons8-remove-60.png"/>"
												alt="">
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<jsp:include page="../layouts/admin/a-footer.jsp"></jsp:include>
		</section>

	</div>

	<div class="message none" id="success-add">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg" id="content-msg"></p>
		<div class="btn-ok-cancel">
			<input class="ok" id="okey" type="button" value="OK">
		</div>
	</div>


	<div class="wrap-c none" id="wrap-br"></div>
	<!-- =========================== ADD SIZE ============================ -->
	<div class="bg-c none" id="bg-br">
		<div class="close">
			<img id="close-br"
				src="<c:url value="/assets/images/icons/icons8-close-68.png"/>"
				alt="icon-plus">
		</div>
		<div class="title-c">
			<h2>ADD CATEGORY</h2>
		</div>
		<div class="form-input">
			<form action="/ShopTandT/admin/content/category/add" id="form-category"
				method="post">
				<div class="input">
					<p>Category name</p>
					<input type="text" id="category" name="category">
				</div>
				<p id="msg-error-br" style="visibility: hidden;">Category name is
					empty!</p>
				<div class="input btn-add">
					<input type="button" id="add-brand" name="addbrand" value="ADD">
				</div>
			</form>
		</div>
	</div>
	<!-- =========================== END - ADD SIZE ============================ -->

	<div class="wrap-c none" id="wrap-st"></div>
	<!-- =========================== ADD SIZE ============================ -->
	<div class="bg-c none" id="bg-st">
		<div class="close">
			<img id="close-st"
				src="<c:url value="/assets/images/icons/icons8-close-68.png"/>"
				alt="icon-plus">
		</div>
		<div class="title-c">
			<h2>ADD SUBCATEGORY</h2>
		</div>
		<div class="form-input">
			<form action="/ShopTandT/admin/content/subcategory/add" id="form-subcategory"
				method="post">
				<div class="input">
					<p>Subcategory name</p>
					<input type="text" id="subcategory" name="subcategory">
				</div>
				<div class="input">
					<select class="selected-add-new-product" id="categoryid"
						name="categoryid">
						<option value="" disabled="disabled" selected>Choose
							category</option>
						<c:forEach var="liCategory" items="${ listCategory }">
							<option value="${ liCategory.id }">${ liCategory.category_name }</option>
						</c:forEach>
					</select>
				</div>
				<p id="msg-error-st" style="visibility: hidden;">Subcategory name is
					empty!</p>
				<div class="input btn-add">
					<input type="button" id="add-style" name="addstyle" value="ADD">
				</div>
			</form>
		</div>
	</div>
	<!-- =========================== END - ADD SIZE ============================ -->

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
		// show form add brand
		$("#add-br").click(function() {
			$("#wrap-br").removeClass("none");
			$("#bg-br").removeClass("none");
		});
		$("#close-br").click(function() {
			$("#wrap-br").addClass("none");
			$("#bg-br").addClass("none");
		});
	</script>
	<script type="text/javascript">
		// show form add style
		$("#add-st").click(function() {
			$("#wrap-st").removeClass("none");
			$("#bg-st").removeClass("none");
		});
		$("#close-st").click(function() {
			$("#wrap-st").addClass("none");
			$("#bg-st").addClass("none");
		});
	</script>

	<script type="text/javascript">
		$("#add-style").click(function() {
			var get = this;
			var name = $("#subcategory").val();
			var categoryid = $("#categoryid").val();
			var error = "";
			if (name == "") {
				error += "Subcategory name is empty!";
			} else if(categoryid == null) {
				error += "Please select a category!!";
			}
			if (error == "") {
				$("#success-add").removeClass("none");
				$("#success-add #content-msg").text("Add Subcategory Success!");
				$("#success-add #okey").click(function (){
					$("#success-add").addClass("none");
					$("#form-subcategory").submit();
				});
			} else {
				$("#msg-error-st").css("visibility", "visible");
				$("#msg-error-st").text(error);
			}
		});
	</script>

	<script type="text/javascript">
		$("#add-brand").click(function() {
			var get = this;
			var name = $("#category").val();
			var name = $("#category").val();
			var error = "";
			if (name == "") {
				error += "Category name is empty!";
			}
			if (error == "") {
				$("#success-add").removeClass("none");
				$("#success-add #content-msg").text("Add Category Success!");
				$("#success-add #okey").click(function (){
					$("#success-add").addClass("none");
					$("#form-category").submit();
				});
			} else {
				$("#msg-error-br").css("visibility", "visible");
				$("#msg-error-br").text(error);
			}
		});
	</script>

	<script>
		$('.cancel').click(function() {
			$(".message").addClass("none");
			location.reload();
		});
	</script>
</body>

</html>