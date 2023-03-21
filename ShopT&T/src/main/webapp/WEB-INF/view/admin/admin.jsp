<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Admin :) ?</title>
<link rel="stylesheet" href="<c:url value='/assets/css/admin.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-login.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/dashboard.css'/>">

<style>
#msg-login-admin {
	color: red;
	text-align: center;
	font-size: 13px;
}
.green {
color: green !important;
}
</style>

<body>
	<jsp:include page="../layouts/admin/login.jsp"></jsp:include>

	<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>
		<section>
			<div class="section-dashboard">
				<div class="dashboard-table">
					<div class="db-row">
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
										<p>$<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${ revenueofday }" /></p>
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
					<!-- USER -->
					<div class="db-row">
						<div class="dashboard-col">
							<div class="dashboard-row-1">
								<div class="dashboard-col-icon icon-customer">
									<div class="wrapper-icon">
										<img
											src="<c:url value="/assets/images/icons/icons8-customer-64-db.png"/>"
											alt="images-order">
									</div>
								</div>
								<div class="dashboard-col-text">
									<div class="dashboard-row-title">
										<p>New Customer</p>
									</div>
									<div class="dashboard-row-parameter">
										<p>+${ userofday }</p>
									</div>
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
								<div class="dashboard-col-icon">
									<div class="wrapper-icon">
										<img
											src="<c:url value="/assets/images/icons/icons8-sales-performance-100.png"/>"
											alt="images-order">
									</div>
								</div>
								<div class="dashboard-col-text">
									<div class="dashboard-row-title">
										<p>Month's Revenue</p>
									</div>
									<div class="dashboard-row-parameter">
										<p>$${ revenueofmonth }</p>
									</div>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="dashboard-row-2">
								<div class="compare">
									<p>
										<c:if test="${ percentrevenuemonth >= 0 }">
											<span class="green">+${ percentrevenuemonth }%</span> than last month
										</c:if>
										<c:if test="${ percentrevenuemonth < 0 }">
											<span class="red">${ percentrevenuemonth }%</span> than last month
										</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="chart-table">
					<div class="chart-col">
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
					<div class="chart-col">
						<div class="chart-row color-green">
							<div class="chart">
								<canvas id="chart-line" class="chart-canvas" height="170"></canvas>
							</div>
						</div>
						<div class="chart-row-1">
							<div class="text-row">
								<div class="title-row">
									<p>Revenue</p>
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
								<c:if test="${ revenueDays != null }">
									<p>Campaign sent ${ revenueDays } days ago</p>
								</c:if>
								<c:if test="${ revenueHours != null }">
									<p>Campaign sent ${ revenueHours } hours ago</p>
								</c:if>
								<c:if test="${ revenueMinute != null }">
									<p>Campaign sent ${ revenueMinute } minute ago</p>
								</c:if>
								<c:if test="${ revenueSeconds != null }">
									<p>Campaign sent ${ revenueSeconds } seconds ago</p>
								</c:if>
								<c:if test="${ revenueJust != null }">
									<p>Just updated</p>
								</c:if>
							</div>
						</div>
					</div>
					<div class="chart-col">
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
				
				<div class="infor-table">
					<div class="table-row">
						<div class="table-col col2"></div>
						<div class="table-col col1">
							<canvas id="myChart"></canvas>
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

	<script type="text/javascript">
	$('#password').keydown(function(event) {
	    // enter has keyCode = 13, change it if you want to use another button
	    if (event.keyCode == 13) {
	      	this.form.submit();
	      	return false;
	    }
	});
	</script>

	<c:if test="${ sessionScope.login == false}">
		<script type="text/javascript">
			$("#msg-login-admin").removeClass("none");
			$("#msg-login-admin").text("User name or password is not correct!");
		</script>
	</c:if>

	<script type="text/javascript">
		function login() {
			var username = $("#username").val();
			var password = $("#password").val();
			if (username == "") {
				$("#msg-login-admin").removeClass("none");
				$("#msg-login-admin").text("User name is empty!");
			} else if (password == "") {
				$("#msg-login-admin").removeClass("none");
				$("#msg-login-admin").text("Password is empty!");
			} else {
				 $('#my_form').attr('action', '/SpringMVC/admin/login');
				 document.getElementById('my_form').submit();
			}
		}
	</script>

	<script>
		var xValues = [ "Italy", "France", "Spain", "USA" ];
		var yValues = [ 70, 49, 44, 14 ];
		var barColors = [ "#1a73e8", "#43a047", "#DA2868", "#191919" ];

		new Chart("myChart", {
			type : "pie",
			data : {
				labels : xValues,
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
					data : ${ listorderofweek },
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
			type : "line",
			data : {
				labels : ${ listmonthname },
				datasets : [ {
					label : "Mobile apps",
					tension : 0,
					borderWidth : 0,
					pointRadius : 5,
					pointBackgroundColor : "rgba(255, 255, 255, .8)",
					pointBorderColor : "transparent",
					borderColor : "rgba(255, 255, 255, .8)",
					borderColor : "rgba(255, 255, 255, .8)",
					borderWidth : 4,
					backgroundColor : "transparent",
					fill : true,
					data : ${ listrevenueofmonth },
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
	<script>
		var arrDiv = document.getElementsByClassName("menu");
		var arrP = document.getElementsByClassName("dropdown-menu");
		$(document).ready(function() {
			$(".menu").click(function() {
				var classSubMenu = "." + this.id;
				$(classSubMenu).toggle("none");
				for (let i = 0; i < arrP.length; i++) {
					if (arrP[i].className.includes(this.id)) {
						$(arrP[i]).toggleClass("rotate");
					}
				}
			});
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