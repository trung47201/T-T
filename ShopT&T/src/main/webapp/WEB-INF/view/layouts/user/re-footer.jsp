<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<hr style="padding: 20px; border: 0; background: #f9e1ee;">
<div class="section-2">
	<div class="text-effect">
		<h2>POSTS</h2>
		<h2>POSTS</h2>
	</div>
	<c:forEach var="hPosts" items="${ hmPosts }" varStatus="idx">
		<c:forEach var="liPosts" items="${ hPosts.value }" varStatus="i">
			<c:set var="index" value="${ i.getIndex() }"></c:set>
			<c:if test="${ index % 5 ==0 && index < 20}">
				<c:if test="${ hPosts.key == 1 }">
					<div class="list-view" id="${ hPosts.key }">
				</c:if>
				<c:if test="${ hPosts.key != 1 }">
					<div class="list-view importantNone" id="${ hPosts.key }">
				</c:if>
				<div class="list-view-ele" id="${ liPosts.id }">
					<div class="view-img">
						<c:if test="${ liPosts.type == 1 }">
							<div class="camera-img">
								<img alt=""
									src="<c:url value="/assets/images/icons/icons8-video-camera-64.png"/>">
							</div>
						</c:if>
						<div class="opacity-ele importantNone" id="opacity">
							<div class="nothing"></div>
						</div>
						<div class="ins-img importantNone" id="ins-img">
							<a href="#"> <i class="fab fa-instagram" aria-hidden="true"></i></a>
						</div>
						<img alt=""
							src="<c:url value="/assets/images/posts/${ liPosts.img }"/>">
					</div>
				</div>
				<div class="view-details importantNone"
					id="view-details${ liPosts.id }">
					<div class="wrapper-view">
						<div class="view-details-img">
							<c:if test="${ liPosts.type == 0 }">
								<img alt=""
									src="<c:url value="/assets/images/posts/${ liPosts.img }"/>">
							</c:if>
							<c:if test="${ liPosts.type == 1 }">
								<video controls="controls">
									<source
										src="<c:url value="/assets/images/posts/${ liPosts.video }"/>"
										type="video/mp4">
								</video>
							</c:if>
						</div>
						<div class="view-details-content">
							<div class="url-ins">
								<a href="${ liPosts.url }"> <img alt=""
									src="<c:url value="/assets/images/icons/icons8-external-link-52.png"/>">
									View on Instagram
								</a>
								<div class="close-view-posts">
									<i class="fa fa-times" aria-hidden="true" id="close-view-posts"></i>
								</div>
							</div>
							<div class="view-content">${ liPosts.content }</div>
							<!-- <div class="buy-add-prod">
									<div class="location-btn">
										<div class="add-btn">
											<button>Add to cart</button>
										</div>
										<div class="buy-btn">
											<button>Buy it</button>
										</div>
									</div>								
								</div> -->
						</div>
					</div>
					<div class="opacity-view" id="opacity-view"></div>
				</div>
			</c:if>
			<c:if
				test="${ ((index+4) % 5 ==0 || (index+2) % 5 ==0 || (index+3) % 5 ==0)  && index < 20 }">
				<div class="list-view-ele" id="${ liPosts.id }">
					<div class="view-img">
						<c:if test="${ liPosts.type == 1 }">
							<div class="camera-img">
								<img alt=""
									src="<c:url value="/assets/images/icons/icons8-video-camera-64.png"/>">
							</div>
						</c:if>
						<div class="opacity-ele importantNone" id="opacity">
							<div class="nothing"></div>
						</div>
						<div class="ins-img importantNone" id="ins-img">
							<a href="#"> <i class="fab fa-instagram" aria-hidden="true"></i></a>
						</div>
						<img alt=""
							src="<c:url value="/assets/images/posts/${ liPosts.img }"/>">
					</div>
				</div>
				<div class="view-details importantNone"
					id="view-details${ liPosts.id }">
					<div class="wrapper-view">
						<div class="view-details-img">
							<c:if test="${ liPosts.type == 0 }">
								<img alt=""
									src="<c:url value="/assets/images/posts/${ liPosts.img }"/>">
							</c:if>
							<c:if test="${ liPosts.type == 1 }">
								<video controls="controls">
									<source
										src="<c:url value="/assets/images/posts/${ liPosts.video }"/>"
										type="video/mp4">
								</video>
							</c:if>
						</div>
						<div class="view-details-content">
							<div class="url-ins">
								<a href="${ liPosts.url }"> <img alt=""
									src="<c:url value="/assets/images/icons/icons8-external-link-52.png"/>">
									View on Instagram
								</a>
								<div class="close-view-posts">
									<i class="fa fa-times" aria-hidden="true" id="close-view-posts"></i>
								</div>
							</div>
							<div class="view-content">${ liPosts.content }</div>
							<!-- <div class="buy-add-prod">
									<div class="location-btn">
										<div class="add-btn">
											<button>Add to cart</button>
										</div>
										<div class="buy-btn">
											<button>Buy it</button>
										</div>
									</div>								
								</div> -->
						</div>
					</div>
					<div class="opacity-view" id="opacity-view"></div>
				</div>
			</c:if>
			<c:if test="${ (index+1) % 5 ==0  && index < 20 }">
				<div class="list-view-ele" id="${ liPosts.id }">
					<div class="view-img">
						<c:if test="${ liPosts.type == 1 }">
							<div class="camera-img">
								<img alt=""
									src="<c:url value="/assets/images/icons/icons8-video-camera-64.png"/>">
							</div>
						</c:if>
						<div class="opacity-ele importantNone" id="opacity">
							<div class="nothing"></div>
						</div>
						<div class="ins-img importantNone" id="ins-img">
							<a href="#"> <i class="fab fa-instagram" aria-hidden="true"></i></a>
						</div>
						<img alt=""
							src="<c:url value="/assets/images/posts/${ liPosts.img }"/>">
					</div>
				</div>
				<div class="view-details importantNone"
					id="view-details${ liPosts.id }">
					<div class="wrapper-view">
						<div class="view-details-img">
							<c:if test="${ liPosts.type == 0 }">
								<img alt=""
									src="<c:url value="/assets/images/posts/${ liPosts.img }"/>">
							</c:if>
							<c:if test="${ liPosts.type == 1 }">
								<video controls="controls">
									<source
										src="<c:url value="/assets/images/posts/${ liPosts.video }"/>"
										type="video/mp4">
								</video>
							</c:if>
						</div>
						<div class="view-details-content">
							<div class="url-ins">
								<a href="${ liPosts.url }"> <img alt=""
									src="<c:url value="/assets/images/icons/icons8-external-link-52.png"/>">
									View on Instagram
								</a>
								<div class="close-view-posts">
									<i class="fa fa-times" aria-hidden="true" id="close-view-posts"></i>
								</div>
							</div>
							<div class="view-content">${ liPosts.content }</div>
							<!-- <div class="buy-add-prod">
									<div class="location-btn">
										<div class="add-btn">
											<button>Add to cart</button>
										</div>
										<div class="buy-btn">
											<button>Buy it</button>
										</div>
									</div>								
								</div> -->
						</div>
					</div>
					<div class="opacity-view" id="opacity-view"></div>
				</div>
</div>
</c:if>
</c:forEach>
</c:forEach>
</div>
<div class="load-more">
	<div class="no-class">
		<a>Load More</a> <i class="fa fa-angle-down"></i>
	</div>
</div>
<hr class="shadow">
<footer>
	<form action="" method="post">
		<div class="footer">
			<div class="logo-footer">
				<a href="index.html"><img class="logo-footer"
					src="<c:url value="/assets/images/logo/Thnk.png"/>"
					alt="logo-footer"></a>
			</div>
			<div class="content-footer">
				<div class="text-shadow">CONTACT WITH US</div>
				<div class="content-footer-sub">
					<div class="col1">
						ABOUT US
						<div class="content-col">
							<a href="#">Community</a> <br> <a href="#">Agency</a>
						</div>
					</div>
					<div class="col2">
						ADDRESS
						<div class="content-col">
							dovantrung47201@gmail.com <br> Mr. Trung - 036 97 96 359
						</div>
					</div>
					<div class="col3">
						FOLLOW
						<div class="follow-app">
							<a href="https://www.facebook.com/trung472"><img
								src="<c:url value="/assets/images/icons/icons8-facebook-100.png"/>"
								alt="facebook"></a> <a
								href="https://github.com/trung47201/QLYTHUVIEN"><img
								src="<c:url value="/assets/images/icons/icons8-instagram-100.png"/>"
								alt="facebook"></a> <a
								href="https://www.youtube.com/channel/UCB_GgY-I9WyNOOjVAax3ayg"><img
								src="<c:url value="/assets/images/icons/icons8-youtube-60.png"/>"
								alt="facebook"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="copyright">
		<div class="footer-copyright">T&T © 2023 All rights reserved.</div>
	</form>
</footer>

<script type="text/javascript">
		var index = 1;
		$(".load-more").click(function() {
			index = index + 1;
			const arr = document.getElementsByClassName("list-view");
			for (let i=0; i<arr.length; i++) {
				if(arr[i].id == index) {
					$(arr[i]).removeClass("importantNone");
				}
			}
		});
	</script>

	<script type="text/javascript"> //click posts
			$(".list-view-ele").click(function() { //open
				var id = this.id;
				$("#view-details"+id).removeClass("importantNone");
				var current = $(window).scrollTop();
				$(window).scroll(function() {
				    $(window).scrollTop(current);
				});
				$(".fa-times").click(function() { //open
					$("#view-details"+id).addClass("importantNone");
					$(window).off('scroll');
				});
				
			});	
	</script>

	<script type="text/javascript"> //hover posts
		$(".list-view-ele").hover(function() {
			var get = $(this).children()[0];
			var child1 = $(get).children()[0];
			var child2 = $(get).children()[1];
			var c1 = child1.className;
			if(c1 == 'camera-img') {
				child1 = $(get).children()[1];
				child2 = $(get).children()[2];
			}
			$(child1).removeClass("importantNone");
			$(child2).removeClass("importantNone");
		});	
		$(".list-view-ele").mouseleave(function() {
			var get = $(this).children()[0];
			var child1 = $(get).children()[0];
			var child2 = $(get).children()[1];
			var c1 = child1.className;
			if(c1 == 'camera-img') {
				child1 = $(get).children()[1];
				child2 = $(get).children()[2];
			}
			$(child1).addClass("importantNone");
			$(child2).addClass("importantNone");
		});
	</script>