<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<c:if test="${ product == 'true' }">
	<title>Product management :)</title>
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
<c:if test="${ newProduct == 'true' }">
	<title>Add new product :)</title>
</c:if>
<link rel="stylesheet" href="<c:url value='/assets/css/admin-product.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/admin-login.css'/>">
<style>
	td.td-date {
    min-width: 95px;
}
</style>
<body>
<jsp:include page="../layouts/admin/login.jsp"></jsp:include>
	<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>

		<!-- PRODUCT -->

		<c:if test="${ product == 'true' }">
			<section class="admin-shoes-product">
			<div class="title">
				<img
					src="<c:url value="/assets/images/icons/icons8-used-product-100-title.png"/>"
					alt="">
				<h1>PROCUCT</h1>
			</div>
		</c:if>
		<c:if test="${ newProduct == 'true' }">
			<section class="admin-shoes-product">
			<div class="title">
				<img
					src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
					alt="">
				<h1>ADD NEW PROCUCT</h1>
			</div>
		</c:if>
		<c:if test="${ product == 'false' && newProduct == 'false' }">
			<section class="admin-shoes-product none">
		</c:if>
		
		<div class="nav-history">
			<div class="origin">
				<img
					src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
					alt=""> <a href="/SpringMVC/admin">Home</a>
			</div>
			
			<div>
			<p>/</p>
				<img
					src="<c:url value="/assets/images/icons/icons8-trainers-100-title.png"/>"
					alt=""> <a href="">Shoes</a>
			</div>
			
			<div>
			<p>/</p>
				<img
					src="<c:url value="/assets/images/icons/icons8-used-product-100-title.png"/>"
					alt=""> <a href="/SpringMVC/admin/product">Product</a>
			</div>
			
			
			<c:if test="${ newProduct == 'true' }">
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
						alt=""> <a href="">Add new product</a>
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
							<a href="/SpringMVC/admin/product/add-new-product">
								<button class="addnewshoes addnewproduct" id="addnewshoes-product">
									<img
										src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
										alt="icon-plus">Add New
								</button>
							</a>
						</th>
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
							<td>${ liProduct.style.style_name }</td>
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
								<button class="btn-edit-order btn-edit-product" id="btn-edit-product" name="${ liProduct.id }" onclick="productedit(this)">
									<img
										src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
										alt="">
								</button>
								<button class="btn-del-order btn-del-product" id="${ liProduct.id }">
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
		<c:if test="${ newProduct == 'true' }">
			<div class="table-add-new-product">
		</c:if>	
		<c:if test="${ newProduct == 'false' }">
			<div class="table-add-new-product importantNone">
		</c:if>
			<form action="http://localhost:8888/SpringMVC/admin/product/add-new-product/savefile" method="post" enctype="multipart/form-data">
				<table class="table-new-product">
					<tr>
						<td>
							<div class="id-new-product">
								<p>Title</p>
								<input type="text" id="title" name="title">
							</div>
						</td>
						<td>
							<div class="id-new-product">
								<p>Price</p>
								<input type="number" step="0.01" id="price" name="price">
							</div>
						</td>
						<td>
							<div class="id-new-product">
								<p>Discount</p>
								<input type="number" id="discount" name="discount">
							</div>
						</td>
						<td rowspan="6" class="td-img-display">
							<div class="img-display">
								<img src="" id="preview">
							</div>	
							<div class="btn-add-new-product">
								<input type="button" value="Add" id="btn-addnewproduct" name="btn-addnewproduct">
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<div class="id-new-product">
								<p>Style</p>
								<select class="selected-add-new-product" id="select-style" name="style">
									<option value="" disabled="disabled" selected>Choose style</option>
									<c:forEach var="liStyle" items="${ listStyle }">
										<option value="${ liStyle.id }">${ liStyle.style_name }</option>
									</c:forEach>
								</select>
							</div>
						</td>
						<td>
							<div class="id-new-product">
								<p>Gender</p>
								<select class="selected-add-new-product" id="select-gender" name="gender">
									<option value="" disabled="disabled" selected>Choose gender</option>
									<c:forEach var="liGender" items="${ listGender }">
										<option value="${ liGender.id }">${ liGender.gender_name }</option>
									</c:forEach>
								</select>
							</div>
						</td>
						<td>
							<div class="id-new-product">
								<p>User</p>
								<select class="selected-add-new-product" id="select-user" name="user">
									<option value="" disabled="disabled" selected>Choose user</option>
									<c:forEach var="liUser" items="${ listUser }">
										<c:if test="${ liUser.role.id == 1 }">
											<option value="${ liUser.id }">${ liUser.fullname }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="id-new-product">
								<p>Brand</p>
								<select class="selected-add-new-product" id="select-brand" name="brand">
									<option value="" disabled="disabled" selected>Choose brand</option>
									<c:forEach var="liBrand" items="${ listBrand }">
										<option value="${ liBrand.id }">${ liBrand.brand_name }</option>
									</c:forEach>
								</select>
							</div>
						</td>
						
						<td>
							<div class="id-new-product">
								<p>Color</p>
								<select class="selected-add-new-product" id="select-color" name="color">
									<option value="" disabled="disabled" selected>Choose color</option>
									
									<c:forEach var="liColor" items="${ listColor }">
										<option value="${ liColor.id }" style="background: ${ liColor.rgb };">${ liColor.color_name }</option>
									</c:forEach>
								</select>
							</div>
						</td>
						<td>
							<div class="id-new-product">
									<p>Image</p>
									<input type="file" id="filetag" name="filetag">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3"> 
							<div class="id-new-product-size">
								<p>Size & Quantity</p>
								<div class="list-size-add-new-product">
									<span id="1" onclick="size(this)">32<input class="none" id="1" name="size32" type="number" placeholder="Qty"></span> 
									<span id="2" onclick="size(this)">33<input class="none" id="2" name="size33" type="number" placeholder="Qty"></span>
									<span id="3" onclick="size(this)">34<input class="none" id="3" name="size34" type="number" placeholder="Qty"></span>
									<span id="4" onclick="size(this)">35<input class="none" id="4" name="size35" type="number" placeholder="Qty"></span>
									<span id="5" onclick="size(this)">36<input class="none" id="5" name="size36" type="number" placeholder="Qty"></span>
									<span id="6" onclick="size(this)">37<input class="none" id="6" name="size37" type="number" placeholder="Qty"></span>
									<span id="7" onclick="size(this)">38<input class="none" id="7" name="size38" type="number" placeholder="Qty"></span>
									<span id="8" onclick="size(this)">39<input class="none" id="8" name="size39" type="number" placeholder="Qty"></span>
								</div>
								<div class="list-size-add-new-product">
									<span id="9"  onclick="size(this)">40<input class="none" id="9"   name="size40" type="number" placeholder="Qty"></span> 
									<span id="10" onclick="size(this)">41<input class="none" id="10"  name="size41" type="number" placeholder="Qty"></span> 
									<span id="11" onclick="size(this)">42<input class="none" id="11"  name="size42" type="number" placeholder="Qty"></span> 
									<span id="12" onclick="size(this)">43<input class="none" id="12"  name="size43" type="number" placeholder="Qty"></span> 
									<span id="13" onclick="size(this)">44<input class="none" id="13"  name="size44" type="number" placeholder="Qty"></span> 
									<span id="14" onclick="size(this)">45<input class="none" id="14"  name="size45" type="number" placeholder="Qty"></span> 
									<span id="15" onclick="size(this)">46<input class="none" id="15"  name="size46" type="number" placeholder="Qty"></span> 
									<span id="16" onclick="size(this)">47<input class="none" id="16"  name="size47" type="number" placeholder="Qty"></span> 
								</div>                                                                     
							</div>                                                                                      
						</td>
						
						
					</tr>
					<tr>
						<td colspan="3">
							<div class="phone-number">
								<p>Description</p>
								<textarea maxlength="500" id="txt-description" name="description"></textarea>
							</div>
						</td>
					</tr>
					
				</table>
			</form>
			
		</div>
		</section>
		<div class="behind-zoom-img importantNone">
			
		</div>
		<div class="zoom-img importantNone" id="zoom-img">
				<img id="display-img-onclick" alt="img-onclick" src="<c:url value="/assets/images/users/emiuuu.jpg"/>">
			</div> 
		<!-- Color - Size -->
		<c:if test="${ colorSize == 'true' }">
			<section class="admin-shoes-color-size">
		</c:if>
		<c:if test="${ colorSize == 'false' }">
			<section class="admin-shoes-color-size none">
		</c:if>



		<div class="title">
			<img
				src="<c:url value="/assets/images/icons/icons8-paint-palette-64.png"/>"
				alt="">
			<h1>COLOR - SIZE</h1>
		</div>
		<div class="nav-history">
			<div class="origin">
				<img
					src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
					alt=""> <a href="">Home</a>
			</div>
			<p>/</p>
			<div>
				<img
					src="<c:url value="/assets/images/icons/icons8-trainers-100-title.png"/>"
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
								<button class="addnewshoes">
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
									src="<c:url value="/assets/images/products/${ liPCS.prod.thumbnail }"/>" alt=""></td>
								<td>${ liPCS.id }</td>
								<td>${ liPCS.prod.title }</td>
								<td><span class="td-color-product" style="background: ${ liPCS.color.rgb };"></span></td>
								<td class="td-center">${ liPCS.size.size_number }</td>
								<td class="td-center">${ liPCS.quantity }</td>
								<td class="td-action">
									<button class="btn-edit-order" id="btn-edit-order" name="${ liPCS.id }" value="">
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
								<button class="addnewshoes">
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
								<td><span class="td-color-product" style="background: ${ liColor.rgb };"></span></td>
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
								<button class="addnewshoes addnewproduct">
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
		</section>
		<!-- Gallery -->
		<c:if test="${ gallery == 'true' }">
			<section class="admin-shoes-gallery">
		</c:if>
		<c:if test="${ gallery == 'false' }">
			<section class="admin-shoes-gallery none">
		</c:if>

		<div class="title">
			<img
				src="<c:url value="/assets/images/icons/icons8-image-gallery-100.png"/>"
				alt="">
			<h1>GALLERY</h1>
		</div>
		<div class="nav-history">
			<div class="origin">
				<img
					src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
					alt=""> <a href="">Home</a>
			</div>
			<p>/</p>
			<div>
				<img
					src="<c:url value="/assets/images/icons/icons8-trainers-100-title.png"/>"
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
							<button class="addnewshoes">
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
								src="<c:url value="/assets/images/products/${ liGallery.thumbnail }"/>" alt=""></td>
							<td>${ liGallery.product.title }</td>
							<td><span class="td-color-product" style="background: aqua;"></span></td>
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
		</section>
		<!-- BRAND - STYLE - GENDER -->
		<c:if test="${ bsg == 'true' }">
			<section class="admin-shoes-brand-style-gender">
		</c:if>
		<c:if test="${ bsg == 'false' }">
			<section class="admin-shoes-brand-style-gender none">
		</c:if>


		<div class="title">
			<img src="<c:url value="/assets/images/icons/icons8-brand-58.png"/>"
				alt="">
			<h1>BRAND - STYLE - GENDER</h1>
		</div>
		<div class="nav-history">
			<div class="origin">
				<img
					src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
					alt=""> <a href="">Home</a>
			</div>
			<p>/</p>
			<div>
				<img
					src="<c:url value="/assets/images/icons/icons8-trainers-100-title.png"/>"
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
								<button class="addnewshoes">
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
								<button class="addnewshoes">
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
								<td>${ liStyle.style_name }</td>
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
								<button class="addnewshoes">
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
		</section>

	</div>

	<div class="message msg-order message-notify none">
		<h2 class="msg-h2">
			Message
			<img alt="" src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>"></h2>
		<p class="content-msg content-msg-notify"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" type="button" value="Cancel"> <input
				class="ok ok-notify hover-btn" type="button" value="OK">
		</div>
	</div>
	<div class="message msg-order message-done none">
		<h2 class="msg-h2">
			Message
			<img alt="" src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>"></h2>
		<p class="content-msg content-msg-done"></p>
		<div class="btn-ok-cancel">
			<input
				class="ok ok-done hover-btn" type="button" value="OK">
		</div>
	</div>
	
	

	<div class="msg-done importantNone">Done!</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script>
<!-- zoom img when click -->
		$(".td-img-avt img").click(function () {
			var get = this.src;
			$("#display-img-onclick").attr("src", get);
			$(".zoom-img").removeClass("importantNone");
			$(".behind-zoom-img").removeClass("importantNone");
		});
		$(".behind-zoom-img").click(function () {
			$(".zoom-img").addClass("importantNone");
			$(".behind-zoom-img").addClass("importantNone");
		});
		
	</script>

	<script>
	<!-- get string size -->
	  function getSize(arr) {
		  var txt ="";
		  if(arr.length > 0) {
			  for(let i=0; i<arr.length; i++) {
				  if(i == (arr.length-1)) {
					  txt += arr[i].id +"_"+ arr[i].value;
				  } else {
					  txt += arr[i].id +"_"+ arr[i].value +"/";
				  }
			  }
		  }
		  return txt;
	  }
	</script>

	<script>
	$("#btn-addnewproduct").click(function() {
		var title 		= $("#title").val();
		var price 		= $("#price").val();
		var discount 	= $("#discount").val();
		var style 		= $('#select-style').find(":selected").val();
		var gender 		= $('#select-gender').find(":selected").val();
		var user 		= $('#select-user').find(":selected").val();
		var brand 		= $('#select-brand').find(":selected").val();
		var color	 	= $('#select-color').find(":selected").val();
		var file 		= $('input[type=file]').val();
		var description = $("#txt-description").val();
		var arrSize 	= $('.list-size-add-new-product span input').not('.none');
		var error ="";
		
		if(title=="") {
			error += "Title is empty! \n";
		}
		if(price=="") {
			error += "Price is empty! \n";
		}
		if(discount=="") {
			error += "Discount is empty! \n";
		}
		if(style=="") {
			error += "You haven't chosen a style yet!! \n";
		}
		if(gender=="") {
			error += "You haven't chosen a gender yet!! \n";
		}
		if(user=="") {
			error += "You haven't chosen a user yet!! \n";
		}
		if(brand=="") {
			error += "You haven't chosen a brand yet!! \n";
		}
		if(color=="") {
			error += "You haven't chosen a color yet!! \n";
		}
		if(file=="") {
			error += "You haven't chosen a image yet!! \n";
		}
		if(arrSize.length==0) {
			error += "You must choose at least 1 size! \n";
		}
		if(description=="") {
			error += "Description is empty! \n";
		}
		if(error=="") {
			$(this).attr('type', 'submit');
		} else {
			$(".message-done").removeClass("none");
			$(".content-msg-done").text(
					error);
			$(".content-msg-done").html($(".content-msg-done").html().replace(/\n/g,'<br/>'));
			$('.ok-done').click(function() {
				$(".message-done").addClass("none");
			});
		}
	});
	</script>

<!--  show input to enter quantity when click on size box -->
	<script>
		$(".list-size-add-new-product span").click(function() {
			let checkspan = this.classList;
			
			if(checkspan=="setcolor") {
				let txt = ".list-size-add-new-product #"+this.id+" input";
				
				if($(txt).is(':focus'))
				{
				   
				} else {
					$(txt).addClass("none");
			    	$(this).removeClass("setcolor");
				}
		    	
			} else {
				let txt = ".list-size-add-new-product #"+this.id+" input";
		    	$(txt).removeClass("none");
		    	$(this).addClass("setcolor");
			}
	    });
	</script>


<!-- EDIT PRODUCT -->
	<script>
		function productedit(x) {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				window.location.assign(url+"/edit/"+x.name);
			};
			xhr.send();
			return false;
		}
	</script>
<!-- DELETE PRODUCT -->
	<script>
	    $(".btn-del-product").click(function() {
	    	$(".message-notify").removeClass("none");
			$(".content-msg-notify").text(
					"Are you sure you want to delete this product?");
			var id_prod = this.id;
			$('.ok-notify').click(function() {
				$(".message-notify").addClass("none");
				alert(id_prod);
				$(".message-done").removeClass("none");
				$(".content-msg-done").text(
						"Successfully deleted!");
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

	<script>
		$('.other').click(function() {
			$(".other-menu").removeClass("none", 10000, "easeInBack");
		});
	</script>

	<script>
		$(document).ready(function() {
			$(".admin-menu-icon").click(function() {
				$(".navigation").toggle("none");
			});
		});
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
						$(arrP[i]).toggleClass("rotate");
					}
				}
			});
		});
	</script>
	

	<!-- choose image and display -->
  <script>

    var fileTag = document.getElementById("filetag"),
      preview = document.getElementById("preview");

    fileTag.addEventListener("change", function () {
      changeImage(this);
    });

    function changeImage(input) {
      var reader;

      if (input.files && input.files[0]) {
        reader = new FileReader();

        reader.onload = function (e) {
          preview.setAttribute('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
      }
    }
  </script>
</body>

</html>