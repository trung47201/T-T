<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<div class="admin-header">
		<div class="search-form">
			<div class="admin-search">
				<img
					src="<c:url value="/assets/images/icons/icons8-search-64.png"/>"
					alt="icon-search">
			</div>
			<div class="admin-search">
				<input type="text" name="" id="" placeholder="Search...">
			</div>
		</div>
		<div class="infor">
			<div class="admin-notify-icon">
				<img
					src="<c:url value="/assets/images/icons/icons8-notification-1000.png"/>"
					alt="icon-notify">
			</div>
			<div class="admin-notify-icon">
				<img
					src="<c:url value="/assets/images/icons/icons8-messages-100.png"/>"
					alt="icon-notify">
			</div>
			<div class="admin-avatar">
				<img src="<c:url value="/assets/images/users/avt-default.jpg"/>"
					alt="avt">
			</div>
		</div>
	</div>
</header>