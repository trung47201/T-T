<!DOCTYPE html>
<html lang="en">
<title>Don't shopping, don't lose money? :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href='<c:url value="/assets/css/bootstrap.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/js/bootstrap.js"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/index.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/login-icon.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/bootstrap.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/js/bootstrap.min.js"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/login.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/swiper-bundle.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/products_c.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/add-to-cart.css"/>'>
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/view_order.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/navscroll.css"/>">
<style>
.ok-btn button {
    border: 1px solid;
    background: #0086ff;
    color: white;
    font-size: 20px;
    box-shadow: 0 0 5px #666;
}
.welcome {
    box-shadow: 0px 5px 15px;
}
</style>
<body style="color: white;">
<c:set var="id_user" value="${ userID }"></c:set>
	<header class="container-xl header-content">
		<form method="post">
			<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
			<div class="title-page">
                <h3>ORDER</h3>
                <span><a href="/SpringMVC">Home</a> / <a href="">Order</a></span>
            </div>
            <!-- ######################################################################################################################################### -->
                <div class="order">
                    <c:forEach var="liOrder" items="${ listOrder }">
                    	<div class="list-order">
                        <div class="order-form">
                            <div class="order-form-hearder">
                                <div class="order-code">
                                    <h5>INVOICE <span>#${ liOrder.bill }</span></h5>
                                </div>
                                <div class="order-infor">
                                    <div>
                                        <a href="/SpringMVC/order-details/${ id_user }_${ liOrder.id }">View Details ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <c:forEach var="liOrder_detalis" items="${ listOrder_detalis }">
                        	<c:if test="${ liOrder.id == liOrder_detalis.order_.id }">
                        		<div class="order-list-product">
		                            <div class="product-ele">
		                                <div class="img">
		                                    <img src="<c:url value="/assets/images/products/${ liOrder_detalis.prod.thumbnail }"/>" alt="">
		                                </div>
		                                <div class="title">
		                                    <div class="form-prod-col2">
		                                        <h5>${ liOrder_detalis.prod.title }</h5>
		                                        <p>${ liOrder_detalis.color.color_name } - ${ liOrder_detalis.size.size_number }</p>
		                                    </div>
		                                    <div class="form-prod-col3">
		                                        <div class="row1">
		                                            <p>x${ liOrder_detalis.quantity }</p>
		                                        </div>
		                                        <div class="row2">
		                                            <h5>$${ liOrder_detalis.price_at }</h5>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
                        	</c:if>
                        </c:forEach>
                    </div>
                    </c:forEach>
                </div>
		</form>
	</header>
	<jsp:include page="../layouts/user/footer.jsp"></jsp:include>

	<jsp:include page="../layouts/user/search.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		 $(".form-check-input").click(function(){
			 var rememberme = this.checked;
			 alert(rememberme);
			  var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/home?rememberme="+rememberme);
				// What to do when server responds
				xhr.onload = function() {
					//window.location.assign("http://localhost:8888/SpringMVC/");
				};
				xhr.send();
		  });
		  
	});
	</script>
	<script>
	
	function logout() {
		$(document).ready(function(){
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"http://localhost:8888/SpringMVC/home?logout=true");
			// What to do when server responds
			xhr.onload = function() {
				window.location.assign("http://localhost:8888/SpringMVC/");
			};
			xhr.send();
		});
	}
	</script>
	<script>
		$(document).ready(function(){
		  $(".dropdown-toggle").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		  $(".dropdown-item").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		  $(".img-dropdown-menu").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		});
	</script>
	<script>
		if(${userID == null }) {
			$(document).ready(function() {
				if(${message != "logout"}) {
					$('#login').modal('toggle');
				}
			});
		}
	</script>
	<script type="text/javascript">
	
	if(${ message != null }) {
		if(${message == "true"}) {
			alert("Welcome to Ti Shoes!");
		} else if(${message == "false"}){
			alert("Login unsuccess!");
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
		} else if(${message == "logout"}) {
			alert("Looking forward to seeing you again soon!");
		} else if(${message == "block"}){
			alert("Your account has been locked, please contact hotline: 0346 643 755 for more details!");
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
		}
	}
		function login() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			if (username=="" || password=="") {
				alert("Username or password is empty");
			} else {
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/home?username="
								+ username +"&password="+password);
				// What to do when server responds
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/");
				};
				xhr.send();
			}
			
		}
		
	</script>
	<script>
		function test($a) {
			for (let i = 1; i <= 10; i++) {
				if (i == $a) {
					var span_Text = document.getElementById("span_Id" + $a).innerText;
					document.querySelector('input[name="search"]').value = span_Text;
				}
			}
		}
	</script>

	<script type="text/javascript">
		window.addEventListener("scroll", function() {
			var div = document.getElementById('nav-search');
			var div1 = document.getElementsByClassName('hidden-poster2');
			if (window.scrollY > 80) {
				div.style.visibility = 'visible';
			} else {
				div.style.visibility = 'hidden';
			}
			if (window.scrollY > 2280 && window.scrollY < 2380) {
				div1.style.visibility = 'hidden';
			} else {
				div1.style.visibility = 'visible';
			}
		})
	</script>

	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"/>"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"/>"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="<c:url value="js/login.js"/>"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"/>"></script>
	<script
		src="<c:url value="https://kit.fontawesome.com/a076d05399.js"/>"></script>

</body>

</html>