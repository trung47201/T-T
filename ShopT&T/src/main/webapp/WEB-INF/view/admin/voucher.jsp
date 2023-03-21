<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value ="/assets/css/voucher.css"/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-login.css'/>">

<c:if test="${ voucher == 'true' }">
	<title>Voucher :)</title>
</c:if>
<c:if test="${ editvoucher == 'true' }">
	<title>Edit voucher :)</title>
</c:if>
<style>
.widthDes {
	width: 98% !important;
}
#save {
padding: 10px 10px 10px 5px !important;
}
</style>

<body>
	<jsp:include page="../layouts/admin/login.jsp"></jsp:include>
	<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>
		<!-- ORDER MANAGEMENT -->

		<c:if test="${ voucher == 'true' }">
			<section class="admin-order-management">
				<div class="title title-order-management">
					<img
						src="<c:url value="/assets/images/icons/icons8-voucher-96.png"/>"
						alt="">
					<h1>VOUCHER</h1>
				</div>
		</c:if>
		<c:if test="${ editvoucher == 'true' }">
			<section class="admin-order-management">
				<div class="title title-order-management">
					<img
						src="<c:url value="/assets/images/icons/icons8-edit-100-title.png"/>"
						alt="">
					<h1>EDIT VOUCHER</h1>
				</div>
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
					src="<c:url value="/assets/images/icons/icons8-purchase-order-100-nav.png"/>"
					alt=""> <a href="">Order</a>
			</div>

			<div>
				<p>/</p>
				<img class="voucher-img"
					src="<c:url value="/assets/images/icons/icons8-voucher-96.png"/>"
					alt=""> <a href="/SpringMVC/admin/voucher">Voucher</a>
			</div>
			<c:if test="${ editvoucher == 'true' }">
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-edit-100-title.png"/>"
						alt=""> <a href="/SpringMVC/admin/voucher">Edit voucher</a>
				</div>
			</c:if>

		</div>

		<div class="table-order table-edit-vc table-order-add">
			<table class="order">
				<thead>
					<tr class="tr-search-voucher" id="tr-search-voucher">
						<th colspan="1000" class="td-addneworder">
							<div class="search-role">
								<div class="search-role-img">
									<img
										src="<c:url value="/assets/images/icons/icons8-search-50-blue.png"/>"
										alt="icon-search">
								</div>
								<div class="search-role-input">
									<input type="text" id="search-voucher" placeholder="Search..."
										value="${ keyword }">
								</div>
							</div>
						</th>
					</tr>
					<tr>
						<th>ID</th>
						<th>Code</th>
						<th>Discount</th>
						<th>Limit</th>
						<th>Apply for</th>
						<th>Start date</th>
						<th>End date</th>
						<th>Created at</th>
						<th>Updated at</th>
						<th>Description</th>
						<th class="td-action">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="liVoucher" items="${ listVoucher }"
						varStatus="index">
						<tr>
							<td>${ liVoucher.id }</td>
							<td>${ liVoucher.code }</td>
							<td>${ liVoucher.vcdiscount }</td>
							<td>${ liVoucher.limit }</td>
							<td>${ liVoucher.applyfor }</td>
							<td class="td-date">${ liVoucher.start_date }</td>
							<td class="td-date">${ liVoucher.end_date }</td>
							<td class="td-date">${ liVoucher.created_at }</td>
							<td class="td-date">${ liVoucher.updated_at }</td>
							<td>${ liVoucher.description }</td>
							<td class="td-action">
								<form
									action="/SpringMVC/admin/voucher/edit-voucher/${liVoucher.id }"
									method="post">
									<button type="submit" class="btn-edit-product editneworder"
										id="editvoucher" name="editvoucher">
										<img
											src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
											alt="">
									</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<c:if test="${  editvoucher == 'false' }">
			<form action="/SpringMVC/admin/voucher" method="post">
				<div class="add-new-order-form">
					<div class="customer-infor">
						<div class="customer-infor-form">
							<div class="fullname">
								<p>Code</p>
								<input type="text" id="code" name="code">
							</div>
							<div class="fullname">
								<p>Apply for</p>
								<input type="number" id="applyfor" name="applyfor">
							</div>
						</div>
						<div class="customer-infor-form">
							<div class="fullname">
								<p>Start date</p>
								<input type="datetime-local" id="start-date" name="start-date"
									value="">
							</div>
							<div class="fullname">
								<p>End date</p>
								<input type="datetime-local" id="end-date" name="end-date">
							</div>
						</div>
						<div class="customer-infor-form">
							<div class="fullname">
								<p>Discount</p>
								<input type="number" min="0" id="discount" name="discount">
							</div>
							<div class="fullname">
								<p>Limit</p>
								<input class="none" type="number" min="0" id="limit-input"
									name="limit-input" placeholder="Enter the limit you want...">
								<select id="limit-select" name="limit" onchange="toInput(this)">
									<option value="" selected="selected" disabled="disabled">Chosen
										a limit</option>
									<option value="1">1</option>
									<option value="10">10</option>
									<option value="50">50</option>
									<option value="100">100</option>
									<option value="200">200</option>
									<option value="500">500</option>
									<option value="1000">1000</option>
									<option value="10000">10000</option>
									<option value="other">Other</option>
								</select>
							</div>
						</div>
						<div class="customer-infor-form">
							<div class="fullname">
								<p>Description</p>
								<input class="widthDes" type="text" id="description"
									name="description">
							</div>
						</div>
					</div>
					<div class="btn-add-new-vc">
						<button class="addneworder" id="addnewvoucher"
							name="addnewvoucher" type="button">
							<img
								src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
								alt="icon-plus"> Add New
						</button>
					</div>
				</div>
			</form>
		</c:if>

		<c:if test="${ editvoucher == 'true' }">
			<form action="/SpringMVC/admin/voucher/edit-voucher/${ vch.id }"
				method="post">
				<div class="add-new-order-form">
					<div class="customer-infor">
						<div class="customer-infor-form">
							<div class="fullname">
								<p>ID</p>
								<input type="text" id="id" name="id" readonly
									value="${ vch.id }">
							</div>
							<div class="fullname">
								<p>Apply for</p>
								<input type="text" id="applyfor" name="applyfor"
									value="${ vch.applyfor }">
							</div>
						</div>
						<div class="customer-infor-form">
							<div class="fullname">
								<p>Start date</p>
								<input type="datetime-local" id="start-date" name="start-date"
									value="${ start_date }">
							</div>
							<div class="fullname">
								<p>End date</p>
								<input type="datetime-local" id="end-date" name="end-date"
									value="${ end_date }">
							</div>
						</div>
						<div class="customer-infor-form">
							<div class="fullname">
								<p>Discount</p>
								<input type="number" min="0" id="discount" name="discount"
									value="${ vch.vcdiscount }">
							</div>
							<div class="fullname">
								<p>Limit</p>
								<input type="number" min="0" id="limit-input" name="limit-input"
									placeholder="Enter the limit you want..."
									value="${ vch.limit }">
							</div>
						</div>
						<div class="customer-infor-form">
							<div class="fullname">
								<p>Code</p>
								<input class="readonly-bg" type="text" id="code" name="code"
									readonly value="${ vch.code }">
							</div>
							<div class="fullname">
								<p>Description</p>
								<input type="text" id="description" name="description"
									value="${ vch.description }">
							</div>
						</div>
					</div>
					<div>
						<button class="addneworder" id="save" name="save" type="button">
							<img
								src="<c:url value="/assets/images/icons/icons8-save-100.png"/>"
								alt="icon-plus"> Save
						</button>
					</div>
				</div>
			</form>
		</c:if>

		</section>




		<div class="message msg-order none">
			<h2 class="msg-h2">
				Message <img alt=""
					src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
			</h2>
			<p class="content-msg"></p>
			<div class="btn-ok-cancel">
				<input class="cancel" type="button" value="Cancel"> <input
					class="ok hover-btn" type="button" value="OK">
			</div>
		</div>

		<!-- <div class="not-click none" id="not-click"></div> -->


		<div class="message none" id="msg-notify">
			<h2 class="msg-h2">
				Message <img alt=""
					src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
			</h2>
			<p class="content-msg" id="content-notify"></p>
			<div class="btn-ok-cancel">
				<input class="ok hover-btn" id="ok-notify" type="button" value="OK">
			</div>
		</div>

		<div class="msg-done importantNone">Done!</div>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		<script>
		if(${ editVoucher == 'false'}) {
			$("#msg-notify").removeClass("none");
			$("#content-notify").text("Edit failed!");
		} else if(${ editVoucher == 'true'}) {
			$("#msg-notify").removeClass("none");
			$("#content-notify").text("Successfully!");
		}
	</script>

		<script>
		if(${ addVoucher == 'false'}) {
			$("#msg-notify").removeClass("none");
			$("#content-notify").text("Add failed, Code already exists!");
		} else if(${ addVoucher == 'true'}) {
			$("#msg-notify").removeClass("none");
			$("#content-notify").text("Successfully!");
		}
	</script>

		<script> // check null when edit voucher
		$("#save").click(function() {
			var code = $("#code").val();
			var description = $("#description").val();
			var start_date = $("#start-date").val();
			var end_date = $("#end-date").val();
			var discount = $("#discount").val();
			var limit_input = $("#limit-input").val();
			var apply_for = $("#applyfor").val();
			var error = "";
			
			
			if(code == "") {
				error += "Code is empty! \n";
			} 
			if(apply_for == "") {
				error += "Apply for is empty! \n";
			}
			if(start_date == "") {
				error += "You haven't chosen a start date yet! \n";
			}  
			if(end_date == "") {
				error += "You haven't chosen a end date yet! \n";
			} else if(start_date >= end_date) {
				error += "Start date must be less than end date! \n";
			}
			if(discount == "") {
				error += "Discount is empty! \n";
			} 
			if(discount <= 0 || discount > 100) {
				error += "Discount must be less than 100 or greater than 0! \n";
			}
			if(limit_input == "") {
				error += "Limit is empty! \n";
			}
			if(description == "") {
				error += "Description is empty! \n";
			} 
			
			if(error != "") {
				$("#msg-notify").removeClass("none");
				$("#content-notify").text(error);
				$("#content-notify").html($("#content-notify").html().replace(/\n/g,'<br/>'));
			} else {
				$("#save").attr("type", "submit");
			}
		});
		$("#ok-notify").click(function() {
			$("#msg-notify").addClass("none");
		});
	</script>

		<script> // check null when add voucher
		$("#addnewvoucher").click(function() {
			var code = $("#code").val();
			var description = $("#description").val();
			var start_date = $("#start-date").val();
			var end_date = $("#end-date").val();
			var discount = $("#discount").val();
			var limit = $("#limit-select").val();
			var limit_input = $("#limit-input").val();
			var apply_for = $("#applyfor").val();
			var error = "";
			
			
			if(code == "") {
				error += "Code is empty! \n";
			} 
			if(apply_for == "") {
				error += "Apply for is empty! \n";
			}
			if(start_date == "") {
				error += "You haven't chosen a start date yet! \n";
			}  
			if(end_date == "") {
				error += "You haven't chosen a end date yet! \n";
			} else if(start_date >= end_date) {
				error += "Start date must be less than end date! \n";
			}
			if(discount == "") {
				error += "Discount is empty! \n";
			} 
			if(limit == "" || limit == null) {
				error += "Limit is empty! \n";
			}
			if(limit == "other") {
				if(limit_input == "") {
					error += "Limit is empty! \n";
				}
			}
			if(limit != "other" && limit != null) {
				document.getElementById("limit-input").value = limit;
			}
			if(description == "") {
				error += "Description is empty! \n";
			} 
			
			if(error != "") {
				$("#msg-notify").removeClass("none");
				$("#content-notify").text(error);
				$("#content-notify").html($("#content-notify").html().replace(/\n/g,'<br/>'));
			} else {
				$("#addnewvoucher").attr("type", "submit");
			}
		});
		$("#ok-notify").click(function() {
			$("#msg-notify").addClass("none");
		});
	</script>
		<script>
		function toInput(x) {
			var v = x.value;
			if(v == "other") {
				$("#limit-select").addClass("none");
				$("#limit-input").removeClass("none");
			}
		}
	</script>

		<script>
	var m = new Date();
	var dateCurrent =
	    m.getUTCFullYear() + "-" +
	    ("0" + (m.getUTCMonth()+1)).slice(-2) + "-" +
	    ("0" + m.getUTCDate()).slice(-2) + "T" +
	    ("0" + m.getHours()).slice(-2) + ":" +
	    ("0" + m.getMinutes()).slice(-2);
	    
		document.getElementById("start-date").min = dateCurrent;
		document.getElementById("start-date").max = (m.getFullYear()+1)+"-01-01T00:00";
	    
		document.getElementById("end-date").min = dateCurrent;
		document.getElementById("end-date").max = (m.getFullYear()+1)+"-01-01T00:00";
	</script>

		<script>
		if(${notFound == 'true'}) {
			$("#msg-notify").removeClass("none");
			$("#content-notify").text("Not results were found!");
		}
		$("#ok-notify").click(function() {
			$("#msg-notify").addClass("none");
		}); 
	</script>

		<script>
		$(".search-role-img").click(function() {
			var search = $("#search-voucher").val();
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "http://localhost:8888/SpringMVC/admin/voucher" + "?search=" + search);
			xhr.onload = function() {
				window.location.assign("http://localhost:8888/SpringMVC/admin/voucher" + "?search=" + search);
			};
			xhr.send();
		});
		$('#search-voucher').keyup(function(e) {
			if (e.keyCode == 13) {
				var search = $("#search-voucher").val();
				var url = window.location.href;
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "http://localhost:8888/SpringMVC/admin/voucher" + "?search=" + search);
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/admin/voucher" + "?search=" + search);
				};
				xhr.send();
			}
		});
	</script>


		<script>
		//important not delate (click hide/show navigation)
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
</body>

</html>