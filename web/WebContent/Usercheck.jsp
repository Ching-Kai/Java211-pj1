<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.IOException"
	import="java.io.PrintWriter"
	import="java.sql.Connection"
	import="java.sql.DriverManager"
	import="java.sql.ResultSet"
	import="java.sql.SQLException"
	import="java.sql.Statement"
	import="java.sql.PreparedStatement"

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
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	try {
		cnct = DriverManager.getConnection(url, user, password1);
	} catch (SQLException e) {
		out.print("Connection問題");
	}
	
    String account = request.getParameter("account");
    String password = request.getParameter("password");
	
    String sql = "select * from gossipboard.user where account=? and password=?";
    preparedStatement =cnct.prepareStatement(sql);
    preparedStatement.setString(1,account);
    preparedStatement.setString(2,password);
    resultSet = preparedStatement.executeQuery();
    if(resultSet.next()){
      
       out.println("登入成功");
       response.sendRedirect("https://www.google.com.tw/");
    }
    
    else{
        out.println("使用者名稱或者密碼錯誤");
        
    }

	
} catch (SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>