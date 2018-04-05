<%@page import="hw2_3.Beans"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Books</title>
<link rel="stylesheet" href="screen.css" type="text/css"
	media="screen, projection">
<link rel="stylesheet" href="print.css" type="text/css" media="print">
<link rel="stylesheet" href="cart.css" type="text/css">
</head>
<body>
	<br>
	<%@ include file="navbar.jsp"%>
	<div class="items">
		<h4>Shop for Books</h4>
		<hr>
		<p class="floatRight">
			[ <a href="viewcart.jsp">View Cart</a> ]
		</p>
		<form id="Books" action="addtocart.jsp" method="POST" target="_self">
			<input type="checkbox" name="JSP" value="Books">Java Servlet
			Programming [$29.95]<br> <input type="checkbox" name="ODP"
				value="Books">Oracle Database Programming [$48.95]<br>
			<input type="checkbox" name="SA" value="Books">System
			Analysis and Design With UML [$14.95]<br> <input type="checkbox"
				name="OO" value="Books">Object Oriented Software Engineering
			[$35.99]<br> <input type="checkbox" name="JWS" value="Books">Java
			Web Services [$27.99]<br> <br /> <input type="submit"
				value="Add to Cart">
		</form>
	</div>
</body>
</html>