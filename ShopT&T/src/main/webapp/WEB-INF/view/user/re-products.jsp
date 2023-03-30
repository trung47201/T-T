<!DOCTYPE html>
<html lang="en">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>${ title }:)</title>
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-index.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/swiper-bundle.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">


<link rel="stylesheet" href="<c:url value="/assets/css/re-home.css"/>">
<link rel="stylesheet"
	href='<c:url value="/assets/css/login-icon.css"/>'>
<link rel="stylesheet" href="<c:url value="/assets/css/navscroll.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/r-products.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/checkbox-radio-input.css"/>">
<body style="color: #222121;">
	<c:if test="${ sessionScope.userid != null}">
		<c:set var="id_user" value="${ sessionScope.userid }" />
	</c:if>

	<jsp:include page="../layouts/user/re-menu.jsp"></jsp:include>
	<div class="back-header">
		<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
	</div>
	<header class="container-xl header-content">
		<div class="img-header">
			<img alt=""
				src="<c:url value="/assets/images/poster/storepic2_1200x.webp"/>">
		</div>

		<!--########################################3   START PRODUCTS   ###########################################-->
		<div class="text">
			<p class="cool">
				<span data-text="${ title }" style="color: white;">${ title }</span>
			</p>
		</div>

		<c:if test="${ listProducts != null}">
			<div class="content-products">
				<!-- CATEGORY PRODUCTS -->
				<div class="wrapper-category">
					<div class="category-products">
						<div class="sortby-products">
							<h5>Sort by</h5>
							<div class="sortby-cbb">
								<select name="" id="" onchange="sortby(this)">
									<option value="" disabled
										<c:if test="${ selectedSortBy == null }">
										<c:out value="selected"></c:out>
									</c:if>>Choose...</option>
									<option value="toprating"
										<c:if test="${ selectedSortBy == 'toprating' }">
										<c:out value="selected"></c:out>
									</c:if>>Top
										Rating</option>
									<option value="newest"
										<c:if test="${ selectedSortBy == 'newest' }">
										<c:out value="selected"></c:out>
									</c:if>>Newest</option>
									<option value="price:asc"
										<c:if test="${ selectedSortBy == 'price:asc' }">
										<c:out value="selected"></c:out>
									</c:if>>Price</option>
									<option value="stylename"
										<c:if test="${ selectedSortBy == 'stylename' }">
										<c:out value="selected"></c:out>
									</c:if>>Style
										Name</option>
									<option value="salesoff"
										<c:if test="${ selectedSortBy == 'salesoff' }">
										<c:out value="selected"></c:out>
									</c:if>>Sales
										Off</option>
								</select>
							</div>
						</div>
						<hr class="cartegory">
						<div class="cost-products">
							<h5>Cost</h5>
							<div class="cost-table">
								<table>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '0_25' }">
												<input type="radio" name="filterbycost" id="1" value="0_25"
													onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '0_25' }">
												<input type="radio" name="filterbycost" id="1" value="0_25"
													onclick="price(this)">
											</c:if></td>
										<td>Up to $25</td>
									</tr>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '25_50' }">
												<input type="radio" name="filterbycost" id="2" value="25_50"
													onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '25_50' }">
												<input type="radio" name="filterbycost" id="2" value="25_50"
													onclick="price(this)">
											</c:if></td>
										<td>$25 to $50</td>
									</tr>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '50_100' }">
												<input type="radio" name="filterbycost" id="3"
													value="50_100" onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '50_100' }">
												<input type="radio" name="filterbycost" id="3"
													value="50_100" onclick="price(this)">
											</c:if></td>
										<td>$50 to $100</td>
									</tr>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '100_250' }">
												<input type="radio" name="filterbycost" id="4"
													value="100_250" onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '100_250' }">
												<input type="radio" name="filterbycost" id="4"
													value="100_250" onclick="price(this)">
											</c:if></td>
										<td>$100 to $250</td>
									</tr>
									<tr>
										<td class="radio"><c:if
												test="${ checkedPrice == '250_more' }">
												<input type="radio" name="filterbycost" id="5"
													value="250_more" onclick="price(this)" checked>
											</c:if> <c:if test="${ checkedPrice != '250_more' }">
												<input type="radio" name="filterbycost" id="5"
													value="250_more" onclick="price(this)">
											</c:if></td>
										<td>$250 or more</td>
									</tr>
								</table>
							</div>
							<div class="cost-input">
								<input type="number" name="priceMin" id="priceMin" min="0"
									placeholder="Min"> <input type="number" name="priceMax"
									id="priceMax" min="0" placeholder="Max">
							</div>
							<div class="cost-submit">
								<input type="button" onclick="goPrice()" value="Go">
							</div>
						</div>
						<hr class="cartegory">
						<div class="size-products">
							<h5>Size</h5>
							<div class="size-list">
								<c:set var="idx" value="${ 0 }" />
								<c:forEach var="listSize" items="${ listSize }" varStatus="i">

									<c:set var="idxS" value="${ i.getIndex() }"></c:set>
									<c:if test="${ idxS < 14 }">
										<c:set var="idx" value="${ i.getCount() }" />
										<c:if test="${ (idxS)%4==0 }">
											<div class="line1">
												<c:if test="${not empty checkedSize[listSize.id] }">
													<span class="sizeColor active" onclick="getSize(this)"
														id="${ listSize.id }">${ listSize.size_number }</span>
												</c:if>
												<c:if test="${ empty checkedSize[listSize.id] }">
													<span class="sizeColor" onclick="getSize(this)"
														id="${ listSize.id }">${ listSize.size_number }</span>
												</c:if>
										</c:if>
										<c:if test="${ (idxS-1)%4==0 || (idxS-2)%4==0 }">
											<c:if test="${not empty checkedSize[listSize.id] }">
												<span class="sizeColor active" onclick="getSize(this)"
													id="${ listSize.id }">${ listSize.size_number }</span>
											</c:if>
											<c:if test="${ empty checkedSize[listSize.id] }">
												<span class="sizeColor" onclick="getSize(this)"
													id="${ listSize.id }">${ listSize.size_number }</span>
											</c:if>
										</c:if>
										<c:if test="${ (idxS+1)%4==0 }">
											<c:if test="${not empty checkedSize[listSize.id] }">
												<span class="sizeColor active" onclick="getSize(this)"
													id="${ listSize.id }">${ listSize.size_number }</span>
											</c:if>
											<c:if test="${ empty checkedSize[listSize.id] }">
												<span class="sizeColor" onclick="getSize(this)"
													id="${ listSize.id }">${ listSize.size_number }</span>
											</c:if>
							</div>
		</c:if>
		</c:if>
		<c:if test="${ idxS == 14 }">
			<c:if test="${not empty checkedSize[listSize.id] }">
				<span class="sizeColor active" onclick="getSize(this)"
					id="${ listSize.id }">${ listSize.size_number }</span>
				<span class="moreSize" id="noneMore">+</span>
			</c:if>
			<c:if test="${ empty checkedSize[listSize.id] }">
				<span class="moreSize" id="noneMore">+</span>
				<span class="none sizeColor more-Size" onclick="getSize(this)"
					id="${ listSize.id }">${ listSize.size_number }</span>
			</c:if>

		</c:if>
		<c:if test="${ idxS > 14 }">
			<c:set var="idx" value="${ i.getCount() }" />
			<c:if test="${ (idxS)%4==0 }">
				<div class="line1">
					<c:if test="${not empty checkedSize[listSize.id] }">
						<span class="none more-Size sizeColor active"
							onclick="getSize(this)" id="${ listSize.id }">${ listSize.size_number }</span>
					</c:if>
					<c:if test="${ empty checkedSize[listSize.id] }">
						<span class="none more-Size" onclick="getSize(this)"
							id="${ listSize.id }">${ listSize.size_number }</span>
					</c:if>
			</c:if>
			<c:if test="${ (idxS-1)%4==0 || (idxS-2)%4==0 }">
				<c:if test="${not empty checkedSize[listSize.id] }">
					<span class="none more-Size sizeColor active"
						onclick="getSize(this)" id="${ listSize.id }">${ listSize.size_number }</span>
				</c:if>
				<c:if test="${ empty checkedSize[listSize.id] }">
					<span class="none more-Size" onclick="getSize(this)"
						id="${ listSize.id }">${ listSize.size_number }</span>
				</c:if>
			</c:if>
			<c:if test="${ (idxS+1)%4==0 }">
				<c:if test="${not empty checkedSize[listSize.id] }">
					<span class="none more-Size sizeColor active"
						onclick="getSize(this)" id="${ listSize.id }">${ listSize.size_number }</span>
				</c:if>
				<c:if test="${ empty checkedSize[listSize.id] }">
					<span class="none more-Size" onclick="getSize(this)"
						id="${ listSize.id }">${ listSize.size_number }</span>
				</c:if>
				</div>
			</c:if>
		</c:if>
		</c:forEach>
		<c:if test="${ idx%4 != 0 }">
			</div>
		</c:if>
		</div>
		</div>
		<hr class="cartegory">
		<div class="color-products">
			<h5>Color</h5>
			<div class="color-list">
				<c:forEach var="liColor" items="${ color }" varStatus="index">
					<c:if test="${ index.getIndex() < 9 }">
						<div class="line">
							<c:if test="${not empty checkedColor[liColor.id] }">
								<span onclick="getColor(this)" id="${ liColor.id }"
									class="color active2" style="background: ${ liColor.rgb };"></span>
								<span onclick="getColor(this)" id="${ liColor.id }"
									class="txt checked-color">${ liColor.color_name }</span>
							</c:if>
							<c:if test="${ empty checkedColor[liColor.id] }">
								<span onclick="getColor(this)" id="${ liColor.id }"
									class="color" style="background: ${ liColor.rgb };"></span>
								<span onclick="getColor(this)" id="${ liColor.id }" class="txt">${ liColor.color_name }</span>
							</c:if>
						</div>
					</c:if>

					<c:if test="${ index.getIndex() >= 9 }">
						<c:if test="${ index.getIndex() != 13 }">
							<div class="line more-color lmc">
								<c:if test="${not empty checkedColor[liColor.id] }">
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="color active2" style="background: ${ liColor.rgb };"></span>
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="txt checked-color">${ liColor.color_name }</span>
								</c:if>
								<c:if test="${ empty checkedColor[liColor.id] }">
									<span onclick="getColor(this)" id="${ liColor.id }"
										class="color" style="background: ${ liColor.rgb };"></span>
									<span onclick="getColor(this)" id="${ liColor.id }" class="txt">${ liColor.color_name }</span>
								</c:if>
							</div>
						</c:if>
					</c:if>
					<c:if test="${ index.getIndex() == 13 }">
						<div class="line">
							<c:if test="${fn:contains(checkedColor, liColor.id)}">
								<span onclick="getColor(this)" id="${ liColor.id }"
									class="color active2" style="background: ${ liColor.rgb };"></span>
								<span onclick="getColor(this)" id="${ liColor.id }"
									class="txt checked-color">${ liColor.color_name }</span>
							</c:if>
							<c:if test="${not fn:contains(checkedColor, liColor.id)}">
								<span onclick="getColor(this)" id="${ liColor.id }"
									class="color" style="background: ${ liColor.rgb };"></span>
								<span onclick="getColor(this)" id="${ liColor.id }" class="txt">${ liColor.color_name }</span>
							</c:if>
						</div>
						<div class="line btn-more" id="moreColor">
							<span id="" class="more color" style="background: none;">+</span>
							<span id="" class="txt">More</span>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<hr class="cartegory">
		<div class="gender-products">
			<h5>Gender</h5>
			<div class="gender-list">
				<div class="line1-gender-product">
					<!-- Men -->
					<c:if test="${ checkedGender == 'men' }">
						<span class="sizeColor active" onclick="getGender(this)" id="men">Men</span>
						<span class="sizeColor" onclick="getGender(this)" id="women">Women</span>
					</c:if>

					<c:if test="${ checkedGender == 'women' }">
						<span class="sizeColor" onclick="getGender(this)" id="men">Men</span>
						<span class="sizeColor active" onclick="getGender(this)"
							id="women">Women</span>
					</c:if>

					<c:if test="${checkedGender != 'men' && checkedGender != 'women' }">
						<span class="sizeColor" onclick="getGender(this)" id="men">Men</span>
						<span class="sizeColor" onclick="getGender(this)" id="women">Women</span>
					</c:if>
				</div>
			</div>
		</div>

		</div>
		<div class="reset-apply-products">
			<div class="reset-products">
				<input type="button" onclick="resetAll()" value="Reset">
			</div>
		</div>

		</div>
		</c:if>


		<!-- LIST PRODUCTS -->
		<div class="list-products">
			<!--Line 1-->
			<c:set var="prodCount" value="${ 0 }"></c:set>
			<c:forEach var="listProd" items="${ listProducts }" varStatus="i">
				<c:set var="prodCount" value="${ i.getCount() }"></c:set>
				<c:if test="${ i.getIndex() < 20 }">
					<c:set var="idx" value="${ i.getIndex() }"></c:set>
					<c:if test="${ idx%4==0 }">
						<div class="line-products">
							<div class="products-el">
								<c:if test="${listProd.discount > 0 }">
									<div class="img-product-products zoom zoo"
										id="${ listProd.id }" name="${listProd.discount }%">
										<img
											src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
											alt="img-product">
									</div>
								</c:if>
								<c:if test="${listProd.discount <= 0 }">
									<div class="img-product-products zoom" id="${ listProd.id }">
										<img
											src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
											alt="img-product">
									</div>
								</c:if>
								<div class="content-product-products">
									<div class="brand-product-products" id="${ listProd.sub_category.id }">${ listProd.sub_category.sub_category_name }</div>
									<div class="name-product-products" id="${ listProd.id }">${ listProd.title }</div>
									<div class="show-products">
										<div class="price-product-products">
											<c:if test="${ listProd.discount <= 0 }">
												<div class="price-sale-products">$${ listProd.price }</div>
											</c:if>
											<c:if test="${ listProd.discount > 0 }">
												<div class="price-sale-products">
													$<fmt:formatNumber type="number" maxFractionDigits="2"
														value="${ listProd.price - listProd.price*listProd.discount/100 }" />
												</div>
												<div class="price-old-products">
													<b>$${ listProd.price }</b>
												</div>
											</c:if>

										</div>
										<div class="rate-product-products">
											5.0
											<div class="img-rate-product-products">
												<img src="<c:url value="/assets/images/icons/star24.png"/>"
													alt="">
											</div>
											| Sold (${ listProd.sold })
										</div>
										<div class="favorite-product-products">
											<div class="show-function">
												<button class="favorite-product">
													<i class="fa fa-heart" aria-hidden="true"></i>
												</button>

												<button type="submit" class="add-to-cart" name="add-to-cart"
													value="${ listProd.id }">
													<i class="fa fa-cart-plus" aria-hidden="true"></i>
												</button>
												<button class="buy-now" class="shadow-1"
													id="${ listProd.id }">Buy now</button>
											</div>
										</div>
									</div>
								</div>
							</div>
					</c:if>

					<c:if test="${ (idx+1)%4==0 }">
						<div class="products-el">
							<c:if test="${listProd.discount > 0 }">
								<div class="img-product-products zoom zoo" id="${ listProd.id }"
									name="${listProd.discount }%">
									<img
										src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
										alt="img-product">
								</div>
							</c:if>
							<c:if test="${listProd.discount <= 0 }">
								<div class="img-product-products zoom" id="${ listProd.id }">
									<img
										src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
										alt="img-product">
								</div>
							</c:if>
							<div class="content-product-products">
								<div class="brand-product-products" id="${ listProd.sub_category.id }">${ listProd.sub_category.sub_category_name }</div>
								<div class="name-product-products" id="${ listProd.id }">${ listProd.title }</div>
								<div class="show-products">
									<div class="price-product-products">
										<c:if test="${ listProd.discount <= 0 }">
											<div class="price-sale-products">$${ listProd.price }</div>
										</c:if>
										<c:if test="${ listProd.discount > 0 }">
											<div class="price-sale-products">
												$<fmt:formatNumber type="number" maxFractionDigits="2"
													value="${ listProd.price - listProd.price*listProd.discount/100 }" />
											</div>
											<div class="price-old-products">
												<b>$${ listProd.price }</b>
											</div>
										</c:if>

									</div>
									<div class="rate-product-products">
										5.0
										<div class="img-rate-product-products">
											<img src="<c:url value="/assets/images/icons/star24.png"/>"
												alt="">
										</div>
										| Sold (${ listProd.sold })
									</div>
									<div class="favorite-product-products">
										<div class="show-function">
											<button class="favorite-product">
												<i class="fa fa-heart" aria-hidden="true"></i>
											</button>
											<button type="submit" class="add-to-cart" name="add-to-cart"
												value="${ listProd.id }">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<button class="buy-now" class="shadow-1"
												id="${ listProd.id }">Buy now</button>
										</div>
									</div>
								</div>
							</div>
						</div>
		</div>
		</c:if>

		<c:if test="${ (idx-1 )%4==0 || (idx-2)%4==0 }">
			<div class="products-el">
				<c:if test="${listProd.discount > 0 }">
					<div class="img-product-products zoom zoo" id="${ listProd.id }"
						name="${listProd.discount }%">
						<img
							src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
							alt="img-product">
					</div>
				</c:if>
				<c:if test="${listProd.discount <= 0 }">
					<div class="img-product-products zoom" id="${ listProd.id }">
						<img
							src="<c:url value="/assets/images/products/${ listProd.thumbnail }"/>"
							alt="img-product">
					</div>
				</c:if>
				<div class="content-product-products">
					<div class="brand-product-products" id="${ listProd.sub_category.id }">${ listProd.sub_category.sub_category_name }</div>
					<div class="name-product-products" id="${ listProd.id }">${ listProd.title }</div>
					<div class="show-products">
						<div class="price-product-products">
							<c:if test="${ listProd.discount <= 0 }">
								<div class="price-sale-products">$${ listProd.price }</div>
							</c:if>
							<c:if test="${ listProd.discount > 0 }">
								<div class="price-sale-products">
									$<fmt:formatNumber type="number" maxFractionDigits="2"
										value="${ listProd.price - listProd.price*listProd.discount/100 }" />
								</div>
								<div class="price-old-products">
									<b>$${ listProd.price }</b>
								</div>
							</c:if>

						</div>
						<div class="rate-product-products">
							5.0
							<div class="img-rate-product-products">
								<img src="<c:url value="/assets/images/icons/star24.png"/>"
									alt="">
							</div>
							| Sold (${ listProd.sold })
						</div>
						<div class="favorite-product-products">
							<div class="show-function">
								<button class="favorite-product">
									<i class="fa fa-heart" aria-hidden="true"></i>
								</button>
								<button type="submit" class="add-to-cart" name="add-to-cart"
									value="${ listProd.id }">
									<i class="fa fa-cart-plus" aria-hidden="true"></i>
								</button>

								<button class="buy-now" class="shadow-1" id="${ listProd.id }">Buy
									now</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		</c:if>
		</c:forEach>


		<c:if test="${ prodCount%4 != 0 && prodCount<=20 }">
			</div>
		</c:if>



		<c:if test="${ listProducts != null}">
			<div class="next-page-products">
				<div class="backward-page">
					<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
				</div>
				<div class="slide-number-page">
					<span class="number-page-selected">1</span> <span>2</span> <span>3</span>
				</div>
				<div class="forward-page">
					<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
				</div>
			</div>
		</c:if>
		</div>

		</div>



	</header>
	<div class="error none-error">
		<h5>Message</h5>
		<div class="content-error" id="content-error"></div>
		<div class="btn-ok-error">
			<input class="okey-error" type="button" value="Okey">
		</div>
	</div>
	<c:if test="${ listProductsEmpty != null && listProducts == null}">
		<hr style="padding: 20px; border: 0; background: #f9e1ee;">
		<div class="msg-empty-product">
			<h4>No products found with keyword "${ keyword }".</h4>
			<img alt="icon-crying"
				src="<c:url value="/assets/images/icons/crying-64.png"/>">
		</div>
	</c:if>
	<c:if test="${ listProductsEmpty == null && listProducts == null }">
		<hr style="padding: 20px; border: 0; background: #f9e1ee;">
		<div class="msg-empty-product">
			<h4>Sorry! Product is being updated.</h4>
			<img alt="icon-crying"
				src="<c:url value="/assets/images/icons/crying-64.png"/>">
		</div>
	</c:if>
	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

	<jsp:include page="../layouts/user/search.jsp"></jsp:include>

	<script> // add to cart
		var id_user = "";
		if(${ sessionScope.userid != null }) {
			id_user = "${ sessionScope.userid }";
		}
		if(id_user != "") {
			$(".add-to-cart").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/add-to-cart/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/"+id_user);
				};
				xhr.send();
			});
		} else {
			$(".add-to-cart").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/cart?id="+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart");
				};
				xhr.send();
			});
		}
	</script>

	<script> // buy now
		var id_user = "";
		if(${ sessionScope.userid != null }) {
			id_user = "${ sessionScope.userid }";
		}
		if(id_user != "") {
			$(".buy-now").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/cart/checkout/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout/"+id_user+"_"+id_prod);
				};
				xhr.send();
			});
			
			$(".buy-effect").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/cart/checkout/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout/"+id_user+"_"+id_prod);
				};
				xhr.send();
			});
		} else {
			$(".buy-now").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/cart/checkout/"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout/"+id_prod);
				};
				xhr.send();
			});
			
			$(".buy-effect").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/cart/checkout/"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout/"+id_prod);
				};
				xhr.send();
			});
		}
	</script>

	<script type="text/javascript"> //check search input
		$(".search-link-icon").click(
				function() {
					var txt = $('#search').val();
					if (txt == "") {
						$(".welcome").removeClass("none");
						$(".welcome h3").html(
								"You have not entered search information!");
					} else {
						$("#search-link-icon").attr("type", "submit");
					}
				});
	</script>

	<script> // click name style in product
		var id_user = 0;
		if(${ sessionScope.userid != null }) {
			id_user = "${ sessionScope.userid }";
		}
		$("div.brand-product-products").click(
			function() {
				
				var id_style = this.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "");
				xhr.onload = function() {
					if(id_user == 0) {
						window.location.assign("/ShopTandT/products?stylename="+ id_style);
					} else {
						window.location.assign("/ShopTandT/products/"+id_user+"?stylename="+ id_style);
					}
					
				};
				xhr.send();
			});
	</script>

	<script> // click name product
		var id_user = "";
		if(${ sessionScope.userid != null }) {
			id_user = "${ sessionScope.userid }";
		}
		$("div.name-product-products").click(
			function() {
				var id_prod = this.id;
				var xhr = new XMLHttpRequest();
				if(id_user != "") {
					xhr.open("GET",
							"/ShopTandT/product-details/"+id_user+"_"+ id_prod);
					xhr.onload = function() {
						window.location
								.assign("/ShopTandT/product-details/"+id_user+"_"+ id_prod);
					};
				} else {
					xhr.open("GET",
							"/ShopTandT/product-details?product-id="
									+ id_prod);
					xhr.onload = function() {
						window.location
								.assign("/ShopTandT/product-details?product-id="
										+ id_prod);
					};
				}
				xhr.send();
			});
		// click image style
		$("div.img-product-products").click(function() {
			var id_prod = this.id;
			var xhr = new XMLHttpRequest();
			if(id_user != "") {
				xhr.open("GET",
						"/ShopTandT/product-details/"+id_user+"_"+ id_prod);
				xhr.onload = function() {
					window.location
							.assign("/ShopTandT/product-details/"+id_user+"_"+ id_prod);
				};
			} else {
				xhr.open("GET",
						"/ShopTandT/product-details?product-id="
								+ id_prod);
				xhr.onload = function() {
					window.location
							.assign("/ShopTandT/product-details?product-id="
									+ id_prod);
				};
			}
			xhr.send();
		});
	</script>

	<script> // click + more size
		$(document).ready(function() {
			$("span.moreSize").click(function() {
				$("span.more-Size").toggleClass("none");
				$("span.moreSize").toggleClass("none");
			});
		});
	</script>

	<script> // click + more color
		$(document).ready(function() {
			$("div.btn-more").click(function() {
				$("div.lmc").toggleClass("more-color");
				$("div.btn-more").toggleClass("more-color");
			});
		});
	</script>

	<script> // click ok to hidden error interface
		$(document).ready(function() {
			$(".okey-error").click(function() {
				$(".error").toggleClass("none-error");
			});
		});
	</script>

	<script type="text/javascript"> // click gender in menu
		function getGender(x) {
			let txt = window.location.href;
			if (txt.includes("gender")) {
				if (txt.includes("&gender")) {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("gender")) {
							if (arr[i] == ("gender=" + x.id)) {
								txt = txt.replace("&" + arr[i], "");
							} else {
								txt = txt.replace(arr[i], "gender=" + x.id);
							}
						}
					}
				} else { // include(?gender)
					const arr1 = txt.split("?");
					const arr = arr1[1].split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("gender")) {
							if (arr[i] == ("gender=" + x.id)) {
								if (arr.length == 1) {
									txt = txt.replace("?" + arr[i], "");
								} else {
									txt = txt.replace(arr[i] + "&", "");
								}
							} else {
								txt = txt.replace(arr[i], "gender=" + x.id);
							}
						}
					}
				}
			} else if (txt.includes("?") && !txt.includes("gender")) {
				txt += "&gender=" + x.id;
			} else {
				txt += "?gender=" + x.id;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();
		}
		function getRate(x) { // select rate in menu
			let txt = window.location.href;
			if (txt.includes("rate")) {
				if (txt.includes("&rate")) {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("rate")) {
							if (arr[i] == ("rate=" + x.id)) {
								txt = txt.replace("&" + arr[i], "");
							} else {
								txt = txt.replace(arr[i], "rate=" + x.id);
							}
						}
					}
				} else {
					const arr1 = txt.split("?");
					const arr = arr1[1].split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("rate")) {
							if (arr[i] == ("rate=" + x.id)) {
								if (arr.length == 1) {
									txt = txt.replace("?" + arr[i], "");
								} else {
									txt = txt.replace(arr[i] + "&", "");
								}
							} else {
								txt = txt.replace(arr[i], "rate=" + x.id);
							}
						}
					}
				}
			} else if (txt.includes("?") && !txt.includes("rate")) {
				txt += "&rate=" + x.id;
			} else {
				txt += "?rate=" + x.id;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();

		}
		function getSize(x) {  // select size in menu
			$(document).ready(function() {
				$(x).toggleClass("active");
			});
			let txt = window.location.href;
			if (txt.includes("size")) {
				//edit
				if (txt.includes("?size")) {
					const arr = txt.split("?");
					for (let i = 0; i < arr.length; i++) {
						const arr1 = arr[i].split("&");
						if (arr1[0].includes("size")) {
							const arr2 = arr1[0].split("=");
							const arr3 = arr2[1].split("/");
							if (arr3.length == 1 && arr3[0] == x.id) {
								if (arr1.length == 1) {
									txt = txt.replace("?" + arr1[0], "");
								} else {
									txt = txt.replace(arr1[0] + "&", "");
								}

							} else {
								if (arr3.includes(x.id)) {
									var getTxt = "";
									for (let j = 0; j < arr3.length; j++) {
										if (arr3[j] == x.id) {
											arr3[j] = 0;
										}
									}
									for (let j = 0; j < arr3.length; j++) {
										if (arr3[j] != 0) {
											getTxt += arr3[j] + "/";
										}
									}
									txt = txt
											.replace(arr1[0], "size=" + getTxt);
								} else {
									if (arr1[0][arr1[0].length - 1] == "/") {
										txt = txt.replace(arr1[0], arr1[0] + ""
												+ x.id);
									} else {
										txt = txt.replace(arr1[0], arr1[0]
												+ "/" + x.id);
									}
								}
							}
						}
					}
				} else {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("size")) {
							const arr1 = arr[i].split("=");
							const arr2 = arr1[1].split("/");
							if (arr2.length == 1 && arr2[0] == x.id) {
								txt = txt.replace("&" + arr[i], "");
							} else {
								if (arr2.includes(x.id)) {
									var getTxt = "";
									for (let j = 0; j < arr2.length; j++) {
										if (arr2[j] == x.id) {
											arr2[j] = 0;
										}
									}
									for (let j = 0; j < arr2.length; j++) {
										if (arr2[j] != 0) {
											getTxt += arr2[j] + "/";
										}
									}
									txt = txt.replace(arr1[1], getTxt);
								} else {
									if (arr[i][arr[i].length - 1] == "/") {
										txt = txt.replace(arr[i], arr[i] + ""
												+ x.id);
									} else {
										txt = txt.replace(arr[i], arr[i] + "/"
												+ x.id);
									}
								}
							}
						}
					}
				}
			} else {
				//not allowed edit
				if (txt.includes("?")) { // inlucde ? not include "size"
					txt = window.location.href + "&size=" + x.id;
				} else {
					txt = window.location.href + "?size=" + x.id;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();

		}
		function getColor(x) { // select color in menu
			let txt = window.location.href;
			if (txt.includes("color")) {
				//edit
				if (txt.includes("?color")) { // inlucde ?, include "color"
					const arr = txt.split("?");
					for (let i = 0; i < arr.length; i++) {
						const arr1 = arr[i].split("&");
						if (arr1[0].includes("color")) {
							const arr2 = arr1[0].split("=");
							const arr3 = arr2[1].split("/");
							if (arr3.length == 1 && arr3[0] == x.id) {
								if (arr1.length == 1) {
									txt = txt.replace("?" + arr1[0], "");
								} else {
									txt = txt.replace(arr1[0] + "&", "");
								}

							} else {
								if (arr3.includes(x.id)) {
									var getTxt = "";
									for (let j = 0; j < arr3.length; j++) {
										if (arr3[j] == x.id) {
											arr3[j] = 0;
										}
									}
									for (let j = 0; j < arr3.length; j++) {
										if (arr3[j] != 0) {
											getTxt += arr3[j] + "/";
										}
									}
									txt = txt.replace(arr1[0], "color="
											+ getTxt);
								} else {
									if (arr1[0][arr1[0].length - 1] == "/") {
										txt = txt.replace(arr1[0], arr1[0] + ""
												+ x.id);
									} else {
										txt = txt.replace(arr1[0], arr1[0]
												+ "/" + x.id);
									}
								}
							}
						}
					}
				} else { // inlucde &, include "color"
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("color")) {
							const arr1 = arr[i].split("=");
							const arr2 = arr1[1].split("/");
							if (arr2.length == 1 && arr2[0] == x.id) {
								txt = txt.replace("&" + arr[i], "");
							} else {
								if (arr2.includes(x.id)) {
									var getTxt = "";
									for (let j = 0; j < arr2.length; j++) {
										if (arr2[j] == x.id) {
											arr2[j] = 0;
										}
									}
									for (let j = 0; j < arr2.length; j++) {
										if (arr2[j] != 0) {
											getTxt += arr2[j] + "/";
										}
									}
									txt = txt.replace(arr1[1], getTxt);
								} else {
									if (arr[i][arr[i].length - 1] == "/") {
										txt = txt.replace(arr[i], arr[i] + ""
												+ x.id);
									} else {
										txt = txt.replace(arr[i], arr[i] + "/"
												+ x.id);
									}
								}
							}
						}
					}
				}
			} else {
				//not allowed edit
				if (txt.includes("?")) { // inlucde ?, not include "color"
					txt = window.location.href + "&color=" + x.id;
				} else { // not inlucde ?, not include "color"
					txt = window.location.href + "?color=" + x.id;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();

		}
		function goPrice() {  // enter price in input
			let a = document.getElementById('priceMin').value;
			let b = document.getElementById('priceMax').value;
			if (a > b) {
				$(".error").toggleClass("none-error");
				document.getElementById("content-error").innerHTML = "Min price must be less than max price";
			} else if (a <= b) {
				let x = a + "_" + b;
				let txt = window.location.href;
				if (txt.includes("price")) { 
					if (txt.includes("?price")) { // inlucde ?, include "price"
						const arr = txt.split("?");
						for (let i = 0; i < arr.length; i++) {
							if (arr[i].includes("price")) {
								const arr1 = arr[i].split("&");
								txt = txt.replace(arr1[0], "price=" + x);
							}
						}
					} else { // inlucde &, include "price"
						const arr = txt.split("&");
						for (let i = 0; i < arr.length; i++) {
							if (arr[i].includes("price")) {
								txt = txt.replace(arr[i], "price=" + x);
							}
						}
					}
				} else { // not include "price"
					if (txt.includes("?")) { // not include "price", include ?
						txt = window.location.href + "&price=" + x;
					} else { // not include "price", not include ?
						txt = window.location.href + "?price=" + x;
					}
				}
				var xhr = new XMLHttpRequest();
				xhr.open("GET", txt);
				xhr.onload = function() {
					window.location.assign(txt);
				};
				xhr.send();
			}
		}
	</script>

	<script> // select price in menu
		function price(x) {
			let txt = window.location.href;
			if (txt.includes("price")) { // include "price"
				if (txt.includes("?price")) { // include ?
					const arr = txt.split("?");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("price")) {
							const arr1 = arr[i].split("&");
							txt = txt.replace(arr1[0], "price=" + x.value);
						}
					}
				} else { //include "price", not include ?
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("price")) {
							txt = txt.replace(arr[i], "price=" + x.value);
						}
					}
				}
			} else { // not include "price"
				if (txt.includes("?")) { // include ?
					txt = window.location.href + "&price=" + x.value;
				} else { // not include ?
					txt = window.location.href + "?price=" + x.value;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();
		}
	</script>

	<script type="text/javascript"> // chosen sort by
		function sortby(x) { // chosen sort 
			let txt = window.location.href;
			if (txt.includes("sortby")) {
				if (txt.includes("?sortby")) {
					const arr = txt.split("?");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("sortby")) {
							const arr1 = arr[i].split("&");
							txt = txt.replace(arr1[0], "sortby=" + x.value);
						}
					}
				} else {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("sortby")) {
							txt = txt.replace(arr[i], "sortby=" + x.value);
						}
					}
				}
			} else {
				if (txt.includes("?")) {
					txt = window.location.href + "&sortby=" + x.value;
				} else {
					txt = window.location.href + "?sortby=" + x.value;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();
		}
	</script>

	<script type="text/javascript"> // click name style
		function stylename(x) { 
			let txt = window.location.href;
			if (txt.includes("stylename")) {
				if (txt.includes("?stylename")) {
					const arr = txt.split("?");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("stylename")) {
							const arr1 = arr[i].split("&");
							txt = txt.replace(arr1[0], "stylename=" + x.id);
						}
					}
				} else {
					const arr = txt.split("&");
					for (let i = 0; i < arr.length; i++) {
						if (arr[i].includes("stylename")) {
							txt = txt.replace(arr[i], "stylename=" + x.id);
						}
					}
				}
			} else {
				if (txt.includes("?")) {
					txt = window.location.href + "&stylename=" + x.id;
				} else {
					txt = window.location.href + "?stylename=" + x.id;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", txt);
			xhr.onload = function() {
				window.location.assign(txt);
			};
			xhr.send();
		}
	</script>

	<script type="text/javascript"> // reset menu
		var id_user = "";
		if(${ sessionScope.userid != null }) {
			id_user = "${ sessionScope.userid }";
		}
		function resetAll() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				if(id_user != 0) {
					if(url.includes("clothing")) {
						window.location.assign("/ShopTandT/products/clothing/"+id_user);
					} else if(url.includes("gifts")) {
						window.location.assign("/ShopTandT/products/gifts/"+id_user);
					} else if(url.includes("shoes")) {
						window.location.assign("/ShopTandT/products/shoes/"+id_user);
					} else if(url.includes("jewelry")) {
						window.location.assign("/ShopTandT/products/jewelry/"+id_user);
					} else if(url.includes("handbags")) {
						window.location.assign("/ShopTandT/products/handbags/"+id_user);
					} else if(url.includes("accessories")) {
						window.location.assign("/ShopTandT/products/accessories/"+id_user);
					} else {
						window.location.assign("/ShopTandT/products/new-arrivals/"+id_user);
					}
				} else {
					if(url.includes("clothing")) {
						window.location.assign("/ShopTandT/products/clothing");
					} else if(url.includes("gifts")) {
						window.location.assign("/ShopTandT/products/gifts");
					} else if(url.includes("shoes")) {
						window.location.assign("/ShopTandT/products/shoes");
					} else if(url.includes("jewelry")) {
						window.location.assign("/ShopTandT/products/jewelry");
					} else if(url.includes("handbags")) {
						window.location.assign("/ShopTandT/products/handbags");
					} else if(url.includes("accessories")) {
						window.location.assign("/ShopTandT/products/accessories");
					} else {
						window.location.assign("/ShopTandT/products/new-arrivals");
					}
				}
			};
			xhr.send();
		}
	</script>

	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<script
		src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"/>"></script>
	<script src="<c:url value="/assets/js/jquery.zoom.js"/>"></script>
	<script>
		var div1 = document.getElementsByClassName('zoom');
		$(document).ready(function() {
			for (let i = 0; i < div1.length; i++) {
				$(div1[i]).zoom();
			}
		});
	</script>

	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="js/login.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>