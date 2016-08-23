<%@page import="vn.rta.common.util.SimpleCrypto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function prettyPrint() {
    var ugly = document.getElementById('plainTextArea').value;
    var obj = JSON.parse(ugly);
    var pretty = JSON.stringify(obj, undefined, 4);
    document.getElementById('plainTextArea').value = pretty;
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Common actions</title>
</head>
<body>
	<h1>Simple Crypto</h1>
	<jsp:useBean id="cryptoBean" class="vn.rta.common.bean.CryptoBean" scope="request"/>
	<hr>
	<jsp:setProperty property="cryptogram" name="cryptoBean" param="cryptogram"/>
	<jsp:setProperty property="plaintext" name="cryptoBean" param="plaintext"/>
	<%
		String mode = request.getParameter("mode");
		String keyseed = request.getParameter("keyseed");
		cryptoBean.setKeyseed(keyseed);
		if (keyseed != null && !keyseed.equals("")) {
			String after = "";
			cryptoBean.setRawKey(SimpleCrypto.toHex(SimpleCrypto.getRawKey(keyseed.getBytes())));
			if ("Decrypt".equals(mode)) {
				String before = cryptoBean.getCryptogram();
				try {
					after = SimpleCrypto.decrypt(keyseed, before);
				} catch (Exception e) {
					after = "EXCEPTION DURING Decrypt process";
				}
				cryptoBean.setPlaintext(after);
			} else if ("Encrypt".equals(mode)) {
				String before = cryptoBean.getPlaintext();
				try {
					after = SimpleCrypto.encrypt(keyseed, before);
				} catch (Exception e) {
					after = "EXCEPTION DURING Encrypt process";
				}
				cryptoBean.setCryptogram(after);
			}
		}
	%>
	<form action="" method="post">
		Key Seed 
		<input type="text" name="keyseed" 
			value='<jsp:getProperty property="keyseed" name="cryptoBean"/>'>
		<p>Raw Key: <jsp:getProperty property="rawKey" name="cryptoBean"/></p>
		<table>
			<tr>
				<td>
					<p>Plaintext</p>
					<textarea id="plainTextArea" name="plaintext" cols="70" 
					rows="20"><jsp:getProperty property="plaintext" name="cryptoBean"/></textarea>
				</td>
				<td>
					<p>Cryptogram</p>
					<textarea name="cryptogram" cols="70" 
					rows="20"><jsp:getProperty property="cryptogram" name="cryptoBean"/></textarea>
				</td>
			</tr>

			<tr>
				<td>
					<input type="submit" value="Encrypt" name="mode">
					<button onclick="prettyPrint()">Pretty Print</button>
				</td>
				<td><input type="submit" value="Decrypt" name="mode"></td>
			</tr>
		</table>
		
	</form>
	
</body>
</html>