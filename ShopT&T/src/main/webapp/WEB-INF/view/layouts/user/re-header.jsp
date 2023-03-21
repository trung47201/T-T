<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<header>
	<div class="top-nav">
		<div class="title-nav">
			<p>Free Shipping On Orders Over $100 or In-Store Pick Up
				Available.</p>
		</div>

		<div class="login-signup">
			<a href="#">Login</a> / <a href="#">Sign Up</a>
		</div>
	</div>
	<!--########################################3   START NAVIGATION ###########################################-->
	<div class="nav-c">
		<div class="wrapper-nav">
			<div class="nav-left">
				<ul>
					<li class="link"><a href="">NEW ARRIVALS</a></li>
					<li class="link"><a href="">CLOTHINGS</a></li>
					<li class="link"><a href="">GIFTS</a></li>
					<li class="link"><a href="">SHOES</a></li>
				</ul>
			</div>
			<div class="nav-middle">
				<div class="nav-mid-img">
					<img id="re-logo" alt="" src="<c:url value="/assets/images/logo/Thnk.png"/>">
				</div>
			</div>
			<div class="nav-left">
				<ul>
					<li class="link"><a href="">JEWELRY</a></li>
					<li class="link"><a href="">HANDBAGS</a></li>
					<li class="link"><a href="">ACCESSORIES</a></li>
					<li>
						<div class="nav-btn">
							<div>
								<i class="fa fa-search" aria-hidden="true"></i>
							</div>
							<div >
								<i class="fa fa-shopping-bag" aria-hidden="true"></i>
							</div>
							<div class="btn-menu" id="btn-menu">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>


<script type="text/javascript">
	$("#btn-menu").click(function() {
		$("#menu").css("width", 350+"px");
	});
</script>

<script type="text/javascript">
window.addEventListener("scroll", (event) => {
    let scroll = this.scrollY;
    if(scroll >= 20) {
    	document.getElementById("re-logo").style.width = "80px";
    	$(".nav-mid-img").css({top: 40, left: $('.top-nav').width()/2-40+"px", position:'absolute'});
    } else {
    	document.getElementById("re-logo").style.width = "160px";
    	$(".nav-mid-img").css({top: 30, left: $('.top-nav').width()/2-80+"px", position:'absolute'});
    }
});
</script>
