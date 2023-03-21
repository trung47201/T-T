<!doctype html>
<html lang="en">
<title>Sign Up :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href='<c:url value="/assets/css/sign-up.css"/>'>

<style>
#login {
	margin-top: 60px !important;
}

.login_form {
	padding: 40px 40px !important;
}

.login_form_container {
	height: 600px !important;
	max-height: 600px !important;
}

body {
	overflow-y: hidden;
}

i.fa.fa-eye {
	margin-left: -20px;
}

i.fa.fa-eye-slash {
	margin-left: -20px;
	color: white;
}

i.fa.fa-eye-slash:hover, i.fa.fa-eye:hover {
	cursor: pointer;
	color: #00ccff;
}
</style>

<body background="<c:url value='/assets/images/poster/howls_bg.jpg'/>">
	<form action="/SpringMVC/sign-up" method="post">
		<div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="login_form_container" id="login_form_container">
						<div class="login_form">
							<h2>SIGN UP</h2>
							<div class="form-input">
								<div class="right-form-input">
									<div class="input_group">
										<i class="fa fa-user"></i> <input type="text" id="fullname"
											name="fullname" placeholder="Full name" class="input_text">
									</div>
									<div class="input_group">
										<i class="fa fa-unlock-alt"></i> <input type="password"
											id="password" name="password" placeholder="Password"
											class="input_text"> <i class="fa fa-eye-slash"
											id="eye-hidden-pw"></i> <i class="fa fa-eye none"
											id="eye-show-pw"></i>
									</div>
									<div class="input_group">
										<i class="fa fa-unlock-alt"></i> <input type="password"
											id="confirmpassword" name="confirmpassword"
											placeholder="Confirm password" class="input_text"> <i
											class="fa fa-eye-slash" id="eye-hidden-cfpw"></i> <i
											class="fa fa-eye none" id="eye-show-cfpw"></i>
									</div>
									<div class="input_group">
										<i class="fa fa-map"></i> <input type="text" id="town"
											name="town" placeholder="Town" class="input_text">
									</div>
								</div>
								<div class="left-form-input">
									<div class="input_group">
										<i class="fa fa-envelope"></i> <input type="text" id="email"
											name="email" placeholder="Email" class="input_text">
									</div>
									<div class="input_group">
										<i class="fa fa-phone"></i> <input type="number"
											id="phonenumber" name="phonenumber"
											placeholder="Phone number" class="input_text">
									</div>
									<div class="input_group">
										<i class="fa fa-map-marker"></i> <input type="text"
											id="address" name="address" placeholder="Address line 1"
											class="input_text">
									</div>
									<div class="input_group">
										<i class="fa fa-building"></i> <input type="text" id="city"
											name="city" placeholder="City" class="input_text">
									</div>
								</div>
							</div>

							<div class="error-login none">
								<p id="msg-error">Password is empty!</p>
							</div>

							<div class="button_group" id="login_button">
								<button type="button" class="signup" name="signup" id="signup">Sign
									Up</button>
							</div>
							<div class="fotter">
								<a>Forgot Password?</a> <a href="/SpringMVC/">Back to Login</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

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
		// click to show confirm password
		$("#eye-hidden-cfpw").click(function() {
			$(this).toggleClass("none");
			$("#eye-show-cfpw").toggleClass("none");
			$("#confirmpassword").attr("type", "text");
		});
		// click to hidden confirm password
		$("#eye-show-cfpw").click(function() {
			$(this).toggleClass("none");
			$("#eye-hidden-cfpw").toggleClass("none");
			$("#confirmpassword").attr("type", "password");
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
			document.getElementById("login_button").style.marginTop = "60px";
			
			window.location.href = 'http://localhost:8888/SpringMVC/';
		} else if(msg == "false"){
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Sign Up Unsuccess!";
			document.getElementById("login_button").style.marginTop = "60px";
		} else if(msg == "exist"){
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Phone number or Email already exists!";
			document.getElementById("login_button").style.marginTop = "60px";
		} 
	</script>


	<script> //SIGN UP
		$(".signup").click(function() {
			var toSubmit = this;
			var fullname = $("#fullname").val();
			var password = $("#password").val();
			var cfpassword = $("#confirmpassword").val();
			var email = $("#email").val();
			var phone_number = $("#phonenumber").val();
			var address = $("#address").val();
			var city = $("#city").val();
			var town = $("#town").val();

			if(fullname == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Full name is empty!";
				document.getElementById("login_button").style.marginTop = "60px";
			} else if(password == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Password is empty!";  
				document.getElementById("login_button").style.marginTop = "60px";
			} else if(cfpassword == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Confirm password is empty!";
				document.getElementById("login_button").style.marginTop = "60px";
			} else if(cfpassword != password) {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Confirm password must be same as password!";
				document.getElementById("login_button").style.marginTop = "60px";
			} else if(email == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Email is empty!";
				document.getElementById("login_button").style.marginTop = "60px"; 
			} else if(phone_number == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Phone number is empty!";
				document.getElementById("login_button").style.marginTop = "60px";
			} else if(address == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Address line 1 is empty!";
				document.getElementById("login_button").style.marginTop = "60px";
			} else if(town == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "Town is empty!";
				document.getElementById("login_button").style.marginTop = "60px";
			} else if(city == "") {
				$(".error-login").removeClass("none");
				document.getElementById("msg-error").innerHTML = "City is empty!";
				document.getElementById("login_button").style.marginTop = "60px";
			} else {
				$(toSubmit).attr('type', 'submit');
			}
		});
	</script>

	<script> // validate Email
	const validateEmail = (email) => {
	  	return email.match(
	    	/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	  	);
	};
	$("#email").focusin(function() {
		var email = $("#email").val();
		if(!validateEmail(email)) {
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Exp: tishoes204@gmail.com";  
			document.getElementById("msg-error").style.color = "red";  
			document.getElementById("login_button").style.marginTop = "30px";
		} else {
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Ok!";
			document.getElementById("msg-error").style.color = "green";  
		}
	});
	$("#email").focusout(function() {
		$(".error-login").addClass("none");
		document.getElementById("login_button").style.marginTop = "88px";
	});
	</script>

	<script> // validate Password and Confirm Password
	function validatePassword(pw) {
	    return /[A-Z]/       .test(pw) &&
	           /[a-z]/       .test(pw) &&
	           /[0-9]/       .test(pw) &&
	           /[^A-Za-z0-9]/.test(pw) &&
	           pw.length > 7;
	}
	$("#password").focusin(function() {
		var password = $("#password").val();
		if(!validatePassword(password)) {
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, 1 character and 8 or more characters!";  
			document.getElementById("msg-error").style.color = "red";  
			document.getElementById("login_button").style.marginTop = "30px";
		} else {
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Strong!";
			document.getElementById("msg-error").style.color = "green";  
		}
	});
	$("#password").focusout(function() {
		$(".error-login").addClass("none");
		document.getElementById("login_button").style.marginTop = "77px";
	});
	$("#confirmpassword").focusin(function() {
		var password = $("#confirmpassword").val();
		if(!validatePassword(password)) {
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Confirm password must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, 1 character and 8 or more characters!";  
			document.getElementById("msg-error").style.color = "red";  
			document.getElementById("login_button").style.marginTop = "30px";
		} else {
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Strong!";  
			document.getElementById("msg-error").style.color = "green";  
		}
	});
	$("#confirmpassword").focusout(function() {
		$(".error-login").addClass("none");
		document.getElementById("login_button").style.marginTop = "77px";
	});
	</script>

</body>

</html>