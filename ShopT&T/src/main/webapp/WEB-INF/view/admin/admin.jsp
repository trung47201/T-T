<!DOCTYPE html>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<html lang="en">
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Admin :) ?</title>
<link rel="stylesheet" href="<c:url value='/assets/css/re-admin4.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-dashboard3.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-nav2.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/chart2.css'/>">
<style>
.green {
	color: green !important;
}
 select option:hover{background-color: #cb82a9;}
 selecet#sl-month option:hover {
	 box-shadow: 0 0 10px 100px #1882A8 inset;
}
 
</style>

<body>
	<%
	if (session.getAttribute("adminID") == null) {
		response.sendRedirect("/ShopTandT/login");
	}
	%>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>
		<section>
			<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
			<div class="section-dashboard">
				<div class="dashboard-table">
					<div class="db-row1">
						<div class="wrapoer-row">
							<div class="text">
								<div class="text-title">
									<p>Congratulations John!</p>
									<div>
										<img alt=""
											src="<c:url value='/assets/images/icons/icons8-confetti-94.png'/>">
									</div>
								</div>
								<div class="text-content">
									<p>You have done 72% more sales today. Check your new badge
										in your profile.</p>
								</div>
								<div class="text-btn">
									<button>View Orders</button>
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
								<div class="dashboard-col-icon icon-revenue">
									<div class="wrapper-icon">
										<img
											src="<c:url value="/assets/images/icons/icons8-sales-performance-100.png"/>"
											alt="images-order">
									</div>
								</div>
								<div class="dashboard-col-text">
									<div class="dashboard-row-title">
										<p>Today's Revenue</p>
									</div>
									<div class="dashboard-row-parameter">
										<p>
											$
											<fmt:formatNumber type="number" maxFractionDigits="2"
												value="${ revenueofday }" />
										</p>
									</div>
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
								<div class="dashboard-col-icon icon-order">
									<div class="wrapper-icon">
										<img
											src="<c:url value="/assets/images/icons/icons8-delivered-100.png"/>"
											alt="images-order">
									</div>
								</div>
								<div class="dashboard-col-text">
									<div class="dashboard-row-title">
										<p>Today's Order</p>
									</div>
									<div class="dashboard-row-parameter">
										<p>+${ orderofday }</p>
									</div>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="dashboard-row-2">
								<div class="compare">
									<p>
										<c:if test="${ percentorder >= 0}">
											<span class="green">+${ percentorder }%</span> than yesterday
										</c:if>
										<c:if test="${ percentorder < 0}">
											<span class="red">${ percentorder }%</span> than yesterday
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
											<h4>This</h4>
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
						<div>
						
						</div>
					</div>
				</div>

				<div class="chart-table">
					<div class="chart-col chart-order">
						<div class="chart-row">
							<div class="chart">
								<canvas id="chart-bars" class="chart-canvas" height="170"></canvas>
							</div>
						</div>
						<div class="chart-row-1">
							<div class="text-row">
								<div class="title-row">
									<p>Daily Sales</p>
								</div>
								<div class="content">
									<p>
										<b>(+15%)</b> increase in today sales.
									</p>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="schedule">
								<div class="schedule-img">
									<img
										src="<c:url value="/assets/images/icons/icons8-time-machine-48.png"/>"
										alt="icon-history">
								</div>
								<c:if test="${ orderDays != null }">
									<p>Updated ${ orderDays } days ago</p>
								</c:if>
								<c:if test="${ orderHours != null }">
									<p>Updated ${ orderHours } hours ago</p>
								</c:if>
								<c:if test="${ orderMinute != null }">
									<p>Updated ${ orderMinute } minute ago</p>
								</c:if>
								<c:if test="${ orderSeconds != null }">
									<p>Updated ${ orderSeconds } seconds ago</p>
								</c:if>
								<c:if test="${ orderJust != null }">
									<p>Just updated</p>
								</c:if>
							</div>
						</div>
					</div>
					<div class="table-col col1">
							<div class="wrapper-chart-tbl">
								<canvas id="myChart"></canvas>
							</div>
					</div>
					<div class="chart-col" id=chart-view>
						<div class="chart-row color-black">
							<div class="chart">
								<canvas id="chart-line-tasks" class="chart-canvas" height="170"></canvas>
							</div>
						</div>
						<div class="chart-row-1">
							<div class="text-row">
								<div class="title-row">
									<p>Website Views</p>
								</div>
								<div class="content">
									<p>Last Campaign Performance</p>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="schedule">
								<div class="schedule-img">
									<img
										src="<c:url value="/assets/images/icons/icons8-time-machine-48.png"/>"
										alt="icon-history">
								</div>
								<p>Just updated</p>
							</div>
						</div>
					</div>
				</div>


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

	<script>
		var yValues = [ 1, 1, 1, 1 ];
		var barColors = [ "#1a73e8", "#43a047", "#DA2868", "#191919" ];

		new Chart("myChart", {
			type : "pie",
			data : {
				datasets : [ {
					backgroundColor : barColors,
					data : yValues
				} ]
			},
			options : {
				title : {
					display : true,
					text : "World Wide Wine Production 2023"
				}
			}
		});
	</script>

	<script>
		var ctx = document.getElementById("chart-bars").getContext("2d");
		const myChartBars = new Chart(ctx, {
			type : "bar",
			data : {
				labels : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"  ],
				datasets : [ {
					label : "Sales",
					tension : 0.6,
					borderWidth : 0,
					borderRadius : 4,
					borderSkipped : false,
					backgroundColor : "rgba(255, 255, 255, .8)",
					data : [-10, 20, 10, 15, 5, 0, 0], //${ listorderofweek }
					maxBarThickness : 6
				}, ],
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
							borderDash : [ 5, 5 ],
							color : 'rgba(255, 255, 255, .2)'
						},
						ticks : {
							suggestedMin : 0,
							suggestedMax : 500,
							beginAtZero : true,
							padding : 10,
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
							color : "#fff"
						},
					},
					x : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ],
							color : 'rgba(255, 255, 255, .2)'
						},
						ticks : {
							display : true,
							color : '#f8f9fa',
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
		
		var ctx2 = document.getElementById("chart-line").getContext("2d");
		new Chart(ctx2, {
			type : "bar",
			data : {
				labels : ${ listmonthname },
				datasets : [ {
					label : "Revenues",
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

		var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");
		new Chart(ctx3, {
			type : "line",
			data : {
				labels : [ "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
						"Nov", "Dec" ],
				datasets : [ {
					label : "Mobile apps",
					tension : 0,
					borderWidth : 0,
					pointRadius : 5,
					pointBackgroundColor : "rgba(255, 255, 255, .8)",
					pointBorderColor : "transparent",
					borderColor : "rgba(255, 255, 255, .8)",
					borderWidth : 4,
					backgroundColor : "transparent",
					fill : true,
					data : [ 50, 40, 300, 220, 500, 250, 400, 230, 500 ],
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
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ],
							color : 'rgba(255, 255, 255, .2)'
						},
						ticks : {
							display : true,
							padding : 10,
							color : '#f8f9fa',
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
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							color : '#f8f9fa',
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


	<script>
		$('.other').click(function() {
			$(".other-menu").removeClass("none", 10000, "easeInBack");
		});
	</script>

	<script>
		var arrSec = document.getElementsByTagName("section");
		$(document).ready(function() {
			$(".sub-menu-ul").click(function() {
				window.location.href = this.id;
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			$(".admin-menu-icon").click(function() {
				$(".navigation").toggle("none");
			});
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