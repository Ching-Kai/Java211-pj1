<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
    pageEncoding="UTF-8"
    import="java.io.IOException"
	import="java.io.PrintWriter"
	import="java.sql.Connection"
	import="java.sql.DriverManager"
	import="java.sql.ResultSet"
	import="java.sql.SQLException"
	import="java.sql.Statement"

	import="javax.servlet.ServletException"
	import="javax.servlet.annotation.WebServlet"
	import="javax.servlet.http.HttpServlet"
	import="javax.servlet.http.HttpServletRequest"
	import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>
<html>
<head>




<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
//PrintWriter out = response.getWriter();

String account = request.getParameter("account");
String password = request.getParameter("password");
String username = request.getParameter("username");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String birthday = request.getParameter("birthday");
out.print(account + password + username + gender + email);
String sql = "";

String sql2="";
sql2="select * from gossipboard.user where account='"+account+"';";


sql += String.format("INSERT INTO gossipboard.user(account,password,username,gender,email,birthday) VALUE('%s','%s','%s','%s','%s','%s');",
		account, password, username, gender, email,birthday);
out.print(sql);
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (Exception e) {
	out.print("找不到驅動");
}
try {
	String url = "jdbc:mysql://localhost:8888/gossipboard?serverTimezone=CST&useSSL=false";
	String user = "root";
	String password1 = "1234";
	
	Connection cnct = null;
	Statement stmt = null;
	
		
	
	try {
		cnct = DriverManager.getConnection(url, user, password1);
	} catch (SQLException e) {
		out.print("Connection問題");
	}

	try {
		stmt = cnct.createStatement();
	} catch (SQLException e) {
		out.print("Statment問題");
	}ResultSet re=stmt.executeQuery(sql2);
	if(re.next()){
		%>
		帳號已重複
		<%
		response.sendRedirect("adderror.html");
	}else{

	try {
		stmt.executeUpdate(sql);
		out.print("加入完成");


		
		response.sendRedirect("addfinish.html");
	} catch (SQLException e) {
		out.print("ResultSet問題");
	}
	}
} catch (Exception e) {
	out.print("整體問題");
}
%>
</body>
</html>