<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=request.getParameter("title")%></title>
</head>
<xmp theme="spacelab" style="display:none;"> <%
 	String path = request.getParameter("filepath");
 	String filepath = getServletContext().getRealPath(path);
 	BufferedReader reader = new BufferedReader(new FileReader(filepath));
 	StringBuilder sb = new StringBuilder();
 	String line;

 	while ((line = reader.readLine()) != null) {
 		sb.append(line + "\n");
 	}
 	out.println(sb.toString());
 	reader.close();
 %> </xmp>
<script src="http://strapdownjs.com/v/0.2/strapdown.js"></script>
</html>