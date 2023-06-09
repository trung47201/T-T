<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${ clothing == 'false' && shoes == 'false' }">
	<title>Add Color Size</title>
</c:if>
<c:if test="${ clothing == 'true' && shoes == 'false' }">
	<title>Add Color Size for Clothing</title>
</c:if>
<c:if test="${ clothing == 'false' && shoes == 'true' }">
	<title>Add Color Size for Shoes</title>
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
    width: 110px;
}
input.cancel {
    font-size: 18px;
    height: 36px;
}
input.ok {
    font-size: 16px;
    height: 36px;
}
.message.msg-order.message-notify a, .gotogallery a {
    color: blue;
    text-decoration: underline;
    text-underline-offset: 2px;
    font-size: 14px;
    padding: 0px 15px 10px 15px;
}
.gotogallery {
    width: 50%;
    text-align: center;
    margin-top: 10px;
}
.table-add-new-product {
	margin-top: 0;
}

.id-new-product {
	margin-top: 20px;
	width: 100%;
}

.selected-add-new-product {
	height: 40px;
}

.btn-add-new-product input {
	cursor: pointer;
}

.id-new-product-size {
	margin-top: 20px;
}

.list-size-add-new-product {
	margin-bottom: 15px;
	width: 41.3%;
}

.btn-add-new-product {
	margin-top: 40px;
	width: 50%;
}

.list-size-add-new-product span {
	height: 40px;
	width: 40px;
	justify-content: unset;
	padding: 0 10px;
}

.list-size-add-new-product input {
	width: 80px;
	margin-left: 10px;
}

.container {
	margin-left: 52px;
	margin-top: 40px;
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
</style>
<c:if test="${ shoes == 'false' && clothing=='false' }">
	<style>
.btn-add-new-product {
	margin-top: 0 !important;
	width: 50%;
}
s</style>
</c:if>
<body>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/a-nav.jsp"></jsp:include>
		<section class="admin-shoes-product">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>

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

				<c:if test="${ clothing == 'false' && shoes == 'false' }">
					<div>
						<p>/</p>
						<img
							src="<c:url value="/assets/images/icons/icons8-calendar-96.png"/>"
							alt=""> <a href="/ShopTandT/admin/color-size">Color
							Size</a>
					</div>
					<div>
						<p>/</p>
						<img
							src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
							alt=""> <a href="">Add new Color Size</a>
					</div>
				</c:if>
				<c:if test="${ clothing == 'true' && shoes == 'false' }">
					<div>
						<p>/</p>
						<img
							src="<c:url value="/assets/images/icons/icons8-calendar-96.png"/>"
							alt=""> <a href="/ShopTandT/admin/product/clothing">Clothing</a>
					</div>
					<div>
						<p>/</p>
						<img
							src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
							alt=""> <a href="">Add new Color Size</a>
					</div>
				</c:if>
				<c:if test="${ clothing == 'false' && shoes == 'true' }">
					<div>
						<p>/</p>
						<img
							src="<c:url value="/assets/images/icons/icons8-trainers-100-title.png"/>"
							alt=""> <a href="/ShopTandT/admin/product/shoes">Shoes</a>
					</div>
					<div>
						<p>/</p>
						<img
							src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
							alt=""> <a href="">Add new Color Size</a>
					</div>
				</c:if>

			</div>

			<div class="table-add-new-product">
				<c:if test="${ shoes == 'true' }">
					<form id="myform"
						action="/ShopTandT/admin/product/add-shoes-color-size"
						method="post" enctype="multipart/form-data">
				</c:if>
				<c:if test="${ clothing == 'true' }">
					<form id="myform"
						action="/ShopTandT/admin/product/add-clothing-color-size"
						method="post" enctype="multipart/form-data">
				</c:if>
				<c:if test="${ clothing == 'false' && shoes == 'false' }">
					<form id="myform"
						action="/ShopTandT/admin/product/add-product-color-size"
						method="post" enctype="multipart/form-data">
				</c:if>

				<table class="table-new-product new-color-size-clothing">
					<tr>
						<td>
							<div class="id-new-product">
								<p>Product</p>
								<select class="selected-add-new-product" id="select-product"
									name="product">
									<option value="" disabled="disabled" selected>Choose
										product</option>

									<c:forEach var="liProduct" items="${ listProduct }">
										<option value="${ liProduct.id }">${ liProduct.id }-
											${ liProduct.title }</option>
									</c:forEach>
								</select>
							</div>
						</td>
						<td rowspan="3">
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
							<div class="id-new-product">
								<p>Color</p>
								<select class="selected-add-new-product" id="select-color"
									name="color">
									<option value="" disabled="disabled" selected>Choose
										color</option>

									<c:forEach var="liColor" items="${ listColor }">
										<option value="${ liColor.id }"
											style="background-color: ${ liColor.rgb };">${ liColor.id }
											- ${ liColor.color_name }</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="id-new-product-size">
								<p>Size & Quantity</p>
								<c:if test="${ shoes == 'true' }">
									<div class="list-size-add-new-product">
										<span id="1" onclick="size(this)">32<input class="none"
											id="1" name="size32" type="number" placeholder="Qty"></span>
										<span id="2" onclick="size(this)">33<input class="none"
											id="2" name="size33" type="number" placeholder="Qty"></span>
										<span id="3" onclick="size(this)">34<input class="none"
											id="3" name="size34" type="number" placeholder="Qty"></span>
										<span id="4" onclick="size(this)">35<input class="none"
											id="4" name="size35" type="number" placeholder="Qty"></span>
										<span id="5" onclick="size(this)">36<input class="none"
											id="5" name="size36" type="number" placeholder="Qty"></span>
										<span id="6" onclick="size(this)">37<input class="none"
											id="6" name="size37" type="number" placeholder="Qty"></span>
										<span id="7" onclick="size(this)">38<input class="none"
											id="7" name="size38" type="number" placeholder="Qty"></span>
										<span id="8" onclick="size(this)">39<input class="none"
											id="8" name="size39" type="number" placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="9" onclick="size(this)">40<input class="none"
											id="9" name="size40" type="number" placeholder="Qty"></span>
										<span id="10" onclick="size(this)">41<input
											class="none" id="10" name="size41" type="number"
											placeholder="Qty"></span> <span id="11" onclick="size(this)">42<input
											class="none" id="11" name="size42" type="number"
											placeholder="Qty"></span> <span id="12" onclick="size(this)">43<input
											class="none" id="12" name="size43" type="number"
											placeholder="Qty"></span> <span id="13" onclick="size(this)">44<input
											class="none" id="13" name="size44" type="number"
											placeholder="Qty"></span> <span id="14" onclick="size(this)">45<input
											class="none" id="14" name="size45" type="number"
											placeholder="Qty"></span> <span id="15" onclick="size(this)">46<input
											class="none" id="15" name="size46" type="number"
											placeholder="Qty"></span> <span id="16" onclick="size(this)">47<input
											class="none" id="16" name="size47" type="number"
											placeholder="Qty"></span>
									</div>
								</c:if>
								<c:if test="${ clothing == 'true' }">
									<div class="list-size-add-new-product">
										<span id="18" onclick="size(this)">XS<input
											class="none" id="18" name="sizeXS" type="number"
											placeholder="Qty"></span> <span id="19" onclick="size(this)">S<input
											class="none" id="19" name="sizeS" type="number"
											placeholder="Qty"></span> <span id="20" onclick="size(this)">M<input
											class="none" id="20" name="sizeM" type="number"
											placeholder="Qty"></span> <span id="21" onclick="size(this)">L<input
											class="none" id="21" name="sizeL" type="number"
											placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="22" onclick="size(this)">XL<input
											class="none" id="22" name="sizeXL" type="number"
											placeholder="Qty"></span> <span id="23" onclick="size(this)">2XL<input
											class="none" id="23" name="size2XL" type="number"
											placeholder="Qty"></span> <span id="24" onclick="size(this)">3XL<input
											class="none" id="24" name="size3XL" type="number"
											placeholder="Qty"></span> <span id=""
											style="visibility: hidden;"><input class="none"
											type="number" placeholder="Qty"></span>
									</div>
								</c:if>
								<c:if test="${ shoes == 'false' && clothing == 'false' }">
									<div class="list-size-add-new-product">
										<span id="1" onclick="size(this)">32<input class="none"
											id="1" name="size32" type="number" placeholder="Qty"></span>
										<span id="2" onclick="size(this)">33<input class="none"
											id="2" name="size33" type="number" placeholder="Qty"></span>
										<span id="3" onclick="size(this)">34<input class="none"
											id="3" name="size34" type="number" placeholder="Qty"></span>
										<span id="4" onclick="size(this)">35<input class="none"
											id="4" name="size35" type="number" placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="5" onclick="size(this)">36<input class="none"
											id="5" name="size36" type="number" placeholder="Qty"></span>
										<span id="6" onclick="size(this)">37<input class="none"
											id="6" name="size37" type="number" placeholder="Qty"></span>
										<span id="7" onclick="size(this)">38<input class="none"
											id="7" name="size38" type="number" placeholder="Qty"></span>
										<span id="8" onclick="size(this)">39<input class="none"
											id="8" name="size39" type="number" placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="9" onclick="size(this)">40<input class="none"
											id="9" name="size40" type="number" placeholder="Qty"></span>
										<span id="10" onclick="size(this)">41<input
											class="none" id="10" name="size41" type="number"
											placeholder="Qty"></span> <span id="11" onclick="size(this)">42<input
											class="none" id="11" name="size42" type="number"
											placeholder="Qty"></span> <span id="12" onclick="size(this)">43<input
											class="none" id="12" name="size43" type="number"
											placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="13" onclick="size(this)">44<input
											class="none" id="13" name="size44" type="number"
											placeholder="Qty"></span> <span id="14" onclick="size(this)">45<input
											class="none" id="14" name="size45" type="number"
											placeholder="Qty"></span> <span id="15" onclick="size(this)">46<input
											class="none" id="15" name="size46" type="number"
											placeholder="Qty"></span> <span id="16" onclick="size(this)">47<input
											class="none" id="16" name="size47" type="number"
											placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="18" onclick="size(this)">XS<input
											class="none" id="18" name="sizeXS" type="number"
											placeholder="Qty"></span> <span id="19" onclick="size(this)">S<input
											class="none" id="19" name="sizeS" type="number"
											placeholder="Qty"></span> <span id="20" onclick="size(this)">M<input
											class="none" id="20" name="sizeM" type="number"
											placeholder="Qty"></span> <span id="21" onclick="size(this)">L<input
											class="none" id="21" name="sizeL" type="number"
											placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="22" onclick="size(this)">XL<input
											class="none" id="22" name="sizeXL" type="number"
											placeholder="Qty"></span> <span id="23" onclick="size(this)">2XL<input
											class="none" id="23" name="size2XL" type="number"
											placeholder="Qty"></span> <span id="24" onclick="size(this)">3XL<input
											class="none" id="24" name="size3XL" type="number"
											placeholder="Qty"></span> <span id=""
											style="visibility: hidden;"><input class="none"
											type="number" placeholder="Qty"></span>
									</div>
								</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="btn-add-new-product">
								<input type="button" value="Add" id="btn-addnewproduct"
									name="btn-addnewproduct">
							</div>
							<c:if test="${ clothing == 'true' }">
								<div class="gotogallery"><a href='/ShopTandT/admin/gallery/add?clothing'>Go to Gallery add</a></div>
							</c:if>
						</td>
					</tr>
				</table>
				</form>
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
		<a href="/ShopTandT/admin/gallery/add?clothing">Go to gallery add</a>
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
	<script src="<c:url value='/assets/js/colorjoe.min.js'/>"></script>

	<c:if test="${ addsuccess != null }">
		<script type="text/javascript">
			var check = "${ addsuccess }";
			if(check =="true") {
				$(".message-notify").removeClass("none");
				$(".content-msg-notify").text("Add success!");
				$('.ok-notify').click(function() {
					$(".message-notify").addClass("none");
				});
			} else {
				$(".message-done").removeClass("none");
				$(".content-msg-done").text("Add unsuccess! Continue add?");
				$('.ok-done').click(function() {
					$(".message-done").addClass("none");
					location.reload();
				});
				$('.cancel').click(function() {
					$(".message").addClass("none");
					window.location.href = "/ShopTandT/admin/product/clothing";
				});
			}
		</script>
	</c:if>

	<c:if test="${ shoes == null }">
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
		   			$('#myform').attr('action', '/ShopTandT/admin/color-size/add-color?shoes');
		   			$("#addcolor").attr('type', 'submit');
		   		}
		   	});
	   </script>
	</c:if>
	<c:if test="${ clothing != null }">
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
		   			$('#myform').attr('action', '/ShopTandT/admin/color-size/add-color?clothing');
		   			$("#addcolor").attr('type', 'submit');
		   		}
		   	});
	   </script>
	</c:if>

	<c:if test="${ shoes == null && shoes == null }">
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
		   			$('#myform').attr('action', '/ShopTandT/admin/color-size/add-color');
		   			$("#addcolor").attr('type', 'submit');
		   		}
		   	});
	   </script>
	</c:if>

	<script>
		$("#btn-addnewproduct").click(
				function() {
					var product = $('#select-product').find(":selected").val();
					var color = $('#select-color').find(":selected").val();
					var arrSize = $('.list-size-add-new-product span input')
							.not('.none');

					var error = "";

					if (product == "") {
						error += "You haven't chosen a product yet!! \n";
					} else if (color == "") {
						error += "You haven't chosen a color yet!! \n";
					} else if (arrSize.length <= 0) {
						error += "You haven't chosen a size yet!! \n";
					}

					if (error == "") {
						$(this).attr('type', 'submit');
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
	<script>
		$('.cancel').click(function() {
			$(".message").addClass("none");
			location.reload();
		});
	</script>

	<script>
	<!-- get string size -->
		function getSize(arr) {
			var txt = "";
			if (arr.length > 0) {
				for (let i = 0; i < arr.length; i++) {
					if (i == (arr.length - 1)) {
						txt += arr[i].id + "_" + arr[i].value;
					} else {
						txt += arr[i].id + "_" + arr[i].value + "/";
					}
				}
			}
			return txt;
		}
	</script>
	<!--  show input to enter quantity when click on size box -->
	<script>
		$(".list-size-add-new-product span").click(function() {
			let checkspan = this.classList;
			if (checkspan == "setcolor") {
				let txt = ".list-size-add-new-product #" + this.id + " input";
				if ($(txt).is(':focus')) {
				} else {
					$(txt).addClass("none");
					$(this).removeClass("setcolor");
				}
			} else {
				let txt = ".list-size-add-new-product #" + this.id + " input";
				$(txt).removeClass("none");
				$(this).addClass("setcolor");
			}
		});
	</script>

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