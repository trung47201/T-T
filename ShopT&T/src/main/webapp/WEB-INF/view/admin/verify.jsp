<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>Verify</title>
<style>
body {
background: #f9e1ee;
overflow: hidden;
}
div {
	text-align: center;
	margin-top: 320px;
	font-size: 36px;
}
</style>
<body>
	<%
	if (session.getAttribute("adminID") != null) {
		response.sendRedirect("/ShopTandT/admin");
	}
	%>
	<div>We have sent a link for verification, please check your
		email.</div>

	<script type="text/javascript">
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
</body>
</html>