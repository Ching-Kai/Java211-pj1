<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<form method="post" action="http://localhost:8080/web/Check">
			<fieldset>
			<legend>登入資訊</legend>
			<p><label for="username">帳號：</label><input type="password" name="admin" id="admin"></p>
			<p><label for="passwd">密碼：</label><input type="password" name="passwd" id="passwd"></p>
			<p><input type="submit" value="登入"> <input type="reset" value="重置"></p>
			</fieldset>			
		</form>
	



</body>
</html>