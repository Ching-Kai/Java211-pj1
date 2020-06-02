<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql"%>
<%
	Connection_sql conn = new Connection_sql();
	conn.connection();
	Connection con = conn.con;
	Statement stm = conn.stm;
	ResultSet result = conn.result;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="head.jsp" %><!--CSS及JQ-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style_page.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/fontawesome.css" rel="stylesheet">
	<link rel="stylesheet"
		href="https://fonticons-free-fonticons.netdna-ssl.com/kits/ffe176a3/publications/72113/woff2.css" media="all">
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<script type="text/javascript">	
	var password = document.useraddform.password.value;
	var password1 = document.useraddform.password1.value;
	var username = document.useraddform.username.value;
	var email = document.useraddform.email.value;
	function check_Data() {
		password = document.useraddform.password.value;
		password1 = document.useraddform.password1.value;
		username = document.useraddform.username.value;
		email = document.useraddform.email.value;
		
		var re2 = /^[a-z|A-Z|\w]{7,15}$/;
		var re4 = /^.+@[a-z]+\.[a-z]+(\.[a-z]+)?$/;
		if (!re2.test(password)) {
			alert("密碼格式錯誤");
			return false;	
		} else if (password!=password1) {
			alert("兩次密碼不同");
			return false;
		} else if (!re4.test(email)) {
			alert("email格式錯誤");
			return false;
		} else {
			return true;
		}
	}
	</script>


</head>
<body class="page registration">
<jsp:include page="header.jsp" /><!--頁頭-->
<div class="indica">
		<div class="container">
			<div class="col-md-9 posta">
	<%
		//修改會員資料
		String user_id=(String)session.getAttribute("user_id");
		//System.out.print(user_id);
		if (session.getAttribute("user_id") != null) {
			String line = "";
			//String user_id = "1";
			// 			request.getParameter("user_id");
			//String arti_id = "1";

			String account = "";
			String password = "";
			String username = "";
			String gender = "";
			String email = "";
			String birthday = "";
			
			result = stm.executeQuery("select * from user where user_id = '" + user_id + "'");

			Statement stm2 = con.createStatement();
			ResultSet result2 = conn.result;
			result2 = stm2.executeQuery("select * from board");
			while (result.next()) {
				
				account = result.getString("account");
				password = result.getString("password");
				username = result.getString("username");
				gender = result.getString("gender");
				email = result.getString("email");
				birthday = result.getString("birthday");
	%>
	
		<h3><strong>會員資料</strong></h3>
		
		<table style="line-height:60px ;width:80% ;border-color:#006bcf;  border-spacing:5px 3px;border-collapse:separate;" border="3"   >
		
		<tr>
		<td align="center">暱稱:</td>
		<td><%=username%></td>
		</tr>
		<tr>
		<td align="center">帳號:</td>
		<td ><%=account%></td>
		</tr>
		<tr>
		<td align="center">密碼:</td>
		<td><%=password%></td>
		</tr>
		<tr>
		<td align="center">信箱:</td>
		<td><%=email%></td>
		</tr>
		<tr>
		<td align="center">性別:</td>
		<td><%=gender%></td>
		</tr>
		<tr>
		<td align="center">生日:</td>
		<td><%=birthday%></td>
		</tr>
		
		</table>


				<%
					out.println(line);
						}
						result2.close();
						result.close();
						stm2.close();
						stm.close();
						con.close();
				%>
			<br/>
			<br/>
			<button style=" padding: .5em 1.5em; class="btn_sty1" type='submit' onclick="javascript:location.href='http://localhost:8080/web/modify_P.jsp'">修改</button>

			<button style=" padding: .5em 1.5em;"" class="btn_sty1 btn_sty_red" type='button' name='act'
				value='select' onclick="location.href='modify_P.jsp'">取消</button>
			<input type='hidden' name='user_id' value='<%=user_id%>'> <input
				type='hidden' name='act' value='update'>
			</div>
		
		</form>
	</div>
		</div>
		</div>
	
	<%
		}
	%>
	<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>