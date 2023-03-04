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
										<p>$53k</p>
									</div>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="dashboard-row-2">
								<div class="compare">
									<p>
										<span class="green">+55%</span> than yesterday
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
										<p>$53k</p>
									</div>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="dashboard-row-2">
								<div class="compare">
									<p>
										<span class="green">+55%</span> than yesterday
									</p>
								</div>
							</div>
						</div>
					</div>
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
										<p>Today's Customer</p>
									</div>
									<div class="dashboard-row-parameter">
										<p>$53k</p>
									</div>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="dashboard-row-2">
								<div class="compare">
									<p>
										<span class="green">+55%</span> than yesterday
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
										<p>Today's Money</p>
									</div>
									<div class="dashboard-row-parameter">
										<p>$53k</p>
									</div>
								</div>
							</div>
							<hr class="shadow-hr">
							<div class="dashboard-row-2">
								<div class="compare">
									<p>
										<span class="green">+55%</span> than yesterday
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
								<p>Campaign sent 2 days ago</p>
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
								<p>Campaign sent 2 days ago</p>
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
								<p>Campaign sent 2 days ago</p>
							</div>
						</div>
					</div>
				</div>
				
				 <div class="infor-table">
			        <div class="table-row">
			            <div class="table-col col2">
			
			            </div>
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
	
	<script>
        var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
        var yValues = [55, 49, 44, 24, 15];
        var barColors = [
            "#b91d47",
            "#00aba9",
            "#2b5797",
            "#e8c3b9",
            "#1e7145"
        ];

        new Chart("myChart", {
            type: "pie",
            data: {
                labels: xValues,
                datasets: [{
                    backgroundColor: barColors,
                    data: yValues
                }]
            },
            options: {
                title: {
                    display: true,
                    text: "World Wide Wine Production 2018"
                }
            }
        });
    </script>
    
	<script>
		var ctx = document.getElementById("chart-bars").getContext("2d");
		new Chart(ctx, {
			type : "bar",
			data : {
				labels : [ "M", "T", "W", "T", "F", "S", "S" ],
				datasets : [ {
					label : "Sales",
					tension : 0.4,
					borderWidth : 0,
					borderRadius : 4,
					borderSkipped : false,
					backgroundColor : "rgba(255, 255, 255, .8)",
					data : [ 50, 20, 10, 22, 50, 10, 40 ],
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
					borderColor : "rgba(255, 255, 255, .8)",
					borderWidth : 4,
					backgroundColor : "transparent",
					fill : true,
					data : [ 50, 40, 300, 320, 500, 350, 200, 230, 500 ],
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