<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<div class="menu" id="menu">
	<div class="menu-close">
		<p>MENU</p>
		<i class="fa fa-times" aria-hidden="true" id="i-close"></i>
	</div>
	<div class="list-menu">
		<ul>
			<li><a href="#">SALE</a></li>
			<li><a href="#">BLOG</a></li>
			<li><a href="#">ABOUT</a></li>
			<li><a href="#">CONTACT</a></li>
			<li><a href="#">SIZE CHART</a></li>
			<li><a href="#">ORDER LOOK UP</a></li>
			<li><a href="#">EASY RETURNS</a></li>
		</ul>
	</div>
	<div class="menu-contact">
		<a href="#"> <i class="fab fa-instagram" aria-hidden="true"></i></a> 
		<a href="#"> <i class="fab fa-facebook" aria-hidden="true"></i></a> 
		<a href="#"> <i class="fab fa-twitter" aria-hidden="true"></i></a> 
		<a href="#"> <i class="fab fa-youtube" aria-hidden="true"></i></a>
	</div>
</div>

<script type="text/javascript">
	$("#i-close").click(function() {
		$("#menu").css("width", 0 + "px");
	});
</script>