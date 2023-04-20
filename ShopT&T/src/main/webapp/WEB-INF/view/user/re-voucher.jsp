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
<link rel="stylesheet"
	href="<c:url value="/assets/css/re-message.css"/>">
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
<link rel="stylesheet"
	href="<c:url value="/assets/css/voucher1234.css"/>">
<style>
.size-list span {
	font-family: unset;
	font-weight: normal;
	font-size: 16px;
}
</style>
<link rel="stylesheet" href="<c:url value="/assets/css/f-favorite.css"/>">
<jsp:include page="../layouts/user/re-favorite.jsp"></jsp:include>
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
				<c:set var="id" value="${ index.getIndex() }" />
				<c:set var="count" value="${ index.getIndex() }" />
				<c:if test="${ id % 4 == 0 }">
					<div class="vch-list">
						<div class="vch-ele">
							<div class="vch-ele-left">
								<img alt=""
									src="<c:url value="/assets/images/logo/voucher.png"/>">
								<div class="vch-discount">
									<div>Sale</div>
									<p id="vch_dis">${ it.key.vcdiscount }%</p>
								</div>
							</div>
							<div class="vch-ele-right">
								<div class="vch-ele-top">
									<div class="line1">
										Voucher&nbsp;
										<p>${ it.key.vcdiscount }%</p>
									</div>
									<div class="vch-line">
										Apply for orders from <span>$${ it.key.applyfor }</span>.
									</div>
								</div>
								<div class="vch-ele-bottom">
									<div
										class="vch-condition ${ it.key.vcdiscount }_${ it.key.code }_${ it.key.applyfor }_${ it.key.start_date }_${ it.key.end_date }"
										id="${ it.key.id }">Condition</div>
									<div class="vch-btn" id="${ it.key.id }">
										<button type="button" id="save-vch" name="savevch">Save</button>
									</div>
								</div>
							</div>
						</div>
				</c:if>
				<c:if test="${ (id+2) % 4 == 0 || (id+3) % 4 == 0}">
					<div class="vch-ele" style="margin-left: 20px;">
						<div class="vch-ele-left">
							<img alt=""
								src="<c:url value="/assets/images/logo/voucher.png"/>">
							<div class="vch-discount">
								<div>Sale</div>
								<p id="vch_dis">${ it.key.vcdiscount }%</p>
							</div>
						</div>
						<div class="vch-ele-right">
							<div class="vch-ele-top">
								<div class="line1">
									Voucher&nbsp;
									<p>${ it.key.vcdiscount }%</p>
								</div>
								<div class="vch-line">
									Apply for orders from <span>$${ it.key.applyfor }</span>.
								</div>
							</div>
							<div class="vch-ele-bottom">
								<div
									class="vch-condition ${ it.key.vcdiscount }_${ it.key.code }_${ it.key.applyfor }_${ it.key.start_date }_${ it.key.end_date }"
									id="${ it.key.id }">Condition</div>
								<div class="vch-btn" id="${ it.key.id }">
									<button type="button" id="save-vch" name="savevch">Save</button>
								</div>

							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${ (id+1) % 4 == 0 }">
					<div class="vch-ele" style="margin-left: 20px;">
						<div class="vch-ele-left">
							<img alt=""
								src="<c:url value="/assets/images/logo/voucher.png"/>">
							<div class="vch-discount">
								<div>Sale</div>
								<p id="vch_dis">${ it.key.vcdiscount }%</p>
							</div>
						</div>
						<div class="vch-ele-right">
							<div class="vch-ele-top">
								<div class="line1">
									Voucher&nbsp;
									<p>${ it.key.vcdiscount }%</p>
								</div>
								<div class="vch-line">
									Apply for orders from <span>$${ it.key.applyfor }</span>.
								</div>
							</div>
							<div class="vch-ele-bottom">
								<div
									class="vch-condition ${ it.key.vcdiscount }_${ it.key.code }_${ it.key.applyfor }_${ it.key.start_date }_${ it.key.end_date }"
									id="${ it.key.id }">Condition</div>
								<div class="vch-btn" id="${ it.key.id }">
									<button type="button" id="save-vch" name="savevch">Save</button>
								</div>
							</div>
						</div>
					</div>
		</div>
		</c:if>
		</c:forEach>
		<c:if test="${ (count+1) % 4 != 0 }">
			</div>
		</c:if>
		</div>
	</form>

	<div class="wrap-vc-details none" id="wrap-vc-details"></div>

	<div class="vc-details none" id="vc-details">
		<div class="box-details">
			<div class="box-title">
				VOUCHER&nbsp;<span id="span-discount">30%</span>
			</div>
			<div class="box-vch-code">
				Code:&nbsp;<span id="span-code">VOAUDHFA134KS</span>
			</div>
			<div class="box-content">
				Condition:
				<p>
					- Apply for orders from <span id="span-apply">$350</span>
				</p>
				<p>
					- Can only be used <b>once per customer</b>
				</p>
				<p>
					- Applies to <b>all</b> products.
				</p>
			</div>
			<div class="box-date">
				Expiry Date:
				<p>
					- Start: <span id="span-time-start">00:00</span> day <span
						id="span-date-start">24/03/2023</span>
				</p>
				<p>
					- End: <span class="end" id="span-time-end">23:59 </span> day <span
						id="span-date-end"> 25/03/2023</span>
				</p>
			</div>
			<div class="box-footer">
				<div class="box-btn">
					<button type="button" id="close" name="close">Close</button>
				</div>
				<div class="box-btn">
					<button type="button" id="save" name="save">Save</button>
				</div>
			</div>
			<input type="hidden" id="vch-id-ip">
		</div>
	</div>

	<jsp:include page="re-products-body.jsp"></jsp:include>
	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>



	<script type="text/javascript">
		$(".vch-condition").click(function() {
			var id = this.id;
			var cls = this.className;
			const arr = cls.split("_");
			if(arr.length > 4) {
				var dis = arr[0].split(" ")[1];
				var code = arr[1];
				var apply = arr[2];
				var start = arr[3];
				var start_time = start.split(" ")[1];
				var start_date = start.split(" ")[0];
				var end = arr[4];
				var end_time = end.split(" ")[1];
				var end_date = end.split(" ")[0];
				$("#span-discount").text(dis+"%");
				$("#span-code").text(code);
				$("#span-apply").text("$"+apply);
				$("#span-time-start").text(start_time.substring(0, 5));
				$("#span-date-start").text(start_date.replaceAll("-", "/"));
				$("#span-time-end").text(end_time.substring(0, 5));
				$("#span-date-end").text(end_date.replaceAll("-", "/"));
			}
			$("#wrap-vc-details").removeClass("none");
			$("#vc-details").removeClass("none");
			$("#vch-id-ip").val(id);
		});
		$("#save").click(function() {
			var id = $("#vch-id-ip").val();
			$(this).text("Saved");
		});
		$("#close").click(function() {
			$("#wrap-vc-details").addClass("none");
			$("#vc-details").addClass("none");
			return false;
		});
	</script>

	<script type="text/javascript">
		var id_user = "${ userID }";
		$(".vch-btn").click(function() {
			var id = this.id;
			var btn = $('button', this)[0];
			$(btn).text("Saved");
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "/ShopTandT/voucher/save/" + id_user + "_" + id);
			xhr.onload = function() {
			};
			xhr.send();
		});
	</script>

	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<script type="text/javascript">
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>


</body>

</html>