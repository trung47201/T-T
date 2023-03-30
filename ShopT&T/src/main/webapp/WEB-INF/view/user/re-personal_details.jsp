<!DOCTYPE html>
<html lang="en">
<title>Personal Details? :)</title>
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
<link rel="stylesheet" href='<c:url value="/assets/css/re-profile.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/message.css"/>'>
	<link rel="stylesheet"
	href="<c:url value="/assets/css/f-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">

<style>
.ok-btn button {
	border: 1px solid;
	background: #0086ff;
	color: white;
	font-size: 20px;
	box-shadow: 0 0 5px #666;
}

.welcome {
	box-shadow: 0px 5px 15px;
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
		<form method="post">
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
                                    <li><a class="p-menu" id="update-profile-picture">Update profile picture</a></li>
                                    <li>
                                        <a class="p-menu" id="infor">Information</a>
                                        <ul class="sub-menu none">
                                            <li><a>Contact</a></li>
                                            <li><a>Address</a></li>
                                        </ul>
                                    </li>
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
										<input type="text" id="" name="" readonly value="${ user.firstname }">
									</div>
									<div class="user-col">
										<p>Last name</p>
										<input type="text" id="" name="" readonly value="${ user.lastname }">
									</div>
								</div>
								<div class="user-row">
									<div class="user-col">
										<p>Phone number</p>
										<input type="number" id="" name="" readonly value="${ user.phone_number }">
									</div>
									<div class="user-col">
										<p>Email</p>
										<input type="text" id="" name="" readonly value="${ user.email }">
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
										<input type="text" id="" name="" readonly value="${ user.address }">
									</div>
								</div>
								<div class="user-row">
									<div class="user-col user-col1">
										<p>City</p>
										<input type="text" id="" name="" readonly value="${ user.city }">
									</div>
									<div class="user-col user-col1">
										<p>District</p>
										<input type="text" id="" name="" readonly value="${ user.district }">
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
								<img src="<c:url value="/assets/images/users/${ user.avatar }"/>" alt="">
							</c:if>
							<c:if test="${ userID == null }">
								<img src="<c:url value="/assets/images/users/avt-default.jpg"/>" alt="">
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
							${ user.firstname } <img src="<c:url value="/assets/images/icons/icons8-edit-64.png"/>" alt="">
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
				<img class="close-box" alt="" src="<c:url value="/assets/images/icons/icons8-close-67.png"/>">
				<div class="box-title">
					Introduce
				</div>
				<div class="box-content">
					<textarea rows="" cols=""></textarea>
				</div>
				<div class="box-btn">
					<button type="button" id="save-add-intro">Save</button>
				</div>
			</div>
			<div class="wrapper-all none" id="wrapper-all">
			</div>

		</form>
	</header>


	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>

	<jsp:include page="../layouts/user/search.jsp"></jsp:include>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
    <script>
        $("#add-intro").click(function () {
            $("#box-add-intro").removeClass("none");
            $("#wrapper-all").removeClass("none");
            $("#save-add-intro").click(function () {
            	$("#box-add-intro").addClass("none");
                $("#wrapper-all").addClass("none");
            });
            
            $(".close-box").click(function () {
            	$("#box-add-intro").addClass("none");
                $("#wrapper-all").addClass("none");
            });
        });
    </script>
    
    <script>
        $("#settings").click(function () {
            $("#profile-menu").toggle("none");
        });
    </script>

	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
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