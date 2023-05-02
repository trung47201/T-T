<!DOCTYPE html>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<html lang="en">
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Nice to meet you</title>
<link rel="stylesheet" href="<c:url value='/assets/css/re-admin4.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-dashboard-shipper.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-nav2.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/chart2.css'/>">
<style>
* {
	font-family: "Poppins", sans-serif;
}

.green {
	color: green !important;
}

select option:hover {
	background-color: #cb82a9;
}

selecet#sl-month option:hover {
	box-shadow: 0 0 10px 100px #1882A8 inset;
}

.text-content span {
	color: darkgreen;
}

.wrapper-icon {
	display: flex;
	width: 65%;
}

.text-btn button {
	background: #cb82a9;
	color: white;
}

p#profile-report-name {
	margin-top: 10px; 
} 
.profile-report-chart {
    margin-top: 20px;
}
p#percent-revenue {
	margin-top: 24px;
}
</style>

<body>
	<%
	if (session.getAttribute("shipperID") == null) {
		response.sendRedirect("/ShopTandT/shipper/login");
	}
	%>
	<div class="admin-body">
		<jsp:include page="../layouts/shipper/s-nav.jsp"></jsp:include>
		<section>
			<jsp:include page="../layouts/shipper/s-header.jsp"></jsp:include>
			<div class="section-dashboard">
				<div class="dashboard-table">
					<div class="db-row1">
						<div class="wrapoer-row">
							<div class="text">
								<div class="text-title">
									<p>Congratulations ${ user.firstname }!</p>
									<div>
										<img alt=""
											src="<c:url value='/assets/images/icons/icons8-confetti-94.png'/>">
									</div>
								</div>
								<div class="text-content">
									<p>
										You have accomplished <span><b>${ percentofday }%</b></span>
										of your goal today. Check your new badge in your profile.
									</p>
								</div>
								<div class="text-btn">
									<a href="/ShopTandT/shipper/order-management"><button>View
											Orders</button></a>
								</div>
							</div>
							<div class="img">
								<img alt=""
									src="<c:url value='/assets/images/poster/man-with-laptop-light.png'/>">
							</div>
						</div>
					</div>
					<div class="db-row2">
						<div class="dashboard-col">
							<div class="dashboard-row-1">
								<div class="dashboard-row-top">
									<div class="dashboard-col-icon icon-customer">
										<div class="wrapper-icon">
											<img
												src="<c:url value="/assets/images/icons/icons8-purchase-order-96-month.png"/>"
												alt="images-order">
										</div>
									</div>
									<div class="dashboard-col-text">
										<div class="dashboard-row-parameter">
											<p>+${ orderofmonth }</p>
										</div>
									</div>
								</div>
								<div class="dashboard-row-title">
									<p>Month's Order</p>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="dashboard-row-2">
								<div class="compare">
									<p>
										<c:if test="${ percentrevenue >= 0}">
											<span class="green">+${ percentrevenue }%</span> than yesterday
										</c:if>
										<c:if test="${ percentrevenue < 0}">
											<span class="red">${ percentrevenue }%</span> than yesterday
										</c:if>
									</p>
								</div>
							</div>
						</div>
						<div class="dashboard-col">
							<div class="dashboard-row-1">
								<div class="dashboard-row-top">
									<div class="dashboard-col-icon icon-order">
										<div class="wrapper-icon-order">
											<img
												src="<c:url value="/assets/images/icons/icons8-purchase-order-96.png"/>"
												alt="images-order">
										</div>
									</div>
									<div class="dashboard-col-text">
										<div class="dashboard-row-parameter">
											<p>+${ orderofday }</p>
										</div>
									</div>
								</div>
								<div class="dashboard-row-title">
									<p>Today's Order</p>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="dashboard-row-2">
								<div class="compare">
									<p>
										<c:if test="${ percentorderofday >= 0}">
											<span class="green">+${ percentorderofday }%</span> than yesterday
										</c:if>
										<c:if test="${ percentorderofday < 0}">
											<span class="red">${ percentorderofday }%</span> than yesterday
										</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="infor-table">
					<div class="table-row">
						<div class="table-col col2">
							<div class="table-chart">
								<div class="chart-title">Total Revenue</div>
								<div class="chart-row color-green" id="chart-revenue">
									<div class="chart">
										<canvas id="chart-line" class="chart-canvas" height="170"></canvas>
									</div>
								</div>
							</div>
							<div class="growth">
								<select id="sl-month">
									<option value="1">Jan</option>
									<option value="2">Feb</option>
								</select>
								<div class="growth-chart">
									<div class="example">
										<div class="example-figure">
											<div class="progress progress-2"></div>
										</div>
									</div>
								</div>
								<div class="bottom-growth">
									<div class="revenue-month">
										<div class="growth-revenue this-month">
											<img
												src="<c:url value="/assets/images/icons/icons8-stocks-growth-48.png"/>"
												alt="images-order">
										</div>
										<div class="growth-chart-content">
											<h4>Currently</h4>
											<p id="revenue-price">$32.5k</p>
										</div>
									</div>
									<div class="revenue-month">
										<div class="growth-revenue not-this-month">
											<img
												src="<c:url value="/assets/images/icons/icons8-banknotes-60.png"/>"
												alt="images-order">
										</div>
										<div class="growth-chart-content">
											<h4>Jan</h4>
											<p id="revenue-price">$32.5k</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="parameter-revenue">
							<div class="db-row">
								<!-- USER -->
								<div class="dashboard-col">
									<div class="dashboard-row-1">
										<div class="dashboard-row-top">
											<div class="dashboard-col-icon">
												<div class="wrapper-icon">
													<img
														src="<c:url value="/assets/images/icons/icons8-sales-balance-100.png"/>"
														alt="images-order">
												</div>
											</div>
											<div class="dashboard-col-text">
												<div class="dashboard-row-parameter">
													<p>$${ revenueofmonth }</p>
												</div>
											</div>
										</div>
										<div class="dashboard-row-title">
											<p>Month's Revenue</p>
										</div>
									</div>
									<hr class="shadow-hr">
									<div class="dashboard-row-2">
										<div class="compare">
											<p>
												<c:if test="${ percentuser >= 0}">
													<span class="green">+${ percentuser }%</span> than yesterday
												</c:if>
												<c:if test="${ percentuser < 0}">
													<span class="red">${ percentuser }%</span> than yesterday
												</c:if>
											</p>
										</div>
									</div>
								</div>
								<div class="dashboard-col">
									<div class="dashboard-row-1">
										<div class="dashboard-row-top">
											<div class="dashboard-col-icon icon-revenue">
												<div class="wrapper-icon">
													<img
														src="<c:url value="/assets/images/icons/icons8-revenue-64.png"/>"
														alt="images-order">
												</div>
											</div>
											<div class="dashboard-col-text">
												<div class="dashboard-row-parameter">
													<p>$${ revenueofday }</p>
												</div>
											</div>
										</div>
										<div class="dashboard-row-title">
											<p>Today's Revenue</p>
										</div>
									</div>
									<hr class="shadow-hr">
									<div class="dashboard-row-2">
										<div class="compare">
											<p>
												<c:if test="${ percentrevenueofday >= 0 }">
													<span class="green">+${ percentrevenueofday }%</span> than yesterday
												</c:if>
												<c:if test="${ percentrevenueofday < 0 }">
													<span class="red">${ percentrevenueofday }%</span> than yesterday
												</c:if>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="profile-report">
								<div class="profile-report-left">
									<p id="profile-report-title">Weekly Statistics</p>
									<p id="profile-report-name">REVENUE</p>
									<p id="percent-revenue">
										<img
											src="<c:url value="/assets/images/icons/icons8-up-64.png"/>"
											alt="up">68%
									</p>
									<p id="total-revenue">$302.5</p>
								</div>
								<div class="profile-report-right">
									<div class="profile-report-chart">
										<div class="chart" id="chart-revenue-my">
											<canvas id="myChart-revenue" height="170"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../layouts/shipper/s-footer.jsp"></jsp:include>
			</div>
		</section>
	</div>

	<div class="message msg-order none">
		<h2>Message</h2>
		<p class="content-msg"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" type="button" value="Cancel"> <input
				class="ok hover-btn" type="button" value="OK">
		</div>
	</div>

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="<c:url value="assets/js/chartjs.min.js"/>"></script>


	<script> // chart revenue -> month
		var ctx2 = document.getElementById("chart-line").getContext("2d");
		new Chart(ctx2, {
			type : "bar",
			data : {
				labels : ${ listmonthname },
				datasets : [ {
					label : "$",
					tension : 0,
					borderWidth : 5,
					pointRadius : 5,
					pointBackgroundColor : "#555",
					pointBorderColor : "#cb82a9",
					borderColor : "white",
					borderColor : "white",
					hoverBorderColor : "white",
					backgroundColor : "#cb82a9",
					fill : true,
					data : ${ listrevenueofmonth },
					maxBarThickness : 50

				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							color : 'lightgray'
							
						},
						ticks : {
							display : true,
							color : '#555',
							padding : 10,
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
						},
						ticks : {
							display : true,
							color : '#555',
							padding : 10,
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
				},
			},
		});
	</script>


	<script> //daily order
		var ctx_re = document.getElementById("myChart-revenue").getContext('2d');
		var myChart_re = new Chart(ctx_re, {
			type : "line",
			data : {
				labels : ${ listdayname },
				datasets : [ {
					label : "Order",
					tension : 0,
					borderWidth : 0,
					pointRadius : 5,
					pointBackgroundColor : "#cb82a9",
					pointBorderColor : "#f9e1ee",
					borderColor : "#cb82a9",
					borderWidth : 4,
					backgroundColor : "transparent",
					fill : true,
					data : ${ listrevenueofweek },
					maxBarThickness : 6
				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : false,
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : false,
						}
					},
				},
			},
		});
	</script>

	<script src="<c:url value="/assets/js/circle-progress.js"/>"></script>

	<script>
		var ts = 60;
		var options = [
			{ max: 100, value: ts, textFormat: 'percent' },
		];
		options.forEach(function (opts, i) {
			var exampleEl = document.querySelector('.example:nth-child(' + (i + 1) + ')');
			new CircleProgress(exampleEl.querySelector('.progress'), opts);
			var optsStr = '{\n';
			for (var name in opts) {
				var value = opts[name];
				if (typeof value === 'string') {
					value = '\'' + value + '\'';
				}
				optsStr += '\t' + name + ': ' + value + ',\n';
			}
			optsStr += '}';
		});
	</script>

</body>

</html>


<!-- 	// push value into data in chart bars
		const pushvalue = document.getElementById("pushvalue");
		const push = document.getElementById("push");

		push.addEventListener('click', pushValueCharts);
		function pushValueCharts() {
			console.log(myChartBars.data.datasets[0].data);
			myChartBars.data.datasets[0].data.push(pushvalue.value);
			myChartBars.update();
		}
 -->