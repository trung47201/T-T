<!DOCTYPE html>
<html lang="en">
<title>Personal Details</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet"
	href='<c:url value="/assets/css/login-icon.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/re-profile.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/re-message.css"/>'>
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-favorite.css"/>">
<jsp:include page="../layouts/user/re-favorite.jsp"></jsp:include>
<style>
.ok-btn button {
	border: 1px solid;
	background: #0086ff;
	color: white;
	font-size: 20px;
	box-shadow: 0 0 5px #666;
}

.wrapper-all {
	z-index: 100;
}

div#box-add-intro {
	height: 270px !important;
}

.box-add-intro {
	z-index: 101;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.welcome {
	box-shadow: 0px 5px 15px;
}

.form-ip input {
	width: 270px;
	height: 36px;
	font-size: 16px;
	border: 1px solid #cb82a9;
	padding: 0 10px;
}

.box-content {
	margin-top: 15px;
}

.form-ip {
	margin-top: 10px;
}

.form-ip p {
	margin: 0;
	margin-bottom: 3px;
}

.box-content textarea {
	margin-bottom: -6px !important;
}

div#box-change-pw {
	height: 370px !important;
}

div#box-change-contact {
	height: 432px !important;
}

div#box-change-address {
	height: 432px !important;
}

button#save-pw, button#save-contact, button#save-address {
	width: 100px;
}

.error-change {
	margin-top: 7px;
	font-size: 14px;
	color: red;
	height: 24px;
	margin-bottom: 10px;
}

div#box-msg {
	height: 145px;
	width: 370px;
}
</style>
<body style="color: black;">
	<jsp:include page="../layouts/user/re-menu.jsp"></jsp:include>

	<div class="back-header">
		<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
	</div>

	<div class="img-header">
		<img alt=""
			src="<c:url value="/assets/images/poster/storepic2_1200x.webp"/>">
	</div>

	<div class="text">
		<p class="cool">
			<span data-text="Profile" style="color: white;">Profile</span>
		</p>
	</div>
	<header class="container-xl header-content">
		<form method="post" id="myform">
			<!--########################################3   START page CONTACT ###########################################-->
			<div class="content-account">
				<div class="content-left">
					<div class="content-left-top">
						<div class="title">Profile</div>
						<div class="settings">
							<button type="button" class="" id="settings">Settings</button>
							<div class="menu-user none" id="profile-menu">
								<ul>
									<li><a class="p-menu" id="add-intro">Add intro</a></li>
									<li><a class="p-menu" id="change-pw">Change password</a></li>
									<li><a class="p-menu" id="update-profile-picture">Update
											profile picture</a></li>
									<li><a class="p-menu" id="infor">Information</a>
										<ul class="sub-menu none">
											<li><a id="change-contact">Contact</a></li>
											<li><a id="change-address">Address</a></li>
										</ul></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="content-left-body">
						<div class="line">
							CONTACT INFORMATION
							<div class="user-info">
								<div class="user-row">
									<div class="user-col">
										<p>First name</p>
										<input type="text" id="" name="" readonly
											value="${ user.firstname }">
									</div>
									<div class="user-col">
										<p>Last name</p>
										<input type="text" id="" name="" readonly
											value="${ user.lastname }">
									</div>
								</div>
								<div class="user-row">
									<div class="user-col">
										<p>Phone number</p>
										<input type="number" id="" name="" readonly
											value="${ user.phone_number }">
									</div>
									<div class="user-col">
										<p>Email</p>
										<input type="text" id="" name="" readonly
											value="${ user.email }">
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div class="line">
							USER INFORMATION
							<div class="user-info">
								<div class="user-row">
									<div class="user-col user-col2">
										<p>Address</p>
										<input type="text" id="" name="" readonly
											value="${ user.address }">
									</div>
								</div>
								<div class="user-row">
									<div class="user-col user-col1">
										<p>City</p>
										<input type="text" id="" name="" readonly
											value="${ user.city }">
									</div>
									<div class="user-col user-col1">
										<p>District</p>
										<input type="text" id="" name="" readonly
											value="${ user.district }">
									</div>
									<div class="user-col user-col1">
										<p>Postal code</p>
										<input type="number" id="" name="" readonly value="800000">
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div class="line">
							INTRODUCE
							<div class="user-info">
								<div class="user-row">
									<div class="user-col user-col2">
										<p>About me</p>
										<textarea readonly></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content-right">
					<div class="line">
						<div class="avatar">
							<c:if test="${ userID != null }">
								<img
									src="<c:url value="/assets/images/users/${ user.avatar }"/>"
									alt="">
							</c:if>
							<c:if test="${ userID == null }">
								<img src="<c:url value="/assets/images/users/avt-default.jpg"/>"
									alt="">
							</c:if>
						</div>
					</div>
					<div class="line flex center statistics">
						<div class="action">
							<div class="parameter">30</div>
							<div class="attribute">Friends</div>
						</div>
						<div class="action">
							<div class="parameter">46</div>
							<div class="attribute">Orders</div>
						</div>
						<div class="action">
							<div class="parameter">88</div>
							<div class="attribute">Favorite</div>
						</div>
					</div>
					<div class="line">
						<div class="myname">
							${ user.firstname } <img
								src="<c:url value="/assets/images/icons/icons8-edit-64.png"/>"
								alt="">
						</div>
						<div class="story">Hin</div>
						<div class="educate">Hanoi University of Industry</div>
					</div>
					<hr>
					<div class="line">
						<div class="introduce">Ryan — the name taken by
							Melbourne-raised, Brooklyn-based Nick Murphy — writes, performs
							and records all of his own music.</div>
						<div class="show-more">Show more</div>
					</div>
				</div>
			</div>

			<div class="box-add-intro none" id="box-add-intro">
				<img class="close-box" alt=""
					src="<c:url value="/assets/images/icons/icons8-close-67.png"/>">
				<div class="box-title">Introduce</div>
				<div class="box-content">
					<textarea rows="" cols=""></textarea>
				</div>
				<p class="error-change" id="error-intro"></p>
				<div class="box-btn">
					<button type="button" id="save-add-intro">Save</button>
				</div>
			</div>
			<div class="box-add-intro none" id="box-change-pw">
				<img class="close-box" alt=""
					src="<c:url value="/assets/images/icons/icons8-close-67.png"/>">
				<div class="box-title">Change password</div>
				<div class="box-content">
					<div class="form-ip">
						<p>Old password</p>
						<input type="password" id="oldpw" name="oldpw">
					</div>
					<div class="form-ip">
						<p>New password</p>
						<input type="password" id="newpw" name="newpw">
					</div>
					<div class="form-ip">
						<p>Confirm password</p>
						<input type="password" id="cfpw" name="cfpw">
					</div>
				</div>
				<p class="error-change" id="error-pw"></p>
				<div class="box-btn">
					<button type="button" id="save-pw">Save</button>
				</div>
			</div>

			<div class="box-add-intro none" id="box-change-contact">
				<img class="close-box" alt=""
					src="<c:url value="/assets/images/icons/icons8-close-67.png"/>">
				<div class="box-title">Change contact</div>
				<div class="box-content">
					<div class="form-ip">
						<p>First name</p>
						<input type="text" id="firstname" name="firstname"
							value="${ user.firstname }">
					</div>
					<div class="form-ip">
						<p>Last name</p>
						<input type="text" id="lastname" name="lastname"
							value="${ user.lastname }">
					</div>
					<div class="form-ip">
						<p>Phone number</p>
						<input type="number" id="phonenumber" name="phonenumber"
							value="${ user.phone_number }">
					</div>
					<div class="form-ip">
						<p>Email</p>
						<input type="text" id="email" name="email" value="${ user.email }">
					</div>
				</div>
				<p class="error-change" id="error-contact"></p>
				<div class="box-btn">
					<button type="button" id="save-contact">Save</button>
				</div>
			</div>

			<div class="box-add-intro none" id="box-change-address">
				<img class="close-box" alt=""
					src="<c:url value="/assets/images/icons/icons8-close-67.png"/>">
				<div class="box-title">Change address</div>
				<div class="box-content">
					<div class="form-ip">
						<p>Address</p>
						<input type="text" id="address" name="address"
							value="${ user.address }">
					</div>
					<div class="form-ip">
						<p>District</p>
						<input type="text" id="district" name="district"
							value="${ user.district }">
					</div>
					<div class="form-ip">
						<p>City</p>
						<input type="text" id="city" name="city" value="${ user.city }">
					</div>
					<div class="form-ip">
						<p>Postal code</p>
						<input type="text" id="postal" name="postal" value="800000">
					</div>
				</div>
				<p class="error-change" id="error-address"></p>
				<div class="box-btn">
					<button type="button" id="save-address">Save</button>
				</div>
			</div>
			<div class="wrapper-all none" id="wrapper-all"></div>

			<div class="box-add-intro none" id="box-msg">
				<img class="close-box" alt=""
					src="<c:url value="/assets/images/icons/icons8-close-67.png"/>">
				<div class="box-title">Notify</div>
				<p class="error-change" id="error-msg"></p>
				<div class="box-btn">
					<button type="button" id="btn-ok">OK</button>
				</div>
			</div>
		</form>
	</header>


	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<script> // validate Email
	const validateEmail = (email) => {
	  	return email.match(
	    	/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	  	);
	}
	</script>

	<script>
		// contact
		$("#change-contact").click(function() {
			$("#box-change-contact").removeClass("none");
			$("#wrapper-all").removeClass("none");
			$("#profile-menu").toggle("none");
		});
		$("#save-contact").click(
				function() {
					var id = "${ user.id}";
					var firstname = $("#firstname").val();
					var lastname = $("#lastname").val();
					var phonenumber = $("#phonenumber").val();
					var email = $("#email").val();
					if (firstname == "") {
						$("#error-contact").text("First name is empty!");
					} else if (lastname == "") {
						$("#error-contact").text("Last name is empty!");
					} else if (phonenumber == "") {
						$("#error-contact").text("Phone number is empty!");
					} else if (email == "") {
						$("#error-contact").text("Email address is empty!");
					} else if (!validateEmail(email)) {
						$("#error-contact").text("Invaild email address!");
					} else {
						$("#box-change-contact").addClass("none");
						$("#wrapper-all").addClass("none");
						$('#myform').attr('action',
								'/ShopTandT/profile/save-contact/' + id);
						$('#myform').submit();
					}
				});
		$(".close-box").click(function() {
			$("#box-change-contact").addClass("none");
			$("#wrapper-all").addClass("none");
		});
		
		var check_contact = "${ sessionScope.change }";
		if(check_contact == "contacttrue") {
			$("#box-msg").removeClass("none");
			$("#wrapper-all").removeClass("none");
			$("#error-msg").css("fontSize", 14);
			$("#error-msg").css("color", "darkgreen");
			$("#error-msg").text("Contact change successful!!");
			$(".close-box").click(function() {
				$("#box-msg").addClass("none");
				$("#wrapper-all").addClass("none");
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "/ShopTandT/profile/save-change?change");
				xhr.onload = function() {
				};
				xhr.send();
			});
		}
	</script>

	<script>
		// address
		$("#change-address").click(function() {
			$("#box-change-address").removeClass("none");
			$("#wrapper-all").removeClass("none");
			$("#profile-menu").toggle("none");
		});
		$("#save-address").click(
				function() {
					var id = "${ user.id}";
					var address = $("#address").val();
					var district = $("#district").val();
					var city = $("#city").val();
					if (address == "") {
						$("#error-address").text("Address is empty!");
					} else if (district == "") {
						$("#error-address").text("District is empty!");
					} else if (city == "") {
						$("#error-address").text("City is empty!");
					} else {
						$("#box-change-address").addClass("none");
						$("#wrapper-all").addClass("none");
						$('#myform').attr('action',
								'/ShopTandT/profile/save-address/' + id);
						$('#myform').submit();
					}
				});
		$(".close-box").click(function() {
			$("#box-change-address").addClass("none");
			$("#wrapper-all").addClass("none");
		});
		
		var check_address = "${ sessionScope.change }";
		if(check_address == "addresstrue") {
			$("#box-msg").removeClass("none");
			$("#wrapper-all").removeClass("none");
			$("#error-msg").css("fontSize", 14);
			$("#error-msg").css("color", "darkgreen");
			$("#error-msg").text("Address change successful!!");
			$(".close-box").click(function() {
				$("#box-msg").addClass("none");
				$("#wrapper-all").addClass("none");
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "/ShopTandT/profile/save-change?change");
				xhr.onload = function() {
				};
				xhr.send();
			});
		}
	</script>
	<script type="text/javascript"> //validate Password
	function validatePassword(pw) {
	    return /[A-Z]/       .test(pw) &&
	           /[a-z]/       .test(pw) &&
	           /[0-9]/       .test(pw) &&
	           /[^A-Za-z0-9]/.test(pw) &&
	           pw.length > 7;
	}
	</script>
	<script>
		// password
		$("#change-pw").click(function() {
			$("#box-change-pw").removeClass("none");
			$("#wrapper-all").removeClass("none");
			$("#profile-menu").toggle("none");
		});
		$("#save-pw").click(
				function() {
					var id = "${ user.id}";
					var oldpw = $("#oldpw").val();
					var newpw = $("#newpw").val();
					var cfpw = $("#cfpw").val();
					if (oldpw == "") {
						$("#error-pw").text("Old password is empty!");
						$("#error-pw").css("fontSize", 14);
					} else if (newpw == "") {
						$("#error-pw").text("New password is empty!");
						$("#error-pw").css("fontSize", 14);
					} else if (!validatePassword(newpw)) {
						$("#error-pw").text("Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, 1 character and 8 or more characters!");
						$("#error-pw").css("fontSize", 12);
					} else if (cfpw == "") {
						$("#error-pw").text("Confirm password is empty!");
						$("#error-pw").css("fontSize", 14);
					} else if (cfpw != newpw) {
						$("#error-pw").text("Confirm password must be same as password!");
						$("#error-pw").css("fontSize", 14);
					} else {
						$("#box-change-pw").addClass("none");
						$("#wrapper-all").addClass("none");
						$('#myform').attr('action',
								'/ShopTandT/profile/save-pw/' + id);
						$('#myform').submit();
					}
				});

		$(".close-box").click(function() {
			$("#box-change-pw").addClass("none");
			$("#wrapper-all").addClass("none");
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "/ShopTandT/profile/save-change?change");
			xhr.onload = function() {
			};
			xhr.send();
		});
		
		var check_pw = "${ sessionScope.change }";
		if(check_pw == "oldfalse") {
			$("#box-change-pw").removeClass("none");
			$("#wrapper-all").removeClass("none");
			$("#error-pw").text("Old password is not correct!");
			$("#error-pw").css("fontSize", 14);
		} else if(check_pw == "pwtrue") {
			$("#box-msg").removeClass("none");
			$("#wrapper-all").removeClass("none");
			$("#error-msg").css("fontSize", 14);
			$("#error-msg").css("color", "darkgreen");
			$("#error-msg").text("Password change successful!!");
			$(".close-box").click(function() {
				$("#box-msg").addClass("none");
				$("#wrapper-all").addClass("none");
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "/ShopTandT/profile/save-change?change");
				xhr.onload = function() {
				};
				xhr.send();
			});
		}
		
		$("#btn-ok").click(function() {
			$("#box-msg").addClass("none");
			$("#wrapper-all").addClass("none");
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "/ShopTandT/profile/save-change?change");
			xhr.onload = function() {
			};
			xhr.send();
		});
	</script>

	<script>
		// intro
		$("#add-intro").click(function() {
			$("#box-add-intro").removeClass("none");
			$("#wrapper-all").removeClass("none");
			$("#profile-menu").toggle("none");
		});
		$("#save-add-intro").click(function() {
			var id = "${ user.id}";
			$("#box-add-intro").addClass("none");
			$("#wrapper-all").addClass("none");
			$('#myform').attr('action', '/ShopTandT/profile/save-intro/' + id);
		});

		$(".close-box").click(function() {
			$("#box-add-intro").addClass("none");
			$("#wrapper-all").addClass("none");
		});
	</script>

	<script>
		$("#settings").click(function() {
			$("#profile-menu").toggle("none");
		});
	</script>

	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
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