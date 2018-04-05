<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*, javax.servlet.*,hw2_3.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	DecimalFormat df = new DecimalFormat(".##");
	final int FIELDS = 3;
	final int ITEMS = 5;
	String removeName = request.getParameter("removeName");
	double totalPrice = 0;
	if (null != removeName)
		session.removeAttribute(removeName);
	//initialize the price
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="screen.css" type="text/css"
	media="screen, projection">
<link rel="stylesheet" href="print.css" type="text/css" media="print">
<link rel="stylesheet" href="cart.css" type="text/css">
</head>
<body>
	</br>
<%@ include file="navbar.jsp"%>
	<div class="items">
		<h1>Items Currently in Your Cart</h1>
		<hr>
		<%
			int nums = 0;
			for (int i = 0; i < FIELDS; i++) {
				for (int j = 0; j < ITEMS; j++) {
					if (null != session.getAttribute(Beans.NAMES[i][j])) {
						totalPrice += Beans.PRICES[i][j];
						out.print("<pre>" + (++nums) + ". " + Beans.ITEMS[i][j] + " 	$" + Beans.PRICES[i][j]);
						out.print(" [ <a href= viewcart.jsp?removeName=" + Beans.NAMES[i][j]
								+ ">remove from cart</a> ]</pre>");
					}
				}
			}
		%>
		<hr>
		<h1>
			TOTAL: $<span> <%
 	if (totalPrice == 0)
 		out.print("0");
 	else
 		out.print(df.format(totalPrice));
 %>
			</span>
		</h1>
	</div>
</body>
</html>