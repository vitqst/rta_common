<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Common actions</title>
<style>
.result {
	color: blue;
}
</style>
</head>
<body>
	<h1>Common actions</h1>
	<hr>
	<%
		String encrResult, decrResult;
		encrResult = request.getParameter("encrResult");
		decrResult = request.getParameter("decrResult");
	%>
	<form action="decrypt">
		Key Seed <input type="text" name="key"> <br> Text <br>
		<textarea name="text" cols="40" rows="5"></textarea>
		<br> <input name="ui" value="1" type="hidden"> <input
			type="submit" value="Decrypt">
	</form>
	<% if(decrResult!=null) { %>
	<p class="result"">
		Result:
		<%= decrResult %></p>
	<% } %>
	<hr>
	<form action="encrypt">
		Key Seed <input type="text" name="key"> <br> Text <br>
		<textarea name="text" cols="40" rows="5"></textarea>
		<br> <input name="ui" value="1" type="hidden"> <input
			type="submit" value="Encrypt">
	</form>
	<% if(encrResult!=null) { %>
	<p class="result">
		Result:
		<%= encrResult %></p>
	<% } %>

</body>
</html>