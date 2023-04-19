<!DOCTYPE html>
<html lang="en">
<title>Voucher</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-index.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/swiper-bundle.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-message.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/navscroll.css"/>">
<link rel="stylesheet"
	href='<c:url value="/assets/css/login-icon.css"/>'>
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/checkbox-radio-input.css"/>">
<style>
.ok-btn button {
	border: 1px solid;
	background: #0086ff;
	color: white;
	font-size: 20px;
	box-shadow: 0 0 5px #666;
}

.content-products {
	margin-top: 50px;
}

.welcome {
	box-shadow: 0px 5px 15px;
}

.voucher img {
	width: 100%;
}

.voucher {
	display: flex;
	width: 100%;
}

.vch-wrap {
	width: 80%;
	margin-left: 10%;
	margin-top: 40px;
}

.vch-ele {
	position: relative;
	background: white;
	width: 49%;
	height: 170px;
	display: flex;
	cursor: pointer;
}

.vch-ele-left {
	position: relative;
	height: 100%;
	display: flex;
}

span.half-circle-top, span.half-circle-bottom {
	display: flex;
	position: absolute;
	background: #0c1022;
	width: 26px;
	height: 14px;
	left: 62%;
}

span.half-circle-top {
	border-radius: 0 0 30px 30px;
	margin-top: -1px;
}

span.half-circle-bottom {
	border-radius: 30px 30px 0 0;
	bottom: 0;
	margin-bottom: -1px;
}

.vch-list {
	display: flex;
	justify-content: space-between;
	margin-bottom: 24px;
}

.vch-discount {
	color: #2AB28A;
	display: flex;
	font-size: 28px;
	font-weight: bold;
	position: absolute;
	top: 17px;
	left: 60px;
	align-items: center;
}

.vch-discount p {
	margin: 0;
	font-size: 50px;
	margin-left: 12px;
}

.btn-save {
	position: absolute;
	bottom: 18px;
	left: 71.3%;
}

.btn-save button {
	cursor: pointer;
	width: 70px;
	height: 30px;
	border: 0;
	border-radius: 40px;
	background: none;
	color: #2ab28a;
	font-size: 20px;
	font-weight: bold;
}

.btn-save button:focus {
	outline-style: none;
}

.vch-content {
	position: absolute;
	color: white;
	font-size: 14px;
	top: 81px;
	left: 47px;
}

.line1, .vch-title {
	display: flex;
}

.vch-title {
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
}

.line1 p {
	margin: 0;
	color: yellow;
	font-weight: bold;
}

.vch-ele-right {
	color: black;
	width: 100%;
	text-align: center;
	padding: 38px 36px;
}

.vch-title p {
	font-size: 18px;
	font-weight: bold;
}
.img-header {
    height: 840px !important;
}

</style>
<body style="color: #212122;">
	<%
	if (session.getAttribute("userid") == null) {
		response.sendRedirect("/ShopTandT/");
	}
	%>
	<jsp:include page="../layouts/user/re-menu.jsp"></jsp:include>
	<div class="back-header">
		<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
	</div>
	<div class="img-header">
		<img alt=""
			src="<c:url value="/assets/images/poster/voucher123.jpg"/>">
	</div>
		<form method="post">
			<!--########################################3   START page CONTACT ###########################################-->
			<div class="vch-wrap">
				<c:set var="count" value="${ 0 }" />
				<c:forEach var="it" items="${ listVoucher }" varStatus="index">
					<c:set var="idx" value="${ index.getIndex() }" />
					<c:if test="${ idx % 2 ==0  }">
						<div class="vch-list">
							<div class="vch-ele" id="${ it.key.id }">
								<div class="vch-ele-left">
									<img src="<c:url value="/assets/images/logo/bg-voucher.png"/>"
										alt="images-order">
									<div class="vch-discount">
										Sales off
										<p>${ it.key.vcdiscount }%</p>
									</div>
									<div class="btn-save">
										<button id="save" name="save">Save</button>
									</div>
									<div class="vch-content">
										<div class="line1">
											Apply for orders from
											<p>&nbsp;$${ it.key.applyfor }</p>
										</div>
										<div class="line1">1 slot/customer</div>
										<div class="line1">Applies to all products.</div>
									</div>
								</div>
								<div class="vch-ele-right">
									<c:if test="${ it.value == 0 }">
										<div class="vch-title">In effect until</div>
										<div class="vch-title">
											<fmt:parseDate value="${ it.key.end_date }"
												pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime"
												type="both" />
											<p>
												<fmt:formatDate pattern="HH:mm" value="${ parsedDateTime }" />
											</p>
											&nbsp;day&nbsp;
											<p>
												<fmt:formatDate pattern="dd/MM" value="${ parsedDateTime }" />
											</p>
										</div>
										<div class="vch-title">Limited</div>
									</c:if>
									<c:if test="${ it.value == 1 }">
										<div class="vch-title">Start from</div>
										<div class="vch-title">
											<fmt:parseDate value="${ it.key.start_date }"
												pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime"
												type="both" />
											<c:if
												test="${ parsedDateTime.hours==0 && parsedDateTime.minutes==0 }">
												<p>
													<fmt:formatDate pattern="HH:mm" value="${ parsedDateTime }" />
												</p>
											</c:if>
											<c:if
												test="${ parsedDateTime.hours != 0 || parsedDateTime.minutes != 0 }">
												<p>
													<fmt:formatDate pattern="HH:mm" value="${ parsedDateTime }" />
												</p>
											</c:if>
											&nbsp;day&nbsp;
											<p>
												<fmt:formatDate pattern="dd/MM" value="${ parsedDateTime }" />
											</p>
										</div>
										<div class="vch-title">Not Start</div>
									</c:if>
								</div>
								<span class="half-circle-top"></span> <span
									class="half-circle-bottom"></span>
							</div>
					</c:if>
					<c:if test="${ idx % 2 == 1 }">
						<div class="vch-ele" id="${ it.key.id }">
							<div class="vch-ele-left">
								<img src="<c:url value="/assets/images/logo/bg-voucher.png"/>"
									alt="images-order">
								<div class="vch-discount">
									Sales off
									<p>${ it.key.vcdiscount }%</p>
								</div>
								<div class="btn-save">
									<button id="save" name="save">Save</button>
								</div>
								<div class="vch-content">
									<div class="line1">
										Apply for orders from
										<p>&nbsp;$${ it.key.applyfor }</p>
									</div>
									<div class="line1">1 slot/customer</div>
									<div class="line1">Applies to all products.</div>
								</div>
							</div>
							<div class="vch-ele-right">
								<c:if test="${ it.value == 0 }">
									<div class="vch-title">In effect until</div>
									<div class="vch-title">
										<fmt:parseDate value="${ it.key.end_date }"
											pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime"
											type="both" />
										<p>
											<fmt:formatDate pattern="HH:mm" value="${ parsedDateTime }" />
										</p>
										&nbsp;day&nbsp;
										<p>
											<fmt:formatDate pattern="dd/MM" value="${ parsedDateTime }" />
										</p>
									</div>
									<div class="vch-title">Limited</div>
								</c:if>
								<c:if test="${ it.value == 1 }">
									<div class="vch-title">Start from</div>
									<div class="vch-title">
										<fmt:parseDate value="${ it.key.start_date }"
											pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime"
											type="both" />
										<p>
											<fmt:formatDate pattern="HH:mm" value="${ parsedDateTime }" />
										</p>
										&nbsp;day&nbsp;
										<p>
											<fmt:formatDate pattern="dd/MM" value="${ parsedDateTime }" />
										</p>
									</div>
									<div class="vch-title">Not Start</div>
								</c:if>
							</div>
							<span class="half-circle-top"></span> <span
								class="half-circle-bottom"></span>
						</div>
			</div>
			</c:if>
			<c:set var="count" value="${ idx }" />
			</c:forEach>
			<c:if test="${ count % 2 == 0}">
				</div>
			</c:if>
			</div>
		</form>

	<jsp:include page="re-products-body.jsp"></jsp:include>
	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>


	<script type="text/javascript">
		var id_user = "${ userID }";
		$(".vch-ele").click(function() {
			var id = this.id;
			var btn = $('button', this)[0];
			$(btn).text("Saved");
			var xhr = new XMLHttpRequest();

			xhr.open("GET", "/SpringMVC/voucher/save/" + id_user + "_" + id);
			xhr.onload = function() {
			};
			xhr.send();
		});
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
		}
	</script>
	
	
</body>

</html>