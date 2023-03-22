<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								href="https://github.com/trung47201/QLYTHUVIEN"><i
								class="fab fa-instagram" aria-hidden="true"></i></a> <a
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