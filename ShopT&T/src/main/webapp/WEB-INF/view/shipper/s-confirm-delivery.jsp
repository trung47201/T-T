<!DOCTYPE html>
<html>
<title>QR CODE :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<c:url value="/assets/js/html5-qrcode.min.js"/>"></script>
<style>
.result {
	background-color: green;
	color: #fff;
	padding: 20px;
}

.row {
	display: flex;
}
</style>
<div class="row">
	<div class="col">
		<div style="width: 500px;" id="reader"></div>
	</div>
	<div class="col" style="padding: 30px;">
		<h4>SCAN RESULT</h4>
		<div id="result">Result Here</div>
	</div>
</div>
<script type="text/javascript">
	function onScanSuccess(qrCodeMessage) {
		document.getElementById('result').innerHTML = '<span class="result">'
				+ qrCodeMessage + '</span>';
		location.href = "/ShopTandT/shipper/confirm-delivery/"+qrCodeMessage;
	}
	function onScanError(errorMessage) {
		//handle scan error
	}
	var html5QrcodeScanner = new Html5QrcodeScanner("reader", {
		fps : 10,
		qrbox : 250
	});
	html5QrcodeScanner.render(onScanSuccess, onScanError);
</script>
<body>
</body>
</html>