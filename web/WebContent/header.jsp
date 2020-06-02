<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql, admin.other.Search_count"%>

    <%

	Connection_sql conn = new Connection_sql();
	conn.connection();
	Connection con = conn.con;
	Statement stm = conn.stm;
	ResultSet result = conn.result;
	String act = "";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%
	result = stm.executeQuery("select * from board");
%>


<div class="gossip_sort">
		<span><i class="far fa-comments"></i>交流討論平台</span>
		<ul>
		<%
		while (result.next()) {
		%>
			<li><a href="article_list.jsp?board_id=<%=result.getString("board_id") %>" title="<%=result.getString("board_name") %>"><%=result.getString("board_name") %></a></li>			
		<%
		}
		%>
		</ul>
	</div>
	<!-- banner -->
<div class="header">
		<div class="container">
			<div class="header-left">
				<div class="logo">
					<a href="index.jsp"><h1 title="線上交流平台×討論版">線上交流平台<span>×</span>討論版</h1></a>
				</div>
				<div class="gossip_sort_button gossip_close">
					<span><i class="fas fa-align-left"></i>討論版</span>
				</div>
				<div class="person">
					<p>A personal blog about everything.</p>
				</div>
			</div><div class="header-right">
			
			
<%if (session.getAttribute("account")==null){%>		
		<div class="login">
					<a class="sign_btn" href="#"><i class="fas fa-user-circle"></i>登入</a><a href="page_registration.jsp"><i class="fas fa-user-plus"></i>註冊</a>
			
					<div class="login_box">
						<form name="" action="Usercheck.jsp" method="post">
							<span class="login_title">使用者登入</span>
							<div><label for="account">帳號</label><input type="text" name="account" value=""></div>
							<div><label for="password">密碼</label><input type="password" name="password" value=""></div>
							<div class="sign_btn"><a class="for_pw" href="Forgot.jsp#">忘記密碼</a><button type="submit">登入</button></div>
						</form>
					</div>
				</div>
				
				
 <%}else {%>

 <div style="background-color:#FFD382;border-radius:5px;display:inline;">
 <% 
	 out.print(session.getAttribute("username"));	
	 session.getAttribute("account_ID");	
 %>
 		已登入	
 		</div>
 		
 		<div style="display:inline; float:right"class="login">
		<a href="logout.jsp"><i class="fas fa-user-plus"></i>登出</a>
		</div>		
		<div style="display:inline; float:right"class="login">
		<a href="member_profile.jsp"><i class="fas fa-user-plus"></i>資料</a>
		</div>	
 <%}%>


				<div class="search-box">
					<div id="sb-search" class="sb-search">
						<form action="article_lists.jsp" method="get">
							<input class="sb-search-input" placeholder="Enter your search term..." type="search"
								name="search" id="search">
							<input name="scout" type="hidden" value="1">
							<button class="sb-search-submit" type="submit" value="" >
								<i class="fa fa-search" aria-hidden="true"></i>
								
							</button>
						</form>
					</div>
				</div>
			</div>
			<!-- search-scripts -->
			<script src="js/classie.js"></script>
			<script>
				new UISearch(document.getElementById('sb-search'));
			</script>
			<!-- //search-scripts -->

			<!--<div class="clearfix"> </div>-->
		</div>
	</div>
</body>
</html>