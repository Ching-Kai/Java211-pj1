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
					result = stm.executeQuery("select * from article a inner join board using(board_id) inner join (select date(reply_update) reply_update, reply_txt,reply_id, arti_id from article_reply group by reply_id order by reply_update desc) b using(arti_id) left join user using(user_id) group by arti_id order by a.view_num, a.arti_update DESC limit 5");
			
					while(result.next()){
				%>
					<div class="ultimas-top">
						<span class="ultimas-num">01</span>
						<span class="sort_t blue"><%=result.getString("board_name") %></span>
						<h5><%=result.getString("title") %></h5>
						<span class="itac">最新回覆 : <%=result.getString("username") %><br /><i class="far fa-clock"></i> <%=result.getString("reply_update") %></span><br />
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
					result = stm.executeQuery("select * from article inner join board using(board_ID) inner join user using(user_id) group by arti_id order by arti_update desc limit 5");
			
					while(result.next()){
						
				%>
				<div class="posta-top">
					<div class="posta-1">
						<div class="posta-right">
							<h4><a href="#"><%=result.getString("title") %></a></h4>
							<p><%=result.getString("arti_txt") %></p>
							<span class="sort_t blue"><%=result.getString("board_name") %></span>
							<span class="itac"><%=result.getString("username") %><i class="dot_"></i><i class="far fa-clock"></i> <%=result.getString("arti_update") %></span>
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
			<div class="col-md-3  redes">
				<h3>最新 <strong>文章回覆</strong>
					<label3></label3>
				</h3>
				<div class="dicado-top">
					<h5>30 app para download</h5>
				</div>
				<div class="dicado-bottom">
				<%
					result = stm.executeQuery("select * from article a inner join board using(board_id) inner join (select date(reply_update) reply_update, reply_txt,reply_id, arti_id from article_reply group by reply_id order by reply_update desc) b using(arti_id) left join user using(user_id) group by arti_id order by a.arti_id DESC limit 5");
					
					while(result.next()){
						
				%>
					<div class="dicado-1">
						<h6><a href="#"><%=result.getString("title") %></a></h6>
						<span class="itac">最新回覆 : <%=result.getString("username") %><br /><i class="far fa-clock"></i> <%=result.getString("arti_update") %><i
								class="dot_"></i><i class="far fa-comment"></i> <%=result.getString("view_num") %></span>
					</div>
				<%
						
					}
					stm.close();
					result.close();
				%>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>

<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>