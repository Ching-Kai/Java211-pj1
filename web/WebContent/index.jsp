<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql, admin.other.Search_count"%>
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
					<div class="ultimas-top">
						<span class="ultimas-num">01</span>
						<span class="sort_t blue">遊戲資訊</span>
						<h5>Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</h5>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前</span><br />
						<div class="clearfix"> </div>
					</div>
					<div class="ultimas-top">
						<span class="ultimas-num">02</span>
						<span class="sort_t green">遊戲資訊</span>
						<h5>Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</h5>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前</span><br />
						<div class="clearfix"> </div>
					</div>
					<div class="ultimas-top">
						<span class="ultimas-num">03</span>
						<span class="sort_t blue">遊戲資訊</span>
						<h5>Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</h5>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前</span><br />
						<div class="clearfix"> </div>
					</div>
					<div class="ultimas-top">
						<span class="ultimas-num">04</span>
						<span class="sort_t org">遊戲資訊</span>
						<h5>Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</h5>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前</span><br />
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<div class="col-md-6 posta">
			<%
				//select * from article inner join user inner join board order by arti_update limit 5;
				result = stm.executeQuery("select * from article inner join board using(board_ID) inner join user group by user_id order by arti_update limit 5");
			%>
				<h3>最新 <strong>發表文章</strong>
					<label1></label1>
				</h3>
				<%
					while(result.next()){
				%>
				<div class="posta-top">
					<div class="posta-1">
						<div class="posta-right">
							<h4><a href="#"><%=result.getString("title") %></a></h4>
							<p><%=result.getString("arti_txt") %></p>

							<span class="sort_t blue"><%=result.getString("board_name") %></span>
							<span class="itac"><%=result.getString("username") %><i class="dot_"></i><i class="far fa-clock"></i> 3 天前</span>
						</div>
						<div class="clearfix"> </div>
						<a class="anabtn" href="single.html">Análise</a>
					</div>
				</div>
				
				<%
						
					}
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
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>

<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>