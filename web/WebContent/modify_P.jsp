<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	
		<h3><strong>修改會員資料</strong>
					<label1></label1>
                </h3>
		<form  class="form-horizontal regis_form" name="useraddform" id="useraddform" method='get' action="http://localhost:8080/web/MemberUpdates">
		
			
			 	<div class="control-group">
                    <label class="control-label" for="">密　　碼</label><input class="control" name="password" type="password" value=<%=password%> placeholder="請設定8 到 16 字元,首字必須英文,英文需區分大小寫" required="required">
                </div>
                <div class="control-group">
                    <label class="control-label" for="">密碼確認</label><input class="control" name="password1" type="password" value="" placeholder="請再輸入一次密碼" required="required">
                </div>
				<div class="control-group">
				<label class="control-label" for='user_name'>姓　　名</label><input class="control" type='text' name='username'
					value='<%=username%>'></input>
				</div>

				<div class="control-group">
				<label class="control-label" for='email'>信　　箱 </label><input  class="control" name="email" type="email"
					value="<%=email%>">
				</div>
				<input type='hidden' name='user_id' value='<%=user_id%>'> 
				<input type='hidden' name='act' value='update'>
				<div>
				<%
					out.println(line);
						}
						result2.close();
						result.close();
						stm2.close();
						stm.close();
						con.close();
				%>

			</div>
			<button style="padding: .5em 1.5em;" class="btn_sty1" type='submit' onclick="return check_Data()">確定修改</button>

			<button class="btn_sty1 btn_sty_red" type='button' name='act'
				value='select' onclick="location.href='modify_P.jsp'">取消</button>
			<input type='hidden' name='user_id' value='<%=user_id%>'> <input
				type='hidden' name='act' value='update'>
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