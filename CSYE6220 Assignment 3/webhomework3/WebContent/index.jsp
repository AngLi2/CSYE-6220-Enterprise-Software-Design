<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.net.URL"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import=" org.w3c.dom.CharacterData"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<%
	List<URL> urlList = new ArrayList<URL>();
	if (null != session.getAttribute("feedURL")) {
		urlList = (ArrayList<URL>) session.getAttribute("feedURL");
	}

	URL feedURL = null;
	if (null != request.getParameter("feedURL") && request.getParameter("feedURL") != "") {
		feedURL = new URL(request.getParameter("feedURL"));
		if (!urlList.contains(feedURL))
			urlList.add(feedURL);
	}
	session.setAttribute("feedURL", urlList);
	DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
%>
<%!public String getElementValue(Element parent, String label) {
		Element e = (Element) parent.getElementsByTagName(label).item(0);
		try {
			Node child = e.getFirstChild();
			if (child instanceof CharacterData) {
				CharacterData cd = (CharacterData) child;
				return cd.getData();
			}
		} catch (Exception ex) {
		}
		return null;
	}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		  $("thead").click(function() {
		    $(this).siblings().toggle();
		  });
	});
	</script>
</head>
<body>
	<div class="container">
		<br />
		<form class="form-inline" action="index.jsp">
			Feed URL:&nbsp;&nbsp; <input type="text" name="feedURL"
				class="form-control" />&nbsp; &nbsp;
			<button type="submit" class="btn btn-primary">Add
				Subscription</button>
		</form>
		<br />
		<%
			if (null != session.getAttribute("feedURL")) {
				for (URL url : urlList) {
		%>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<%
						NodeList node = builder.parse(url.openStream()).getElementsByTagName("channel");
								for (int i = 0; i < node.getLength(); i++) {
									Element element = (Element) node.item(i);
					%>

					<th><%=getElementValue(element, "title")%></th>
					<%
						}
					%>
				</tr>
			</thead>
			<%
				Document doc = builder.parse(url.openStream());
						NodeList nodes = doc.getElementsByTagName("item");
						for (int i = 0; i < nodes.getLength(); i++) {
							Element element = (Element) nodes.item(i);
			%>

			<tr>
				<td><a href="<%=getElementValue(element, "link")%>"><%=getElementValue(element, "title")%></a></td>
			</tr>

			<%
				}
			%>
		</table>
		<%
			}
			}
		%>

	</div>
</body>
</html>