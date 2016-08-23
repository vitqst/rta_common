<%@ page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Common actions</title>
</head>
<body>
	<h1>Common actions</h1>
	<hr>
	<ol>
		<li><a href="simple-crypto.jsp">Simple Crypto service</a></li>
		<%
		String mdDirPath = getServletContext().getRealPath("md");
		File mdDir = new File(mdDirPath);
		File[] fList = mdDir.listFiles(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return name.endsWith(".md");
			}
		});
		for(File f : fList) {
			out.println(String.format("<li><a href=\"mdrender.jsp?title=%s&filepath=%s\">%s</a></li>",
					f.getName(), "md/"+f.getName(), "Doc - "+f.getName()));
		}
		
		%>
		<li><a href="index.html">...</a></li>
	</ol>
</body>
</html>