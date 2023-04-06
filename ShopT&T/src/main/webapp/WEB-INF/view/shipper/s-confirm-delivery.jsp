<!DOCTYPE html>
<html>
<title>QR CODE :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/assets/css/re-delivery.css'/>">
<style>
</style>
<c:if test="${ delivered == null }">
	<div class="wrapper-background">
		<div class="wrapper-video">
			<video id="preview"></video>
		</div>
		<div class="wrap">
			<div class="wrapper-frame">
				<div class="frame1-video"></div>
				<div class="frame2-video"></div>
				<div class="frame3-video"></div>
				<div class="frame4-video"></div>
			</div>
		</div>
		<div class="wrap-angle">
			<div class="wrap-img">
				<div class="angle angle-1">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-chevron-left-100.png"/>">
				</div>
				<div class="angle angle-2">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-chevron-left-100.png"/>">
				</div>
				<div class="angle angle-3">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-chevron-left-100.png"/>">
				</div>
				<div class="angle angle-4">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-chevron-left-100.png"/>">
				</div>
			</div>
		</div>

		<div class="frame">
			<div class="frame-top">
				<div class="back">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-up-arrow-96.png"/>">
				</div>
				<h3>QR SCAN</h3>
				<div class="menu">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-menu-vertical-100.png"/>">
				</div>
			</div>
			<hr class="strike">
			<div class="bottom">
				<div class="flash">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-lightning-bolt-100.png"/>">
						<p>Flash</p>
				</div>
				<div class="scan selected">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-scan-64.png"/>">
						<p>QR scan</p>
				</div>
				<div class="file">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-image-60.png"/>">
						<p>File</p>
				</div>
			</div>
		</div>
	</div>
</c:if>

<c:if test="${ delivered == 'true' }">
	<div class="wrapper-background">
		<div class="status">
			<img alt=""
				src="<c:url value="/assets/images/icons/icons8-ok-240.png"/>">
			<h1>SUCCESSFUL DELIVERY</h1>
		</div>
	</div>
</c:if>
<c:if test="${ delivered == 'false' }">
	<div class="wrapper-background">
		<div class="status">
			<img alt=""
				src="<c:url value="/assets/images/icons/icons8-cancel-240.png"/>">
			<h1>FAILED! PLEASE TRY AGAIN.</h1>
		</div>
	</div>
</c:if>
<script
	src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>

<c:if test="${ delivered == null }">
	<script type="text/javascript">
	    var scanner = new Instascan.Scanner({ video: document.getElementById('preview'), scanPeriod: 5, mirror: false });
	    scanner.addListener('scan',function(content){
	    	if(Number.isInteger(parseInt(content))) {
	    		 window.location.href="/ShopTandT/shipper/confirm-delivery/" +content;
	    	} else {
	    		 window.location.href="/ShopTandT/shipper/confirm-delivery/0";
	    	}
	    });
	    Instascan.Camera.getCameras().then(function (cameras){
	        if(cameras.length>0){
	            scanner.start(cameras[0]);
	        }else{
	            console.error('No cameras found.');
	        }
	    }).catch(function(e){
	        console.error(e);
	    });
	</script>
</c:if>
<c:if test="${ delivered == 'true' }">
	<script type="text/javascript">
		var delay = 1000; 
		setTimeout(function(){ window.location = "/ShopTandT/shipper"; }, delay);
	</script>
</c:if>
<c:if test="${ delivered == 'false' }">
	<script type="text/javascript">
		var delay = 1000; 
		setTimeout(function(){ window.location = "/ShopTandT/shipper/confirm-delivery"; }, delay);
	</script>
</c:if>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(".flash").click(function () {
	$(".flash").addClass("selected");
	$(".scan").removeClass("selected");
	$(".file").removeClass("selected");
});
$(".scan").click(function () {
	$(".flash").removeClass("selected");
	$(".scan").addClass("selected");
	$(".file").removeClass("selected");
});
$(".file").click(function () {
	$(".flash").removeClass("selected");
	$(".scan").removeClass("selected");
	$(".file").addClass("selected");
});
</script>

<script type="text/javascript">
$(".back").click(function () {
	history.back();
});
</script>
<body>
	<%
	if (session.getAttribute("shipperID") == null) {
		response.sendRedirect("/ShopTandT/shipper/login");
	}
	%>
</body>
</html>