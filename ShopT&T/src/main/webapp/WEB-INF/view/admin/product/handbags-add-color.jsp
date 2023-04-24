
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${giftscolorsize == 'true' }">
	<title>Add Gifts Color</title>
</c:if>

<c:if test="${ giftscolorsize == null }">
	<title>Add Handbags Color</title>
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
<link rel="stylesheet" href="<c:url value='/assets/css/colorjoe.css'/>">
<style>
.message input {
	width: 100px;
}

.table-add-new-product {
	margin-top: 0;
	margin-left: 0;
	width: 100%;
}

.id-new-product {
	margin-top: 7px;
	width: 100%;
}

.selected-add-new-product {
	height: 40px;
}

.btn-add-new-product input {
	cursor: pointer;
}

.id-new-product-size {
	margin-top: 15px;
}

.list-size-add-new-product {
	margin-bottom: 15px;
	width: 93%;
}

.btn-add-new-product {
	margin-left: -30px;
	margin-top: 15px;
}

.list-size-add-new-product span {
	height: 40px;
	width: 40px;
	justify-content: unset;
	padding: 0 10px;
	margin-right: 18%;
	border: 1px solid #cb82a9;
}

.list-size-add-new-product input {
	width: 80px;
	margin-left: 30px;
	border: 2px solid #cb82a9;
}

table.table-new-product {
	margin-top: 10px;
	width: 100%;
}

.img-display {
	max-width: 540px;
	height: 540px;
	overflow: hidden;
	justify-content: center;
	display: flex;
	margin-top: 15px;
}

.selected-add-new-product {
	width: 90%;
}

input.cancel {
	width: 124px;
}

.gallery {
	width: 515px;
	height: 510px;
	overflow-y: scroll;
	overflow-x: hidden;
	margin-top: 15px;
}

.gallery img {
	width: 100%;
}

.container {
	margin-left: 52px;
	margin-top: 0px;
	width: 527px;
}

.new-color-size-clothing td {
	width: 50%;
}

.form-add-color input {
	margin-top: 10px;
	padding: 5px 10px;
}

.form-add-color button {
	cursor: pointer;
	margin-top: 27px;
	padding: 5px 30px;
	background: #cb82a9;
	color: white;
}

.list-size-add-new-product div {
	margin-bottom: 10px;
	display: flex;
	width: 100%;
}

.list-size-add-new-product {
	width: 90%;
	display: block;
	height: 390px;
	overflow-y: scroll;
	border: 1px solid #cb82a9;
	border-right: 0;
	border-left: 0;
	padding-top: 4px;
	padding-left: 20px;
}

p.nocolor {
	display: flex;
	justify-content: space-between;
	width: 90%;
}

span#not-color {
	cursor: pointer;
	color: #0086ff;
	text-decoration: underline;
	font-size: 14px;
	color: #0086ff;
}

span#not-color:hover {
	color: darkblue;
}

input#quantity {
	width: 90%;
	height: 40px;
	padding: 0px 5px 0 5px;
	border: 0;
	font-size: 18px;
	border-left: 2px solid #cb82a9;
}
</style>

<body>
	<div class="admin-body">
		<jsp:include page="../../layouts/admin/a-nav.jsp"></jsp:include>
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
						alt="" style="opacity: 0.6;"> <a href="">Products</a>
				</div>
				<div>
					<p>/</p>
					<img src="<c:url value="/assets/images/icons/icons8-bag-100.png"/>"
						alt="">
					<c:if test="${giftscolorsize == 'true' }">
						<a href="/ShopTandT/admin/product/handbags">Gifts</a>
					</c:if>
					<c:if test="${giftscolorsize == null }">
						<a href="/ShopTandT/admin/product/handbags">Handbags</a>
					</c:if>

				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
						alt="">
					<c:if test="${giftscolorsize == 'true' }">
						<a href="">Add Gifts Color</a>
					</c:if>
					<c:if test="${giftscolorsize == null }">
						<a href="">Add Handbags Color</a>
					</c:if>

				</div>
			</div>

			<div class="table-add-new-product">
				<form id="myform" method="post" enctype="multipart/form-data">
					<table class="table-new-product">
						<tr>
							<td>
								<div class="id-new-product">
									<p>Product</p>
									<select class="selected-add-new-product" id="select-product"
										name="product">
										<option value="" disabled="disabled" selected>Choose
											product</option>

										<c:forEach var="liProduct" items="${ listProduct }">
											<option value="${ liProduct.id }">${ liProduct.id }
												- ${ liProduct.title }</option>
										</c:forEach>
									</select>
								</div>
							</td>
							<td rowspan="6" class="td-img-display">
								<div class="container">
									<div class="colorjoe"></div>
									<div class="config">
										<div class="config-title">Selected Color</div>
										<div class="selected-color-text"></div>
										<div class="selected-color"></div>
										<div class="config-title">Save Colors</div>
										<div class="form-add-color">
											<input type="hidden" id="color_rgb" name="colorrgb" value="">
											<input type="text" id="color_name" name="colorname"
												placeholder="Enter color name">
											<button type="button" id="addcolor">ADD</button>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="id-new-product-size">
									<p class="nocolor">
										<span id="name-sp">Color</span><span id="not-color">Without
											Color</span>
									</p>
									<div class="qty none">
										<input id="quantity" name="quantity" value="">
									</div>
									<div class="list-size-add-new-product">
										<c:set var="count" value="${ 0 }" />
										<c:forEach var="liColor" items="${ listColor }"
											varStatus="index">
											<c:set var="idx" value="${ index.getIndex() }" />
											<c:set var="count" value="${ index.getIndex() }" />
											<c:if test="${ idx % 4 == 0 }">
												<div>
													<span id="${ liColor.id }"
														style="background: ${ liColor.rgb };"><input
														class="none" id="${ liColor.id }"
														name="color${ liColor.id }" type="number"
														placeholder="Qty"></span>
											</c:if>
											<c:if test="${ (idx+2) % 4 == 0 || (idx+3) % 4 == 0 }">
												<span id="${ liColor.id }"
													style="background: ${ liColor.rgb };"><input
													class="none" id="${ liColor.id }"
													name="color${ liColor.id }" type="number" placeholder="Qty"></span>
											</c:if>
											<c:if test="${ (idx+1) % 4 == 0 }">
												<span id="${ liColor.id }"
													style="background: ${ liColor.rgb };"><input
													class="none" id="${ liColor.id }"
													name="color${ liColor.id }" type="number" placeholder="Qty"></span>
									</div>
									</c:if>
									</c:forEach>
									<c:if test="${ (count+1) % 4 != 0 }">
								</div> </c:if>
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="btn-add-new-product">
									<input type="button" value="Add" id="btn-addnewproduct"
										name="btn-addnewproduct">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<jsp:include page="../../layouts/admin/a-footer.jsp"></jsp:include>
		</section>
	</div>

	<div class="message msg-order message-notify none" id="gallery-add">
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

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
		$("#not-color").click(function(){
			var txt = $("#not-color").text();
			if(txt.includes("With Color")) {
				$(".list-size-add-new-product").removeClass("importantNone");
				$("#name-sp").text("Color");
				$("#not-color").text("Without Color");
				$(".qty").addClass("none");
			} else {
				$(".list-size-add-new-product").addClass("importantNone");
				$("#name-sp").text("Quantity");
				$("#not-color").text("With Color");
				$(".qty").removeClass("none");
			}
		});
	</script>

	<script>
		$(".list-size-add-new-product span").click(function() {
			let checkspan = this.classList;
			if (checkspan == "setcolor-null") {
				let txt = ".list-size-add-new-product #" + this.id + " input";
				if ($(txt).is(':focus')) {
				} else {
					$(txt).addClass("none");
					$(this).removeClass("setcolor-null");
				}
			} else {
				let txt = ".list-size-add-new-product #" + this.id + " input";
				$(txt).removeClass("none");
				$(this).addClass("setcolor-null");
			}
		});
	</script>

	<script>
		$("#btn-addnewproduct").click(
				function() {
					var get = this;
					var cClass = $(".list-size-add-new-product").attr("class");
					var product = $('#select-product').find(":selected").val();
					var error = "";
					var qty="";
					if(cClass.includes("importantNone")) {
						qty = $("#quantity").val();
						if (product == "") {
							error += "You haven't chosen a product yet!! \n";
						} else if (qty == "") {
							error += "Quantity is empty!!?";
						}
					} else {
						var arrSize = $('.list-size-add-new-product span input')
						.not('.none');
						if (product == "") {
							error += "You haven't chosen a product yet!! \n";
						} else if (arrSize.length <= 0) {
							error += "You haven't chosen a color yet!!? \n";
						}
					}

					if (error == "") {
						if(cClass.includes("importantNone")) {
								window.location.href = "/ShopTandT/admin/product/add-gifts-color?productid="+product+"&qty="+qty;
						} else {
							$(get).attr('type', 'submit');
						}
					} else {
						$(".message-done").removeClass("none");
						$(".content-msg-done").text(error);
						$(".content-msg-done").html(
								$(".content-msg-done").html().replace(/\n/g,
										'<br/>'));
						$('.ok-done').click(function() {
							$(".message-done").addClass("none");
						});
					}
				});
	</script>

	<script type="text/javascript">
   	$("#addcolor").click(function() {
   		var name = $("#color_name").val();
   		if(name == "") {
   			$(".message-done").removeClass("none");
			$(".content-msg-done").text("Color name is empty!");
			$('.ok-done').click(function() {
				$(".message-done").addClass("none");
			});
   		} else {
   			$('#myform').attr('action', '/ShopTandT/admin/color-size/add-color?handbags');
   			$("#addcolor").attr('type', 'submit');
   		}
   	});
   </script>

	<script type="text/javascript">
		$(function() {
		    // Multiple images preview in browser
		    var imagesPreview = function(input, placeToInsertImagePreview) {
		        if (input.files) {
		            var filesAmount = input.files.length;
		            for (i = 0; i < filesAmount; i++) {
		                var reader = new FileReader();
		                reader.onload = function(event) {
		                    $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
		                }
		                reader.readAsDataURL(input.files[i]);
		            }
		        }
		    };
		    $('#filetag').on('change', function() {
		    	$("#gallery img").remove();
		        imagesPreview(this, 'div.gallery');
		    });
		});
	</script>

	<script src="<c:url value='/assets/js/colorjoe.min.js'/>"></script>
	<script>
        class ColorPicker {
            constructor(root) {
                this.root = root;
                this.colorjoe = colorjoe.rgb(this.root.querySelector(".colorjoe"));
                this.selectedColor = null;
                this.savedColors = this.getSavedColors();
                this.colorjoe.show();
                this.setSelectedColor("#009578");
                this.colorjoe.on("change", color => {
                    this.setSelectedColor(color.hex(), true);
                });
            }
            setSelectedColor(color, skipCjUpdate = false) {
                this.selectedColor = color;
                $("#color_rgb").val(color);
                this.root.querySelector(".selected-color-text").textContent = color;
                this.root.querySelector(".selected-color").style.background = color;
                if (!skipCjUpdate) {
                    this.colorjoe.set(color);
                }
            }
            getSavedColors() {
                const saved = JSON.parse(localStorage.getItem("colorpicker-saved") || "[]");
                return new Array(5).fill("#ffffff").map((defaultColor, i) => {
                    return saved[i] || defaultColor;
                });
            }
            showSavedColor(element, color) {
                element.style.background = color;
                element.dataset.color = color;
            }
            saveColor(color, i) {
                this.savedColors[i] = color;
                localStorage.setItem("colorpicker-saved", JSON.stringify(this.savedColors));
            }
        }
        const cp = new ColorPicker(document.querySelector(".container"));
    </script>

	<script type="text/javascript">
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
</body>
</html>