<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bill :)</title>
</head>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	background: #f9e1ee;
}

.wrap {
	min-width: 480px;
	max-width: 480px;
	min-height: 600px;
	max-height: 600px;
	height: 600px;
	background: white;
	display: flex;
	align-items: center;
	justify-content: center;
	position: absolute;
    top: 70px;
}

.wrapper {
	width: 94%;
	height: 97%;
	background: white;
	border: 3px solid black;
}

.row {
	display: flex;
	width: 100%;
}

.row1 {
	justify-content: space-around;
	height: 70px;
	align-items: center;
}

.logo img {
	width: 100px;
}

.row.row2 {
	height: 130px;
}

.row.row3 {
	height: 270px;
}

.col {
	padding: 5px;
}

.row2-col1, .row2-col2 {
	width: 50%;
}

.row2-col2 {
	border-left: 2px dashed black;
	border-top: 2px dashed black;
	border-bottom: 2px dashed black;
}

.row2-col1 {
	border-top: 2px dashed black;
	border-bottom: 2px dashed black;
}

.col.row3-col1 {
	width: 100%;
	position: relative;
}

.col.row3-col2 {
	border-left: 2px dashed black;
	width: 140px;
}

.qrcode {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 140px;
	overflow: hidden;
	border-bottom: 2px dashed black;
}

.row-1 {
	height: 100px; display : flex;
	border-top: 2px dashed black;
	display: flex;
}

p {
	font-size: 14px;
}

.order-date p {
	font-size: 16px;
	margin-top: 7px;
	margin-bottom: 12px;
}

.order-date {
	text-align: center;
	font-size: 24px;
}

.row-1-col1 {
	text-align: center; width : 50%;
	border-right: 2px dashed black;
	height: 100%;
	width: 50%;
}

.col.row-1-col2 {
	text-align: center;
	width: 50%;
	height: 100%;
}

.signature {
	height: 100%;
	border: 1px solid;
}

h1 {
	padding-top: 17px;
}
.note {
    position: absolute;
    bottom: 0;
}
</style>

<body>
	<div class="wrap">
		<div class="wrapper">
			<div class="row row1">
				<div class="col logo">
					<img src="<c:url value="/assets/images/logo/logo.png"/>" alt="">
				</div>
				<div class="col">
					<p>
						Bill or lading: <b>TT43OADG</b>
					</p>
				</div>
			</div>
			<div class="row row2">
				<div class="col row2-col1">
					<h4>From:</h4>
					<p>T&T</p>
					<p>5A/2 Trần Phú, P. 4 - Quận 5 - Thành phố Hồ Chí Minh</p>
					<p>TEL: 036 97 96 359</p>
				</div>
				<div class="col row2-col2">
					<h4>To:</h4>
					<p>Do Van Trung</p>
					<p>Xom Choi, Xuan Ky, Dong Xuan - Soc Son - Ha Noi</p>
					<p>TEL: 036 97 96 359</p>
				</div>
			</div>
			<div class="row row3">
				<div class="col row3-col1">
					<h4>Description (QTY: 2)</h4>
					<p>1. Nike Air Max 90 LTR, QTY: 1</p>
					<div class="note">
						<p>Note: Some products may be hidden due to the long list.</p>
					</div>
				</div>
				<div class="col row3-col2">
					<div class="qrcode">
						<img src="<c:url value="/assets/images/qrcode/qrcode186.jpg"/>"
							alt="">
					</div>
					<div class="order-date">
						<p>Order date:</p>
						20-10-2023 17:59:00
					</div>
				</div>
			</div>
			<div class="row-1">
				<div class="col row-1-col1">
					<p>Total payment</p>
					<h1>$100.55</h1>
				</div>
				<div class="col row-1-col2">
					<div class="signature">
						<h3>Consignee's signature</h3>
						<p>Confirm the goods are intact</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
