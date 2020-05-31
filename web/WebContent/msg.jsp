<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql, admin.other.Search_count, java.util.Date, java.io.*, java.text.*"%>
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
	<%@include file="head.jsp"%><!--CSS及JQ-->
	<link href="css/style_page.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/fun.js"></script>
</head>
<body class="page article_in">
	<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
                <%
				
                //會員session
        		Object acc_ID = session.getAttribute("account");
				Object acc_user_id = session.getAttribute("user_id");
				
				String sql="";
				String board_id = request.getParameter("board_id");
				String arti_id = request.getParameter("arti_id");
				
				//訊息				
        		Object msg = session.getAttribute("msg");
        		Object url = session.getAttribute("url");
				if(msg == null)
					msg = "暫無訊息";
                %>
            <div class="col-md-12 posta" style="text-align:center;min-height:200px">
            	<h2><%=msg %></h2>
            	<p>3秒後自動跳轉頁面</p>
            	<script>
            		setTimeout("javascript:location.href='<%=url %>'", 3000);
            	</script>
            </div>
            <%
            session.removeValue("msg");
            session.removeValue("url");
            %>
            
            <div class="clearfix"> </div>
					<div class="p_index">
						<span><a href="#"><i class="fas fa-angle-left"></i></a></span>
						<ul>
							<li><a href="#">1</a></li>
						</ul>
						<span><a href="#"><i class="fas fa-angle-right"></i></a></span>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
	<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>