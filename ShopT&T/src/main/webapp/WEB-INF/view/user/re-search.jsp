<!doctype html>
<html lang="en">
<title>Search</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href='<c:url value="/assets/css/r-signup.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/f-index.css"/>'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-favorite.css"/>">
<style>
.signup {
	cursor: pointer;
}
</style>
<jsp:include page="../layouts/user/re-favorite.jsp"></jsp:include>
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
		<p class="cool">
			<span data-text="Search" style="color: white;">Search</span>
		</p>
	</div>
	<hr>

	<div class="wrapper-form-signup container">
		<form action="/ShopTandT/products" method="post">
			<div class="login_form">
				<div class="form-input">
					<div class="right-form-input">
						<div class="input_group">
							<i class="fa fa-search"></i> <input type="text" id="search"
								name="search" placeholder="Search..."
								class="input_text">
						</div>
					</div>
				</div>

				<div class="error-login none">
					<p id="msg-error">Please enter a keyword to search!</p>
				</div>
				<div class="button_group w-login" id="login_button">
					<div class="btn-effect">
						<button type="button" class="signup" name="search-btn" id="search-btn">Search</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>


	<script type="text/javascript">
	if(${ message != null }) {
		if(${message == "false"}){
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Username or password is not correct!";  
		} else if(${message == "logout"}) {
			//alert("Looking forward to seeing you again soon!");
		} else if(${message == "block"}){
			$(".error-login").removeClass("none");
			document.getElementById("msg-error").innerHTML = "Your account has been locked, please contact hotline: 036 97 96 359 for more details!";  
		}
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

	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
		}
	</script>

</body>

</html>