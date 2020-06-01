<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql, admin.other.Search_count, java.util.Date, java.io.*, java.text.*, article.*"%>
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
</head>
<body>
<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
			<div class="col-md-3 dicado">
				<h3>超級 <strong>熱門文章</strong>
					<label2></label2>
				</h3>
				<div class="ultimas">
					<label4></label4>
					</h3>
				<%	
					String sql="";
					sql = "select * from article a inner join board using(board_id) left join ";
					sql += "(select reply_update, reply_txt,reply_id, arti_id, user_id user_id_re ";
					sql += "from article_reply group by reply_id order by reply_update desc) b ";
					sql +="using(arti_id) left join user using(user_id) ";
					sql +="group by arti_id order by a.view_num, a.arti_update DESC limit 5";
					result = stm.executeQuery(sql);
					
					int i=0;
					while(result.next()){
						i++;
						String title = new TextCut().txtBack(result.getString("title"), 40);

				%>
					<div class="ultimas-top">
						<span class="ultimas-num"><%="0"+i %></span>
						<a class="sort_t blue" href="article_list.jsp?board_id=<%=result.getString("board_id") %>"><%=result.getString("board_name") %></a>
						<h5><a href="article_view.jsp?arti_id=<%=result.getString("arti_id") %>&board_id=<%=result.getString("board_id") %>"><%=title %></a></h5>
						<span class="itac">樓主 : <%=result.getString("username") %><br /><i class="far fa-clock"></i> <%=result.getString("arti_date") %></span><br />
						<div class="clearfix"> </div>
					</div>
					
				<%
					}
					result.close();
				%>
				</div>
			</div>
			<div class="col-md-6 posta">
				<h3>最新 <strong>發表文章</strong>
					<label1></label1>
				</h3>
				<%				
					result = stm.executeQuery("select * from article inner join board using(board_ID) inner join user using(user_id) group by arti_id order by arti_date desc limit 5");
			
					while(result.next()){
						String title = new TextCut().txtBack(result.getString("title"), 40);
						String arti_txt = new TextCut().txtBack(result.getString("arti_txt"), 100);
						
				%>
				<div class="posta-top">
					<div class="posta-1">
						<div class="posta-right">
							<h4><a href="article_view.jsp?arti_id=<%=result.getString("arti_id") %>&board_id=<%=result.getString("board_id") %>"><%=title %></a></h4>
							<p><%=arti_txt %></p>
							<a class="sort_t blue" href="article_list.jsp?board_id=<%=result.getString("board_id") %>"><%=result.getString("board_name") %></a>
							<span class="itac"><%=result.getString("username") %><i class="dot_"></i><i class="far fa-clock"></i> <%=result.getString("arti_date") %></span>
						</div>
						<div class="clearfix"> </div>
						<a class="anabtn" href="single.html">Análise</a>
					</div>
				</div>
				
				<%
						
					}
					result.close();
				%>
			</div>
			
			<jsp:include page="ide/right_side.jsp" /><!--右側篇幅 -->
		</div>
	</div>

<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>