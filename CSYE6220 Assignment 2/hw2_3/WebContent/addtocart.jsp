<%@page import="hw2_3.Beans"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	final int FIELDS = 3;
	final int ITEMS = 5;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HW2_PART3</title>
<link rel="stylesheet" href="screen.css" type="text/css"
	media="screen, projection">
<link rel="stylesheet" href="print.css" type="text/css" media="print">
<link rel="stylesheet" href="cart.css" type="text/css">
</head>
<body>
	</br>
	<%@ include file="navbar.jsp"%>
	<div class="items">
		<h3>
			<strong>The following item has been added to your shopping
				cart successfully</strong>
		</h3>
		<%
			for (int i = 0; i < FIELDS; i++) {
				for (int j = 0; j < ITEMS; j++) {
					if (null != request.getParameter(Beans.NAMES[i][j])) {
		%>
		<p>
			-
			<%=Beans.ITEMS[i][j]%></p>
		<p>
			<%
				session.setAttribute(Beans.NAMES[i][j], Beans.ITEMS[i][j]);
						}
					}
				}
			%>
		
		<p>
			[ <a href="viewcart.jsp">View Cart</a> ] [ <a href="books.jsp">Go
				to Books Page</a> ] [ <a href="music.jsp">Go to Music Page</a> ] [ <a
				href="computers.jsp">Go to Computers Page</a> ]
		</p>

	</div>
</body>
</html>