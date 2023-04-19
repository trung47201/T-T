<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${ packing == 'true' }">
	<title>Packing</title>
</c:if>
<c:if test="${ shipping == 'true' }">
	<title>Shipping</title>
</c:if>
<script
	src="https://unpkg.com/html5-qrcode@2.0.9/dist/html5-qrcode.min.js"></script>
</head>
<style>
body {
	display: flex;
	position: absolute;
	text-align: center;
	justify-content: center;
	background: #f9e1ee;
	align-items: center;
	color: white;
	top: 47%;
	left: 50%;
	transform: translate(-50%, -50%);
}

div#qr-reader {
	background: white;
}
</style>
<body>
	<div id="qr-reader" style="width: 600px"></div>
	<c:if test="${ packing == 'true' }">
		<script>
			function onScanSuccess(decodedText, decodedResult) {
				var id_order = decodedText;
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "/ShopTandT/admin/order-management?id_order="
						+ id_order + "&status=3");
				xhr.onload = function() {
					window.location.assign("/ShopTandT/admin/order-management");
				};
				xhr.send();
			}
			var html5QrcodeScanner = new Html5QrcodeScanner("qr-reader", {
				fps : 10,
				qrbox : 250
			});
			html5QrcodeScanner.render(onScanSuccess);
		</script>
	</c:if>
	<c:if test="${ shipping == 'true' }">
		<script>
			function onScanSuccess(decodedText, decodedResult) {
				var id_order = decodedText;
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "/ShopTandT/admin/order-management?id_order="
						+ id_order + "&status=4");
				xhr.onload = function() {
					window.location.assign("/ShopTandT/admin/order-management");
				};
				xhr.send();
			}
			var html5QrcodeScanner = new Html5QrcodeScanner("qr-reader", {
				fps : 10,
				qrbox : 250
			});
			html5QrcodeScanner.render(onScanSuccess);
		</script>
	</c:if>

</body>
</html>