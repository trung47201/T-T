<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${ user == 'true' }">
	<title>User </title>
</c:if>
<c:if test="${ role == 'true' }">
	<title>Role </title>
</c:if>
<c:if test="${ addnewuser == 'true' }">
	<title>New user </title>
</c:if>


<link rel="stylesheet" href="<c:url value='/assets/css/re-role2.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-customer3.css'/>">
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
img.eye-show-hide, img.eye-show-hide-pw {
	right: 7% !important;
}

.sl-role {
	width: 97.7% !important;
}

.message input {
	width: 157px;
	padding: unset !important;
}
th.td-addnewshoes a {
    display: flex;
    width: 140px !important;
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
		<c:if test="${ user == 'true' }">
			<section class="admin-customer-user">
				<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
		</c:if>

		<c:if test="${ addnewuser == 'true' }">
			<section class="admin-customer-user">
				<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
		</c:if>

		<c:if test="${ user == 'false' && addnewuser == 'false' }">
			<section class="admin-customer-user none">
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
					src="<c:url value="/assets/images/icons/icons8-user-64-title.png"/>"
					alt=""> <a href="">Customer</a>
			</div>

			<div>
				<p>/</p>
				<img
					src="<c:url value="/assets/images/icons/icons8-customer-64.png"/>"
					alt=""> <a href="/ShopTandT/admin/customer">User</a>
			</div>

			<c:if test="${ addnewuser == 'true' }">
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
						alt=""> <a href="">Add new user</a>
				</div>
			</c:if>
		</div>

		<c:if test="${ user == 'true'}">
			<div class="table-order">
		</c:if>
		<c:if test="${ user == 'false'}">
			<div class="table-order importantNone">
		</c:if>
		<table class="order">
			<thead>
				<tr>
					<th colspan="1000" class="td-addnewshoes"><a
						href="/ShopTandT/admin/customer/add-new-user">
							<button class="addnewshoes add-new-user">
								<img
									src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
									alt="icon-plus"> Add New
							</button>
					</a></th>
				</tr>
				<tr>
					<th></th>
					<th>ID</th>
					<th>Fullname</th>
					<th>Email</th>
					<th>Phone number</th>
					<th>Address</th>
					<th>Password</th>
					<th>Role</th>
					<th class="td-action">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="liUser" items="${ listUser }">
					<tr>
						<td class="img-user">
							<div class="td-img-avt">
								<img
									src="<c:url value="/assets/images/users/${ liUser.avatar }"/>"
									alt="">
							</div>
						</td>
						<td>${ liUser.id }</td>
						<td>${ liUser.lastname }${ liUser.firstname }</td>
						<td>${ liUser.email }</td>
						<td>${ liUser.phone_number }</td>
						<td>${ liUser.address }</td>
						<td>${ liUser.password }</td>
						<td>${ liUser.role.role_name }</td>
						<td class="td-action">
							<button class="btn-edit-user">
								<img
									src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
									alt="">
							</button>
							<button class="btn-lock-user padlock" id="${ liUser.id }">
								<c:if test="${ liUser.status == 0 || liUser.status == null }">
									<img class="user-img" id="${ liUser.id }"
										src="<c:url value="/assets/images/icons/icons8-padlock-100.png"/>"
										alt="">
								</c:if>
								<c:if test="${ liUser.status == 1 }">
									<img class="user-img" id="${ liUser.id }"
										src="<c:url value="/assets/images/icons/icons8-lock-100.png"/>"
										alt="">
								</c:if>
							</button>
							<div class="btn-lock-user lock-padlock importantNone">
								<img class="user-img padlock-img"
									src="<c:url value="/assets/images/icons/icons8-padlock-100.png"/>"
									alt=""> <img class="user-img lock-img"
									src="<c:url value="/assets/images/icons/icons8-lock-100.png"/>"
									alt="">
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<!-- ADD NEW USER -->
	<c:if test="${ addnewuser == 'true' }">
		<div class="tbl-add-new">
	</c:if>
	<c:if test="${ addnewuser == 'false' }">
		<div class="tbl-add-new none">
	</c:if>
	<form
		action="/ShopTandT/admin/customer/add-new-user/savefile"
		method="post" enctype="multipart/form-data" id="formadduser">
		<table class="tbl-new-user">
			<tr>
				<td class="choose-img-avt" rowspan="7">
					<div class="input-img">
						<label for="filetag" class="btn-avt">Choose avatar</label> <input
							type="file" id="filetag" name="filetag" class="none">
					</div>
					<div class="img-display">
						<img src="<c:url value="/assets/images/users/avt-default.jpg"/>"
							id="preview">
					</div>
				</td>
				<td>
					<div class="input">
						<p>
							First name<span class="required-span"> *</span>
						</p>
						<input type="text" id="firstname" name="firstname">
					</div>

				</td>
				<td>
					<div class="input">
						<p>
							Last name<span class="required-span"> *</span>
						</p>
						<input type="text" id="lastname" name="lastname">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input">
						<p>
							Email<span class="required-span"> *</span>
						</p>
						<input type="text" id="email" name="email" autocomplete="off">
					</div>
				</td>
				<td>
					<div class="input">
						<p>
							Phone number<span class="required-span"> *</span>
						</p>
						<input type="number" id="phonenumber" name="phonenumber">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<p class="msg-required msg-email none">Exp: tishoes@gmail.com</p>
				</td>
			</tr>
			<tr>

			</tr>
			<tr>
				<td colspan="2">
					<div class="input">
						<p>
							Address<span class="required-span"> *</span>
						</p>
						<input type="text" id="address" name="address">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input">
						<p>
							City<span class="required-span"> *</span>
						</p>
						<!-- city -->
						<select class="sl-role" name="calc_shipping_provinces"
							id="selected-city">
							<option value="" disabled="disabled" selected>Province /
								City</option>
						</select> <input class="billing_address_1" name="" type="hidden"> <input
							type="hidden" id="city" name="city" placeholder="City">
					</div>
				</td>
				<td>
					<div class="input">
						<p>
							District<span class="required-span"> *</span>
						</p>
						<!-- district -->
						<select class="sl-role" name="calc_shipping_district"
							id="selected-district">
							<option value="" disabled="disabled" selected>District</option>
						</select> <input class="billing_address_2" name="" type="hidden"> <input
							type="hidden" id="district" name="district"
							placeholder="District">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input" style="position: relative;">
						<p>
							Password<span class="required-span"> *</span>
						</p>
						<div class="pw-form">
							<input type="password" id="password" name="password"> <img
								class="eye-show-hide"
								src="<c:url value="/assets/images/icons/icons8-hide-60.png"/>"
								alt=""> <img class="eye-show none"
								src="<c:url value="/assets/images/icons/icons8-eye-60.png"/>"
								alt=""> <img class="eye-hide none"
								src="<c:url value="/assets/images/icons/icons8-hide-60.png"/>"
								alt="">
						</div>
					</div>
				</td>
				<td>
					<div class="input">
						<p>
							Role<span class="required-span"> *</span>
						</p>
						<select class="sl-role" id="role" name="role">
							<option value="" disabled="disabled" selected>Choose
								role...</option>
							<c:forEach var="liRole" items="${ listRole }">
								<option value="${ liRole.id }">${ liRole.role_name }-
									${ liRole.id }</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><p class="msg-required msg-pw none">Password
						must contain the following: At least one uppercase letter, one
						lowercase letter, one digit, one special symbol & should be more
						than 8 character.</p></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">
					<div class="btn-add" style="margin-top: 10px;">
						<input type="button" id="btn-addnewuser" name="addnewuser"
							value="ADD NEW USER">
					</div>
				</td>
			</tr>
		</table>
	</form>

	</div>
	<jsp:include page="../layouts/admin/a-footer.jsp"></jsp:include>
	</section>

	<div class="behind-zoom-img importantNone"></div>
	<div class="zoom-img importantNone" id="zoom-img">
		<img id="display-img-onclick" alt="img-onclick"
			src="<c:url value="/assets/images/users/emiuuu.jpg"/>">
	</div>
	<!--
            ROLE
        -->
	<c:if test="${ role == 'true' }">
		<section class="admin-customer-role">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
	</c:if>
	<c:if test="${ role == 'false' }">
		<section class="admin-customer-role none">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
	</c:if>


	<c:if test="${ roleedit == 'false' }">
		<div class="title">
			<img src="<c:url value="/assets/images/icons/icons8-role-66.png"/>"
				alt="img-title">
			<h1>ROLE</h1>
		</div>
	</c:if>
	<c:if test="${ roleedit == 'true' }">
		<div class="title">
			<img
				src="<c:url value="/assets/images/icons/icons8-edit-100-title.png"/>"
				alt="img-title">
			<h1>EDIT</h1>
		</div>
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
				src="<c:url value="/assets/images/icons/icons8-user-64-title.png"/>"
				alt=""> <a href="">Customer</a>
		</div>
		<div>
			<p>/</p>
			<img src="<c:url value="/assets/images/icons/icons8-role-66.png"/>"
				alt=""> <a href="/ShopTandT/admin/role">Role</a>
		</div>
		<c:if test="${ roleedit == 'true' }">
			<div>
				<p>/</p>
				<img
					src="<c:url value="/assets/images/icons/icons8-edit-100-title.png"/>"
					alt=""> <a href="/ShopTandT/admin/role">Edit</a>
			</div>
		</c:if>
	</div>
	<div class="role-form">
		<c:if test="${ roleedit == 'true' }">
			<div class="role-func-form">
				<div class="img-add">
					<input type="text" id="search-role" placeholder="Search...">
				</div>
				<div class="form-input">
					<p>ID</p>
					<input type="text" id="roleid" name="" readonly="readonly"
						value="${ roleEntity.id }">
				</div>
				<div class="form-input">
					<p>Role name</p>
					<input type="text" id="rolename" name=""
						value="${ roleEntity.role_name }">
				</div>
				<div class="form-input">
					<p>Description</p>
					<input type="text" id="description" name=""
						value="${ roleEntity.description }">
				</div>
				<div class="btn-input">
					<input type="button" id="saverole" name="" value="Save">
				</div>
			</div>
		</c:if>
		<c:if test="${ roleedit == 'false' }">
			<div class="role-func-form">
				<div class="form-input input-role">
					<div class="input-role-search">
						<input type="text" id="search-role" placeholder="Search...">
					</div>
					<div class="btn-search-role">
						<img
							src="<c:url value="/assets/images/icons/search48.png"/>"
							alt="">
					</div>
				</div>
				<div class="form-input">
					<p>Role name</p>
					<input type="text" id="rolename" name="">
				</div>
				<div class="form-input">
					<p>Description</p>
					<input type="text" id="description" name="">
				</div>
				<div class="btn-input">
					<input type="button" id="addnewrole" name="" value="Add new">
				</div>
			</div>
		</c:if>
		<div class="table-role">
			<table class="order">
				<thead>
					<tr>
						<th colspan="999">
							<c:if test="${listRole.size() <= 0}">
								<p>No results found for keyword "${ keywords }"</p>
							</c:if>
							<c:if test="${listRole.size() > 0 && keywords != null}">
								<p>Found ${listRole.size()} results with keywords "${ keywords }"</p>
							</c:if>
						</th>
					</tr>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
						<th class="td-action">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="liRole" items="${ listRole }">
						<tr>
							<td>${ liRole.id }</td>
							<td>${ liRole.role_name }</td>
							<td>${ liRole.description }</td>
							<td class="td-action"><a
								href="/ShopTandT/admin/role/edit/${ liRole.id }">
									<button class="btn-edit-user" id="${ liRole.id }">
										<img
											src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
											alt="">
									</button>
							</a> <c:if test="${ roleedit == 'false' }">
									<button class="btn-lock-user btn-remove-role"
										id="${ liRole.id }">
										<img class="user-img"
											src="<c:url value="/assets/images/icons/icons8-remove-60.png"/>"
											alt="">
									</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="../layouts/admin/a-footer.jsp"></jsp:include>
	</section>
	<!-- REVENUE -->

	</div>

	<div class="message message-detete msg-order none">
		<h2>Message</h2>
		<p class="content-msg content-msg-delete"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" type="button" value="Cancel"> <input
				class="ok hover-btn" type="button" value="OK">
		</div>
	</div>

	<div class="message message-block msg-order none">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-block"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" type="button" value="Cancel"> <input
				class="ok hover-btn" type="button" value="OK">
		</div>
	</div>

	<div class="message message-notify msg-order none">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg-notify"></p>
		<div class="btn-ok-cancel">
			<input class="ok ok-block hover-btn" type="button" value="OK">
		</div>
	</div>

	<div class="message continue-add msg-order none">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg-add"></p>
		<div class="btn-ok-cancel">
			<input class="cancel continue" id="continue" type="button"
				value="Continue"> <input class="ok hover-btn" type="button"
				value="OK">
		</div>
	</div>
	
	<div class="message continue-add msg-order none" id="addcustomer1">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg-add"></p>
		<div class="btn-ok-cancel">
			<input class="cancel continue back1" type="button"
				value="Cancel"> <input class="ok hover-btn" type="button"
				value="Continue Add">
		</div>
	</div>
	
	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script>
	// if users click img search
	$(".btn-search-role").click(function() {
		var txt = $("#search-role").val();
		var error="";
		if(txt == "") {
			error += "You have not entered search information!";
		}
		if(error != "") {
			$(".message-notify").removeClass("none");
			$(".content-msg-notify").text(error);
			$(".content-msg-notify").html($(".content-msg-notify").html().replace(/\n/g,'<br/>'));
			$('.ok').click(function() {
				$(".message-notify").addClass("none");
			});
		} else {
			var url = window.location.href;
			if(url.includes("/edit/")) {
				url = "http://localhost:8888/ShopTandT/admin/role";
			} else if(url.includes("?search_role")) {
				url = "http://localhost:8888/ShopTandT/admin/role";
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET", url+"?search_role="+txt);
			// What to do when server responds
			xhr.onload = function() {
				window.location.assign(url+"?search_role="+txt);
			};
			xhr.send();
		}
	});
	
	// if users press enter
	$('#search-role').on('keypress', function (e) {
        if(e.which === 13){
        	var txt = $("#search-role").val();
    		var error="";
    		if(txt == "") {
    			error += "You have not entered search information!";
    		}
    		if(error != "") {
    			$(".message-notify").removeClass("none");
    			$(".content-msg-notify").text(error);
    			$(".content-msg-notify").html($(".content-msg-notify").html().replace(/\n/g,'<br/>'));
    			$('.ok').click(function() {
    				$(".message-notify").addClass("none");
    			});
    		} else {
    			var url = window.location.href;
    			if(url.includes("/edit/")) {
    				url = "http://localhost:8888/ShopTandT/admin/role";
    			} else if(url.includes("?search_role")) {
    				url = "http://localhost:8888/ShopTandT/admin/role";
    			}
    			var xhr = new XMLHttpRequest();
    			xhr.open("GET", url+"?search_role="+txt);
    			// What to do when server responds
    			xhr.onload = function() {
    				window.location.assign(url+"?search_role="+txt);
    			};
    			xhr.send();
    		}
        }
 	});
	</script>

	<script>
	function exists_role_id_in_tblUser(role_id) { //check exists role id
		var arr = [];
		<c:forEach items="${listRoleId}" var="id">
		       arr.push("${id}");
		</c:forEach>
		if(arr.includes(role_id)) {
			return true;
		} else {
			return false;
		}
	}
	
	function exists(rolename) { //check exists role name
		var arr = [];
		<c:forEach items="${listRoleName}" var="id">
		       arr.push("${id}");
		</c:forEach>
		if(arr.includes(rolename)) {
			return true;
		} else {
			return false;
		}
	}
	
	function exists_when_update(rolename) { //check exists when update role
		var roleUrl = "${ roleEntity.role_name }";
		if(roleUrl != rolename) {
			var arr = [];
			<c:forEach items="${listRoleName}" var="id">
			       arr.push("${id}");
			</c:forEach>
			if(arr.includes(rolename)) {
				return true;
			}
		}
		return false;
	}
	</script>

	<script>
	//Add new role
	$('#addnewrole').click(function() {
		var url = window.location.href;
		var xhr = new XMLHttpRequest();
		var rolename = $('#rolename').val().trim();
		var des = $('#description').val().trim();
		var error="";
		
		if(rolename == "") {
			error += "Role name is empty!";
		}
		
		if(error != "") {
			$(".message-notify").removeClass("none");
			$(".content-msg-notify").text(error);
			$(".content-msg-notify").html($(".content-msg-notify").html().replace(/\n/g,'<br/>'));
			$('.ok').click(function() {
				$(".message-notify").addClass("none");
			});
		} else {
				if(exists(rolename)) {
					$(".message-notify").removeClass("none");
					$(".content-msg-notify").text("Role name already exists!");
					$('.ok').click(function() {
						$(".message-notify").addClass("none");
					});
				} else {
					xhr.open("GET", url+"?rolename="+rolename+"&description="+des);
					// What to do when server responds
					xhr.onload = function() {
						$(".message-notify").removeClass("none");
						$(".content-msg-notify").text("Add role successfully!");
						$('.ok').click(function() {
							$(".message-notify").addClass("none");
							window.location.assign(url);
						});
					};
					xhr.send();
				}
			
		}
		
		});
	</script>

	<script>
		//Save role
		$('#saverole').click(function() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			var rolename = $('#rolename').val().trim();
			var des = $('#description').val().trim();
			var error="";
			
			if(rolename == "") {
				error += "Role name is empty!";
			}
			
			if(error != "") {
				$(".message-notify").removeClass("none");
				$(".content-msg-notify").text(error);
				$(".content-msg-notify").html($(".content-msg-notify").html().replace(/\n/g,'<br/>'));
				$('.ok').click(function() {
					$(".message-notify").addClass("none");
				});
			} else {
				
					if(exists_when_update(rolename)) {
						$(".message-notify").removeClass("none");
						$(".content-msg-notify").text("Role name already exists!");
						$('.ok').click(function() {
							$(".message-notify").addClass("none");
						});
					} else {
						xhr.open("GET", url+"/?rolename="+rolename+"&description="+des);
						// What to do when server responds
						xhr.onload = function() {
							$(".message-notify").removeClass("none");
							$(".content-msg-notify").text("Updated role successfully!");
							$('.ok').click(function() {
								$(".message-notify").addClass("none");
								window.location.assign("/ShopTandT/admin/role");
							});
						};
						xhr.send();
					}
			}
		});
	</script>

	<script>
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
	const validateEmail = (email) => {
		  return email.match(
		    /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
		  );
		};
	function validatePassword(pw) {

		    return /[A-Z]/       .test(pw) &&
		           /[a-z]/       .test(pw) &&
		           /[0-9]/       .test(pw) &&
		           /[^A-Za-z0-9]/.test(pw) &&
		           pw.length > 7;

		}
	$('#password').focusin(function() {
		var password = $('#password').val();
		if(validatePassword(password)) {
			$('.msg-pw').addClass("none");
		} else {
			$('.msg-pw').removeClass("none");
		}
	});
	$('#password').focusout(function() {
		var password = $('#password').val();
		if(validatePassword(password)) {
			$('.msg-pw').addClass("none");
		} else {
			$('.msg-pw').addClass("none");
		}
		
	});
	$('#email').focusin(function() {
		$('.msg-email').removeClass("none");
	});
	$('#email').focusout(function() {
		$('.msg-email').addClass("none");
	});
	
	// Add new user
	$('#btn-addnewuser').click(function() {
		var url = window.location.href;
		var xhr = new XMLHttpRequest();
		var firstname = $('#firstname').val();
		var lastname = $('#lastname').val();
		var email = $('#email').val();
		var phonenumber = $('#phonenumber').val();
		var address = $('#address').val();
		var city = $('#city').val();
		var district = $('#district').val();
		var password = $('#password').val();
		var role = $('#role').val();
		var mailformat = "/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/";
		var avatar = $('#filetag').val();
		var error="";
		
		if(firstname == "") {
			error += "First name is empty! \n";
		} else if(lastname == "") {
			error += "Last name is empty! \n";
		} else if(email == "") {
			error += "Email address is empty! \n";
		} else if(!validateEmail(email)) {
			error += "You have entered an invalid email address! \n";
		} else if(phonenumber == "") {
			error += "Phone number name is empty! \n";
		} else if(address == "") {
			error += "Address name is empty! \n";
		} else if(city == "") {
			error += "City is empty! \n";
		} else if(district == "") {
			error += "District name is empty! \n";
		} else if(password == "") {
			error += "Password name is empty! \n";
		} else if(!validatePassword(password)) {
			error += "Invalid password! \n";
		} else 
		if(role == null) {
			error += "You haven't chosen a role yet! \n";
		}
		
		if(error != "") {
			$(".message-notify").removeClass("none");
			$(".content-msg-notify").text(error);
			$(".content-msg-notify").html($(".content-msg-notify").html().replace(/\n/g,'<br/>'));
			$('.ok').click(function() {
				$(".message-notify").addClass("none");
			});
		} else {
			$("#addcustomer1").removeClass("none");
			$("#addcustomer1 .content-msg-add").text("Add customer successfully!");
			$('#addcustomer1 .ok').click(function() {
				$('#formadduser').submit();
			});
			$('#addcustomer1 .back1').click(function(){
				$('#formadduser').attr('action', '/ShopTandT/admin/customer/add-new-user/savefile?redirect');
				$('#formadduser').submit();
			});
		}
 	});
	</script>
	<!-- SHOW HIDE PASSWORD -->
	<script>
		$(".eye-show-hide").click(function() {
			var sh = this;
			var get = this.src;
			var hide = $(".eye-hide")[0].src;
			var show = $(".eye-show")[0].src;
			if(get.includes("hide")) {
				$(sh).attr("src", show);
				$("#password").attr("type", "text");
			} else {
				$(sh).attr("src", hide);
				$("#password").attr("type", "password");
			}
		});
	</script>

	<script>
		$(".btn-remove-role").click(function () {
			var xhr = new XMLHttpRequest();
			var url = window.location.href;
			var role_id = this.id;
			$(".message-detete").removeClass("none");
			$(".content-msg").text(
					"Are you sure you want to delete this order?");
			$('.ok').click(function() {
				$(".message-detete").addClass("none");
				setTimeout(function() {
					$(".msg-done").removeClass("importantNone");

				}, 500);
				setTimeout(function() {
					$(".msg-done").addClass("importantNone");

				}, 3000);
					if(exists_role_id_in_tblUser(role_id)) {
						$(".message-notify").removeClass("none");
						$(".content-msg-notify").text("This role cannot be deleted because it is already in use!");
						$('.ok').click(function() {
							$(".message-notify").addClass("none");
						});
					} else {
						xhr.open("GET", url+"?delete="+role_id);
						// What to do when server responds
						xhr.onload = function() {
							$(".message-notify").removeClass("none");
							$(".content-msg-notify").text("Successfully role deleted!");
							$('.ok').click(function() {
								$(".message-notify").addClass("none");
								window.location.assign(url);
							});
						};
						xhr.send();
					}
			});
		});
	</script>

	<script>
		$('.cancel').click(function() {
			$(".message").addClass("none");
			location.reload();
		});
		$('.ok').click(function() {
			$(".message").addClass("none");
		});
	</script>
	<script>
		$('.btn-confirm-order').click(
				function() {
					$(".message").removeClass("none");
					$(".content-msg").text(
							"Are you sure you want to browse this order?");
					var id_prod = this.id;
					$('.ok').click(function() {
						$(".message").addClass("none");
						setTimeout(function() {
							$(".msg-done").removeClass("importantNone");

						}, 500);
						setTimeout(function() {
							$(".msg-done").addClass("importantNone");

						}, 3000);
						$('.ok').removeData('clicked', true);
						alert(id_prod);
						location.reload();
					});
				});
		$('.cancel').click(function() {
			$(".message").addClass("none");
		});
	</script>
	<script>
		$('.cancel').hover(function() {
			$(".ok").removeClass("hover-btn");
			$(".ok").removeClass("font-size-btn-msg");
			$(".cancel").addClass("hover-btn");
			$(".cancel").addClass("font-size-btn-msg");
		});
		$('.ok').hover(function() {
			$(".cancel").removeClass("hover-btn");
			$(".cancel").removeClass("font-size-btn-msg");
			$(".ok").addClass("hover-btn");
			$(".ok").addClass("font-size-btn-msg");
		});
	</script>
	<!-- ADD NEW ONCLICK-->
	<script>
		$('#addneworder').click(function() {
			$(".addneworder-nav").removeClass("importantNone");
			$(".table-order-add").addClass("importantNone");
			$(".title-add-new").removeClass("importantNone");
			$(".title-order-management").addClass("importantNone");
			$(".add-new-order-form").removeClass("importantNone");

		});
		$('#editneworder').click(function() {
			$(".editneworder-nav").removeClass("importantNone");
			$(".table-order-add").addClass("importantNone");
			$(".title-edit-new").removeClass("importantNone");
			$(".title-order-management").addClass("importantNone");
			$(".edit-new-order-form").removeClass("importantNone");

		});
	</script>

	<script>
	<!--  BLOCK-UNLOCK user -->
		$('.padlock img').click(function() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			var user_id= this.id;
			var img = this;
			var get = this.src;
			var lock = $('.lock-img')[0].src;
			var padlock = $('.padlock-img')[0].src;
			if(get.includes("padlock")) {
				$(".message-block").removeClass("none");
				$(".content-msg-block").text(
						"Are you sure you want to block this customer?");
				$('.ok').click(function() {
					$(".message-block").addClass("none");
					setTimeout(function() {
						$(".msg-done").removeClass("importantNone");
					}, 500);
					$(img).attr("src", lock);
					setTimeout(function() {
						$(".msg-done").addClass("importantNone");
					}, 3000);
					$(".message-notify").removeClass("none");
					$(".content-msg-notify").text("Successfully blocked!"); // display notify success blocked
					$('.ok-block').click(function() {
						$(".message-notify").addClass("none");
						var urlCurrent = url + "?block="+ user_id;
						xhr.open("GET", urlCurrent);
						// What to do when server responds
						xhr.onload = function() {
							window.location.assign(url);
						};
						xhr.send();
					});
					
				});
			} else {
				$(".message-block").removeClass("none");
				$(".content-msg-block").text(
						"Are you sure you want to unblock this customer?");
				$('.ok').click(function() {
					
					$(".message-block").addClass("none");
					setTimeout(function() {
						$(".msg-done").removeClass("importantNone");
					}, 500);
					$(img).attr("src", padlock);
					setTimeout(function() {
						$(".msg-done").addClass("importantNone");
					}, 3000);
					$(".message-notify").removeClass("none");
					$(".content-msg-notify").text("Successfully unblocked!"); // display notify success unblocked
					$('.ok-block').click(function() {
						$(".message-notify").addClass("none");
						var urlCurrent = url + "?unblock="+ user_id;
						xhr.open("GET", urlCurrent);
						// What to do when server responds
						xhr.onload = function() {
							window.location.assign(url);
						};
						xhr.send();
					});
				});
			}
		}) 
		
	</script>
	<script>
  
  </script>

	<script>
<!-- choose image and display -->
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
	<script type="text/javascript"> // address infor
		$("select option[value='District']").attr('disabled', true);
		$("#selected-city").change(function() {
			 var city = $(this).find('option:selected').text();
			 $("#city").val(city);
		});
		$("#selected-district").change(function() {
			 var district = $(this).find('option:selected').text();
			 $("#district").val(district);
		});
	</script>
	<script
		src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
	<script src="<c:url value="/assets/js/re-select-address.js" />"></script>
	<script type="text/javascript">
	if (address_1 = localStorage.getItem('address_1_saved')) {
		$("#city").val(address_1);
	}
	if (address_2 = localStorage.getItem('address_2_saved')) {
		$("#district").val(address_2);
	}
	</script>
</body>

</html>