<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${ sessionScope.adminID == 0 || sessionScope.adminID == null }">
	<div class="background"></div>
	<div class="caixa__login">
		<h2>Administrativo</h2>
		 <form id="my_form" method="post" action="/SpringMVC/admin/login">
			<div class="caixa__login-input">
				<input type="text" id="username" name="username"  autocomplete="off" required /> <label>Email or Phone number</label>
			</div>
			<div class="caixa__login-input">
				<input type="password" id="password" name="password" required /> <label>Password</label>
			</div>
			<c:if test="${ sessionScope.msgLogin == 'email' }">
				<p id="msg-login-admin">Email or password not correct!</p>
			</c:if>
			<c:if test="${ sessionScope.msgLogin == 'phone' }">
				<p id="msg-login-admin">Phone number or password not correct!</p>
			</c:if>
			<c:if test="${ sessionScope.msgLogin == 'true' }">
				<p class="green" id="msg-login-admin">Success!</p>
			</c:if>
			<a onclick="login()"> <span></span> <span></span> <span></span> <span></span>
				Acessar
			</a>
		</form>
	</div>
</c:if>

