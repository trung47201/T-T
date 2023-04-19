<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<c:if test="${ clothing == 'true' }">
	<title>Clothing :)</title>
</c:if>
<c:if test="${ shoes == 'true' }">
	<title>Shoes :)</title>
</c:if>
<c:if test="${ colorSize == 'true' }">
	<title>Color - Size :)</title>
</c:if>
<c:if test="${ gallery == 'true' }">
	<title>Gallery :)</title>
</c:if>
<c:if test="${ bsg == 'true' }">
	<title>Brand - Style - Gender :)</title>
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
	height: 410px;
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
</style>
<body>
	<%
	if (session.getAttribute("adminID") == null) {
		response.sendRedirect("/ShopTandT/login");
	}
	%>

	<div class="admin-body">
		<jsp:include page="../layouts/admin/a-nav.jsp"></jsp:include>

		<!-- PRODUCT -->

		<c:if test="${ product == 'true' }">
			<section class="admin-shoes-product">
				<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
		</c:if>

		<c:if test="${ product == 'false' }">
			<section class="admin-shoes-product none">
				<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
		</c:if>

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
			<c:if test="${ clothing == 'true' }">
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-used-product-100-title.png"/>"
						alt=""> <a href="/ShopTandT/admin/product/clothing">Clothing</a>
				</div>
			</c:if>
			<c:if test="${ shoes == 'true' }">
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-used-product-100-title.png"/>"
						alt=""> <a href="/ShopTandT/admin/product/shoes">Shoes</a>
				</div>
			</c:if>
		</div>

		<c:if test="${ product == 'true' }">
			<div class="table-order">
		</c:if>
		<c:if test="${ product == 'false' }">
			<div class="table-order importantNone">
		</c:if>
		<table class="order">
			<thead>
				<tr>
					<th colspan="1000" class="td-addnewshoes">
						<c:if test="${ clothing == 'true' }">
							<a href="/ShopTandT/admin/product/add-new-clothing">
								<button class="addnewshoes addnewproduct"
									id="addnewshoes-product">
									<img
										src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
										alt="icon-plus">Add New
								</button>
							</a>
						</c:if>
						<c:if test="${ shoes == 'true' }">
							<a href="/ShopTandT/admin/product/add-new-shoes">
								<button class="addnewshoes addnewproduct"
									id="addnewshoes-product">
									<img
										src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
										alt="icon-plus">Add New
								</button>
							</a>
						</c:if></th>
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
					<th class="td-date">Updated at</th>
					<th class="td-date">Published at</th>
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
						<td class="td-date">${ liProduct.updated_at }</td>
						<td class="td-date">${ liProduct.published_at }</td>
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
							<button class="btn-del-order btn-del-product"
								id="${ liProduct.id }">
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

	<jsp:include page="../layouts/admin/a-footer.jsp"></jsp:include>
	</section>
	<div class="behind-zoom-img importantNone"></div>
	<div class="zoom-img importantNone" id="zoom-img">
		<img id="display-img-onclick" alt="img-onclick"
			src="<c:url value="/assets/images/users/emiuuu.jpg"/>">
	</div>
	<!-- Color - Size -->
	<c:if test="${ colorSize == 'true' }">
		<section class="admin-shoes-color-size">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ colorSize == 'false' }">
		<section class="admin-shoes-color-size none">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
	</c:if>
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
				alt=""> <a href="">Shoes</a>
		</div>
		<p>/</p>
		<div>
			<img
				src="<c:url value="/assets/images/icons/icons8-paint-palette-64.png"/>"
				alt=""> <a href="">Color - Size</a>
		</div>
	</div>

	<div class="list-table">
		<div class="table-order">
			<table class="order">
				<thead>
					<tr>
						<th colspan="1000" class="td-addnewshoes">
							<button class="addnewshoes" id="addcolorsize">
								<img
									src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
									alt="icon-plus"> Add New
							</button>
						</th>
					</tr>
					<tr>
						<th></th>
						<th>ID</th>
						<th>Product</th>
						<th>Color</th>
						<th>Size</th>
						<th>Quantity</th>
						<th class="td-action">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="liPCS" items="${ listPCS }">
						<tr>
							<td class="td-img-product"><img
								src="<c:url value="/assets/images/products/${ liPCS.prod.thumbnail }"/>"
								alt=""></td>
							<td>${ liPCS.id }</td>
							<td>${ liPCS.prod.title }</td>
							<td><span class="td-color-product"
								style="background: ${ liPCS.color.rgb };"></span></td>
							<td class="td-center">${ liPCS.size.size_number }</td>
							<td class="td-center">${ liPCS.quantity }</td>
							<td class="td-action">
								<button class="btn-edit-order" id="btn-edit-order"
									name="${ liPCS.id }" value="">
									<img
										src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
										alt="">
								</button>
								<button class="btn-del-order" id="${ liPCS.id }">
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
		<div class="table-color">
			<table class="order">
				<thead>
					<tr>
						<th colspan="1000" class="td-addnewshoes">
							<button class="addnewshoes" id="addcolorsize-c">
								<img
									src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
									alt="icon-plus"> Add New
							</button>
						</th>
					</tr>
					<tr>
						<th>ID</th>
						<th>Color</th>
						<th>Rgb</th>
						<th class="td-action">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="liColor" items="${ listColor }">
						<tr>
							<td>${ liColor.id }</td>
							<td>${ liColor.color_name }</td>
							<td><span class="td-color-product"
								style="background: ${ liColor.rgb };"></span></td>
							<td class="td-action">
								<button class="btn-edit-order" id="${ liColor.id }">
									<img
										src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
										alt="">
								</button>
								<button class="btn-del-order" id="${ liColor.id }">
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
		<div class="table-size">
			<table class="order">
				<thead>
					<tr>
						<th colspan="1000" class="td-addnewshoes">
							<button class="addnewshoes addnewproduct" id="addcolorsize-s">
								<img
									src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
									alt="icon-plus"> Add New
							</button>
						</th>
					</tr>
					<tr>
						<th>ID</th>
						<th>Size number</th>
						<th class="td-action">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="liSize" items="${ listSize }">
						<tr>
							<td>${ liSize.id }</td>
							<td class="td-center">${ liSize.size_number }</td>
							<td class="td-action">
								<button class="btn-edit-order" id="${ liSize.id }">
									<img
										src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
										alt="">
								</button>
								<button class="btn-del-order" id="${ liSize.id }">
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
	<!-- Gallery -->
	<c:if test="${ gallery == 'true' }">
		<section class="admin-shoes-gallery">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ gallery == 'false' }">
		<section class="admin-shoes-gallery none">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
	</c:if>
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
				alt=""> <a href="">Shoes</a>
		</div>
		<p>/</p>
		<div>
			<img
				src="<c:url value="/assets/images/icons/icons8-image-gallery-100.png"/>"
				alt=""> <a href="">Gallery</a>
		</div>
	</div>
	<div class="table-order">
		<table class="order">
			<thead>
				<tr>
					<th colspan="1000" class="td-addnewshoes">
						<button class="addnewshoes" id="addgallery">
							<img
								src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
								alt="icon-plus"> Add New
						</button>
					</th>
				</tr>
				<tr>
					<th>ID</th>
					<th>Thumbnail</th>
					<th>Product</th>
					<th>Color</th>
					<th>Description</th>
					<th class="td-action">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="liGallery" items="${ listGallery }">
					<tr>
						<td>${ liGallery.id }</td>
						<td class="td-img-product"><img
							src="<c:url value="/assets/images/products/${ liGallery.thumbnail }"/>"
							alt=""></td>
						<td>${ liGallery.product.title }</td>
						<td><span class="td-color-product"
							style="background: ${ liGallery.color.rgb };"></span></td>
						<td></td>
						<td class="td-action">
							<button class="btn-details-gallery">
								<img
									src="<c:url value="/assets/images/icons/icons8-eye-64.png"/>"
									alt="">
							</button>
							<button class="btn-edit-product">
								<img
									src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
									alt="">
							</button>
							<button class="btn-del-order">
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
	<jsp:include page="../layouts/admin/a-footer.jsp"></jsp:include>
	</section>
	<!-- BRAND - STYLE - GENDER -->
	<c:if test="${ bsg == 'true' }">
		<section class="admin-shoes-brand-style-gender">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ bsg == 'false' }">
		<section class="admin-shoes-brand-style-gender none">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
	</c:if>
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
				alt=""> <a href="">Shoes</a>
		</div>
		<p>/</p>
		<div>
			<img src="<c:url value="/assets/images/icons/icons8-brand-58.png"/>"
				alt=""> <a href="">BRAND - STYLE - GENDER</a>
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
						<th>Brand</th>
						<th class="td-action">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="liBrand" items="${ listBrand }">
						<tr>
							<td class="td-center">${ liBrand.id }</td>
							<td>${ liBrand.brand_name }</td>
							<td class="td-action">
								<button class="btn-edit-order" id="${ liBrand.id }">
									<img
										src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
										alt="">
								</button>
								<button class="btn-del-order" id="${ liBrand.id }">
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
						<th>Style</th>
						<th class="td-action">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="liStyle" items="${ listStyle }">
						<tr>
							<td class="td-center">${ liStyle.id }</td>
							<td>${ liStyle.sub_category_name }</td>
							<td class="td-action">
								<button class="btn-edit-order" id="${ liStyle.id }">
									<img
										src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
										alt="">
								</button>
								<button class="btn-del-order" id="${ liStyle.id }">
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
		<div class="table-gender">
			<table class="order">
				<thead>
					<tr>
						<th colspan="1000" class="td-addnewshoes">
							<button class="addnewshoes" id="add-ge">
								<img
									src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
									alt="icon-plus"> Add New
							</button>
						</th>
					</tr>
					<tr>

						<th class="td-center">ID</th>
						<th>Gender</th>
						<th class="td-action">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="liGender" items="${ listGender }">
						<tr>
							<td class="td-center">${ liGender.id }</td>
							<td>${ liGender.gender_name }</td>
							<td class="td-action">
								<button class="btn-edit-order" id="${ liGender.id }">
									<img
										src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
										alt="">
								</button>
								<button class="btn-del-order" id="${ liGender.id }">
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

	<div class="message msg-order message-notify none">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-notify"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" type="button" value="Cancel"> <input
				class="ok ok-notify hover-btn" type="button" value="OK">
		</div>
	</div>
	<div class="message msg-order message-done none">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-done"></p>
		<div class="btn-ok-cancel">
			<input class="ok ok-done hover-btn" type="button" value="OK">
		</div>
	</div>


	<div class="wrap-c none" id="wrap-c"></div>
	<!-- =========================== ADD COLOR ============================ -->
	<div class="bg-c none" id="bg-c">
		<div class="close">
			<img id="close-c"
				src="<c:url value="/assets/images/icons/icons8-close-68.png"/>"
				alt="icon-plus">
		</div>
		<div class="title-c">
			<h2>ADD COLOR</h2>
		</div>
		<div class="form-input">
			<form action="/ShopTandT/admin/color-size/add-color" method="post">
				<div class="input">
					<p>Color name</p>
					<input type="text" id="color_name" name="colorname">
				</div>
				<div class="input">
					<p>RGB</p>
					<input type="text" id="color_rgb" name="colorrgb">
				</div>
				<p id="msg-error" style="visibility: hidden;">Color name is
					empty!</p>
				<div class="input btn-add">
					<input type="button" id="add-color" name="addcolor" value="ADD">
				</div>
			</form>
		</div>
	</div>
	<!-- =========================== END - ADD COLOR ============================ -->

	<div class="wrap-c none" id="wrap-s"></div>
	<!-- =========================== ADD SIZE ============================ -->
	<div class="bg-c none" id="bg-s">
		<div class="close">
			<img id="close-s"
				src="<c:url value="/assets/images/icons/icons8-close-68.png"/>"
				alt="icon-plus">
		</div>
		<div class="title-s">
			<h2>ADD SIZE</h2>
		</div>
		<div class="form-input">
			<form action="/ShopTandT/admin/color-size/add-size" method="post">
				<div class="input">
					<p>Size number</p>
					<input type="text" id="sizenumber" name="sizenumber">
				</div>
				<p id="msg-error-s" style="visibility: hidden;">Size number is
					empty!</p>
				<div class="input btn-add">
					<input type="button" id="add-size" name="addsize" value="ADD">
				</div>
			</form>
		</div>
	</div>
	<!-- =========================== END - ADD SIZE ============================ -->

	<div class="wrap-c none" id="wrap-br"></div>
	<!-- =========================== ADD SIZE ============================ -->
	<div class="bg-c none" id="bg-br">
		<div class="close">
			<img id="close-br"
				src="<c:url value="/assets/images/icons/icons8-close-68.png"/>"
				alt="icon-plus">
		</div>
		<div class="title-c">
			<h2>ADD BRAND</h2>
		</div>
		<div class="form-input">
			<form action="/ShopTandT/admin/brand-style-gender/add-brand"
				method="post">
				<div class="input">
					<p>Brand</p>
					<input type="text" id="brand" name="brand">
				</div>
				<p id="msg-error-br" style="visibility: hidden;">Size number is
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
			<h2>ADD STYLE</h2>
		</div>
		<div class="form-input">
			<form action="/ShopTandT/admin/brand-style-gender/add-style"
				method="post">
				<div class="input">
					<p>Style</p>
					<input type="text" id="style" name="style">
				</div>
				<p id="msg-error-st" style="visibility: hidden;">Size number is
					empty!</p>
				<div class="input btn-add">
					<input type="button" id="add-style" name="addstyle" value="ADD">
				</div>
			</form>
		</div>
	</div>
	<!-- =========================== END - ADD SIZE ============================ -->

	<div class="wrap-c none" id="wrap-ge"></div>
	<!-- =========================== ADD SIZE ============================ -->
	<div class="bg-c none" id="bg-ge">
		<div class="close">
			<img id="close-ge"
				src="<c:url value="/assets/images/icons/icons8-close-68.png"/>"
				alt="icon-plus">
		</div>
		<div class="title-c">
			<h2>ADD GENDER</h2>
		</div>
		<div class="form-input">
			<form action="/ShopTandT/admin/brand-style-gender/add-gender"
				method="post">
				<div class="input">
					<p>Gender</p>
					<input type="text" id="gender" name="gender">
				</div>
				<p id="msg-error-ge" style="visibility: hidden;">Size number is
					empty!</p>
				<div class="input btn-add">
					<input type="button" id="add-gender" name="addgender" value="ADD">
				</div>
			</form>
		</div>
	</div>
	<!-- =========================== END - ADD SIZE ============================ -->
	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
		// show form add size
		$("#addcolorsize-s").click(function() {
			$("#wrap-s").removeClass("none");
			$("#bg-s").removeClass("none");
		});
		$("#close-s").click(function() {
			$("#wrap-s").addClass("none");
			$("#bg-s").addClass("none");
		});
	</script>
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
		// show form add style
		$("#add-ge").click(function() {
			$("#wrap-ge").removeClass("none");
			$("#bg-ge").removeClass("none");
		});
		$("#close-ge").click(function() {
			$("#wrap-ge").addClass("none");
			$("#bg-ge").addClass("none");
		});
	</script>

	<script type="text/javascript">
		$("#add-style").click(function() {
			var name = $("#style").val();
			var error = "";
			if (name == "") {
				error += "Style is empty!";
			}
			if (error == "") {
				$(this).attr('type', 'submit');
			} else {
				$("#msg-error-st").css("visibility", "visible");
				$("#msg-error-st").text(error);
			}
		});
	</script>

	<script type="text/javascript">
		$("#add-gender").click(function() {
			var name = $("#gender").val();
			var error = "";
			if (name == "") {
				error += "Gender is empty!";
			}
			if (error == "") {
				$(this).attr('type', 'submit');
			} else {
				$("#msg-error-ge").css("visibility", "visible");
				$("#msg-error-ge").text(error);
			}
		});
	</script>

	<script type="text/javascript">
		$("#add-brand").click(function() {
			var name = $("#brand").val();
			var error = "";
			if (name == "") {
				error += "Brand is empty!";
			}
			if (error == "") {
				$(this).attr('type', 'submit');
			} else {
				$("#msg-error-br").css("visibility", "visible");
				$("#msg-error-br").text(error);
			}
		});
	</script>
	<script type="text/javascript">
		$("#add-size").click(function() {
			var name = $("#sizenumber").val();
			var error = "";
			if (name == "") {
				error += "Size number is empty!";
			}
			if (error == "") {
				$(this).attr('type', 'submit');
			} else {
				$("#msg-error-s").css("visibility", "visible");
				$("#msg-error-s").text(error);
			}
		});
	</script>
	<script type="text/javascript">
		$("#addgallery").click(function() {
			window.location.href = "/ShopTandT/admin/gallery/add";
		});
	</script>

	<script>
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


	<!-- EDIT PRODUCT -->
	<script>
		function productedit(x) {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				window.location.assign(url + "/edit/" + x.name);
			};
			xhr.send();
			return false;
		}
	</script>
	<!-- DELETE PRODUCT -->
	<script>
		$(".btn-del-product").click(
				function() {
					$(".message-notify").removeClass("none");
					$(".content-msg-notify").text(
							"Are you sure you want to delete this product?");
					var id_prod = this.id;
					$('.ok-notify').click(function() {
						$(".message-notify").addClass("none");
						alert(id_prod);
						$(".message-done").removeClass("none");
						$(".content-msg-done").text("Successfully deleted!");
						$('.ok-done').click(function() {
							$(".message-done").addClass("none");
							location.reload();
						});
					});
				});
	</script>


	<script>
		$('.cancel').click(function() {
			$(".message").addClass("none");
			location.reload();
		});
	</script>

	<script type="text/javascript">
		$("#addcolorsize")
				.click(
						function() {
							window.location
									.assign("/ShopTandT/admin/product/add-product-color-size");
						});
	</script>
	<script type="text/javascript">
		// show form add color
		$("#addcolorsize-c").click(function() {
			$("#wrap-c").removeClass("none");
			$("#bg-c").removeClass("none");
		});
		$("#close-c").click(function() {
			$("#wrap-c").addClass("none");
			$("#bg-c").addClass("none");
		});
	</script>
	<script type="text/javascript">
		// show form add size
		$("#addcolorsize-s").click(function() {
			$("#wrap-s").removeClass("none");
			$("#bg-s").removeClass("none");
		});
		$("#close-s").click(function() {
			$("#wrap-s").addClass("none");
			$("#bg-s").addClass("none");
		});
	</script>
	<script type="text/javascript">
		$("#add-color").click(function() {
			var name = $("#color_name").val();
			var rgb = $("#color_rgb").val();
			var error = "";
			if (name == "") {
				error += "Color name is empty!";
			} else if (rgb == "") {
				error += "Rgb is empty!";
			}
			if (error == "") {
				$(this).attr('type', 'submit');
			} else {
				$("#msg-error").css("visibility", "visible");
				$("#msg-error").text(error);
			}
		});
	</script>
</body>

</html>