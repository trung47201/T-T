<!doctype html>
<html lang="en">
<title>Forgot Password:)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href='<c:url value="/assets/css/forgot-pw.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/r-index.css"/>'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<c:url value="/assets/css/r-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">
<body>
	<jsp:include page="../layouts/user/re-menu.jsp"></jsp:include>
	<div class="back-header">
		<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
	</div>
	<div class="img-header">
		<img alt=""
			src="<c:url value="/assets/images/poster/storepic2_1200x.webp"/>">
	</div>

	<div class="text">
		<h3>Forgot</h3>
		<p class="cool">
			<span data-text="password" style="color: white;">password</span>
		</p>
	</div>
	<hr>

	<div class="wrapper-form-signup container">
		<form action="/SpringMVC/sign-up" method="post">
			<div class="login_form">
				<div class="form-input">
					<div class="right-form-input">
						<div class="input_group">
							<i class="fa fa-envelope"></i> <input type="text" id="email"
								name="email" placeholder="Email or Phone number"
								class="input_text">
						</div>
					</div>
				</div>
				<div class="msg-none">
					<p>We'll send you an email to reset your password.</p>
				</div>
				<div class="error-login none">
					<p id="msg-error">Password is empty!</p>
				</div>

				<div class="button_group w-login" id="login_button">
					<div class="btn-effect">
						<button type="button" class="signup" name="signup" id="signup">Send</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<script type="text/javascript">
		// click to show password 
		$("#eye-hidden-pw").click(function() {
			$(this).toggleClass("none");
			$("#eye-show-pw").toggleClass("none");
			$("#password").attr("type", "text");
		});
		// click to hidden password 
		$("#eye-show-pw").click(function() {
			$(this).toggleClass("none");
			$("#eye-hidden-pw").toggleClass("none");
			$("#password").attr("type", "password");
		});
	</script>

	<script type="text/javascript">
		var msg = "";
		if(${message != null}) {
			msg = "${ message }";
		}
		if(msg == "true") {
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Sign Up Success!";
			document.getElementById("login_button").style.marginTop = "15px";
			
			window.location.href = 'http://localhost:8888/SpringMVC/';
		} else if(msg == "false"){
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Sign Up Unsuccess!";
			document.getElementById("login_button").style.marginTop = "15px";
		} else if(msg == "exist"){
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Phone number or Email already exists!";
			document.getElementById("login_button").style.marginTop = "15px";
		} 
	</script>

	<script> //SIGN UP
		$(".signup").click(function() {
			var toSubmit = this;
			var email = $("#email").val();
			var password = $("#password").val();

			 if(email == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Email is empty!";
				document.getElementById("login_button").style.marginTop = "15px"; 
			} else if(password == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Password is empty!";  
				document.getElementById("login_button").style.marginTop = "15px";
			} else {
				$(toSubmit).attr('type', 'submit');
			}
		});
	</script>


</body>

</html>