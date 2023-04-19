<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Login :) ?</title>
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-shipper-login.css'/>">

<style>
</style>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store");
		if(session.getAttribute("shipperID") != null) {
			response.sendRedirect("/ShopTandT/shipper");
		}
	%>
	<div class="background">
		<img alt="" src="<c:url value="/assets/images/logo/shipper.jpg"/>">
	</div>
	<div class="caixa__login">
		<h2>Shipper T&T</h2>
		<form id="my_form" method="post" action="/ShopTandT/shipper/login">
			<div class="caixa__login-input">
				<input type="text" id="username" name="username" autocomplete="off"
					required /> <label>Email or Phone number</label>
			</div>
			<div class="caixa__login-input">
				<input type="password" id="password" name="password" required /> <label>Password</label>
			</div>
			<c:if test="${ sessionScope.msgLoginShipper == 'email' }">
				<p id="msg-login-admin">Email or password not correct!</p>
			</c:if>
			<c:if test="${ sessionScope.msgLoginShipper == 'phone' }">
				<p id="msg-login-admin">Phone number or password not correct!</p>
			</c:if>
			<c:if test="${ sessionScope.msgLoginShipper == 'true' }">
				<p class="green" id="msg-login-admin">Success!</p>
			</c:if>
			<p class="none" id="msg-login-shipper"></p>
			<a onclick="login()">
				Login
			</a>
		</form>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript">
		$('#password').keydown(function(event) {
			var get = this;
			// enter has keyCode = 13, change it if you want to use another button
			if (event.keyCode == 13) {
				var username = $("#username").val();
				var password = $("#password").val();
				if (username == "") {
					$("#msg-login-admin").addClass("none");
					$("#msg-login-shipper").removeClass("none");
					$("#msg-login-shipper").
					text("User name is empty!");
					$("#msg-login-admin").text("");
				} else if (password == "") {
					$("#msg-login-admin").addClass("none");
					$("#msg-login-shipper").removeClass("none");
					$("#msg-login-shipper").text("Password is empty!");
					$("#msg-login-admin").text("");
				} else {
					get.form.submit();
				}
				return false;
			}
		});
	</script>

	<script type="text/javascript">
		function login() {
			var username = $("#username").val();
			var password = $("#password").val();
			if (username == "") {
				$("#msg-login-admin").addClass("none");
				$("#msg-login-shipper").removeClass("none");
				$("#msg-login-shipper").text("User name is empty!");
				$("#msg-login-admin").text("");
			} else if (password == "") {
				$("#msg-login-admin").addClass("none");
				$("#msg-login-shipper").removeClass("none");
				$("#msg-login-shipper").text("Password is empty!");
				$("#msg-login-admin").text("");
			} else {
				$('#my_form').attr('action', '/ShopTandT/shipper/login');
				document.getElementById('my_form').submit();
			}
			return false;
		}
	</script>
	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
		}
	</script>
</body>

</html>

