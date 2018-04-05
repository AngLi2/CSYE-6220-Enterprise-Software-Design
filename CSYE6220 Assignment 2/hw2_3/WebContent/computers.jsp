<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<h4>Shop for Computers</h4>
		<hr>
		<p class="floatRight">
			[ <a href="viewcart.jsp">View Cart</a> ]
		</p>
		<form id="Computers" action="addtocart.jsp" method="POST"
			target="_self">
			<input type="checkbox" name="Apple" value="Computers">Apple
			MacBook Pro with 13.3" Display [$1299.99]<br> <input
				type="checkbox" name="Asus" value="Computers">Asus Laptop
			with Centrino 2 Black [$949.95]<br> <input type="checkbox"
				name="HP" value="Computers">HP Pavilion Laptop with Centrino
			2 DV7 [$1199.95]<br> <input type="checkbox" name="Toshiba"
				value="Computers">Toshiba Satellite Laptop with Centrino 2 -
			Copper [$899.99]<br> <input type="checkbox" name="Sony"
				value="Computers">Sony VAIO Laptop with Core 2 Duo
			Cosmopolitan Pink [$779.99]<br> <br /> <input type="submit"
				value="Add to Cart">
		</form>
	</div>
</body>
</html>