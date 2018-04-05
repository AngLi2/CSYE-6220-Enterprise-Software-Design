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
		<h4>Shop for Music</h4>
	<hr>
	<p class="floatRight">[ <a href="viewcart.jsp">View Cart</a> ]</p>
	<form id="Music" action="addtocart.jsp" method="POST" target="_self">
		<input type="checkbox" name="Madonna" value="Music">I'm Going
		to Tell You a Secret by Madonna [$26.99]<br> <input
			type="checkbox" name="Britney" value="Music">Baby One More
		Time by Britney Spear [$10.95]<br> <input type="checkbox"
			name="Justin" value="Music">Justified by Justin Timberlake
		[$9.97]<br> <input type="checkbox" name="Nelly" value="Music">Loose
		by Nelly Furtado [$13.98]<br> <input type="checkbox" name="Kanye"
			value="Music">Gold Digger by Kanye West [$27.99]<br> <br>
		<input type="submit" value="Add to Cart">
	</form>
	</div>
</body>
</html>