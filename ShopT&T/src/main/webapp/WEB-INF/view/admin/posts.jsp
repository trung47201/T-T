<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Posts</title>

<link rel="stylesheet" href="<c:url value='/assets/css/re-role2.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-customer3.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-admin-login.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-search3.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-message.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/re-admin3.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-dashboard4.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-nav2.css'/>">

<style>
img.eye-show-hide, img.eye-show-hide-pw {
	right: 7% !important;
}

.sl-role {
	width: 97.7% !important;
}

.message input {
	width: 157px;
	padding: unset !important;
}

th.td-addnewshoes a {
	display: flex;
	width: 140px !important;
}

.img-posts img {
	cursor: pointer;
	height: 100%;
}

.video-posts img {
	cursor: pointer;
	height: 100%;
}

.img-posts {
	height: 60px;
}

.video-posts {
	height: 40px;
}

span.url-posts {
	cursor: pointer;
	display: inline-block;
	width: 120px;
	white-space: nowrap;
	overflow: hidden !important;
	text-overflow: ellipsis;
	display: inline-block;
}

span.content {
	display: inline-block;
	width: 720px;
	white-space: nowrap;
	overflow: hidden !important;
	text-overflow: ellipsis;
	display: inline-block;
}

span.url-posts:hover {
	text-decoration: underline;
	text-underline-offset: 2px;
}
.behind-zoom-img {
    background: black;
    width: 100%;
    height: 100%;
    position: absolute;
    z-index: 100;
    top: 0;
    left: 0;
    opacity: .5;
}
.zoom-img {
    z-index: 100;
}

</style>

<body>
	<%
	if (session.getAttribute("adminID") == null) {
		response.sendRedirect("/ShopTandT/login");
	}
	%>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/a-nav.jsp"></jsp:include>
		<section class="admin-customer-user">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>
			<div class="nav-history">
				<div class="origin">
					<img
						src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
						alt=""> <a href="/ShopTandT/admin">Home</a>
				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-template-96.png"/>"
						alt=""> <a href="">Layout</a>
				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-customer-64.png"/>"
						alt=""> <a href="/ShopTandT/admin/layout/posts">Posts</a>
				</div>
			</div>
			<div class="table-order">
				<table class="order">
					<thead>
						<tr>
							<th colspan="1000" class="td-addnewshoes"><a
								href="/ShopTandT/admin/layout/posts/add">
									<button class="addnewshoes add-new-user">
										<img
											src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
											alt="icon-plus"> Add New
									</button>
							</a></th>
						</tr>
						<tr>
							<th>ID</th>
							<th>Image</th>
							<th>Video</th>
							<th>Content</th>
							<th>URL</th>
							<th>Type</th>
							<th class="td-action">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="liPosts" items="${ listPosts }">
							<tr>
								<td>${ liPosts.id }</td>
								<td>
									<div class="img-posts">
										<img
											src="<c:url value="/assets/images/posts/${ liPosts.img }"/>"
											alt="">
									</div>
								</td>
								<td><c:if
										test="${ liPosts.video != '' &&  liPosts.video != null }">
										<div class="video-posts" id="${ liPosts.video }">
											<img
												src="<c:url value="/assets/images/icons/icons8-video-64.png"/>"
												alt="img">
										</div>
									</c:if></td>
								<td>${ liPosts.content }</td>
								<td><span class="url-posts" title="${ liPosts.url }">
										${ liPosts.url } </span></td>
								<td>${ liPosts.type }</td>
								<td class="td-action">
									<button class="btn-edit-user">
										<img
											src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
											alt="">
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<jsp:include page="../layouts/admin/a-footer.jsp"></jsp:include>
		</section>
	</div>

	<div class="behind-zoom-img importantNone"></div>
	
	<div class="zoom-img importantNone" id="zoom-img">
		<img id="display-img-onclick" alt="img-onclick"
			src="<c:url value="/assets/images/users/emiuuu.jpg"/>">
	</div>

	<div class="zoom-img importantNone" id="zoom-video">
		<video id="videoID" width="100%" controls>
		  	<source id="display-video-onclick" src="movie.mp4" type="video/mp4">
		</video>
	</div>

	<div class="message continue-add msg-order none" id="addcustomer1">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg-add"></p>
		<div class="btn-ok-cancel">
			<input class="cancel continue back1" type="button" value="Cancel">
			<input class="ok hover-btn" type="button" value="Continue Add">
		</div>
	</div>

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script>
		$(".img-posts img").click(function() {
			var get = this.src;
			$("#display-img-onclick").attr("src", get);
			$("#zoom-img").removeClass("importantNone");
			$(".behind-zoom-img").removeClass("importantNone");
		});
		$(".behind-zoom-img").click(function() {
			$("#zoom-img").addClass("importantNone");
			$(".behind-zoom-img").addClass("importantNone");
		});
	</script>
	
	<script>
		$(".video-posts").click(function() {
			var get = "/ShopTandT/assets/images/posts/"+this.id;
			var video = document.getElementById('videoID');
			video.src = get;
			video.load();
			video.play();
			$("#zoom-video").removeClass("importantNone");
			$(".behind-zoom-img").removeClass("importantNone");
		});
		$(".behind-zoom-img").click(function() {
			$("#zoom-video").addClass("importantNone");
			$(".behind-zoom-img").addClass("importantNone");
			var video = document.getElementById('videoID');
			video.pause();
		});
	</script>

</body>

</html>