<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Payment</title>
<style type="text/css">
table {
	border: 0;
}

table td {
	padding: 5px;
}
</style>
<body>
	<h1>Paypal Payment with Spring Boot - ShareEverythings.com</h1>
	<form method="post" action="/SpringMVC/authorize_payment">
		<table>
			<tr>
				<td>Product/Service:</td>
				<td><input type="text" name="product" value="Next iPhone" /></td>
			</tr>
			<tr>
				<td>Sub Total:</td>
				<td><input type="text" name="subtotal" value="100" /></td>
			</tr>
			<tr>
				<td>Shipping:</td>
				<td><input type="text" name="shipping" value="10" /></td>
			</tr>
			<tr>
				<td>Tax:</td>
				<td><input type="text" name="tax" value="10" /></td>
			</tr>
			<tr>
				<td>Total Amount:</td>
				<td><input type="text" name="total" value="120" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Checkout" /></td>
			</tr>
		</table>
	</form>
</body>
</html>