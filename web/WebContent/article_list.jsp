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
</head>
<body class="page">
	<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
			<div class="col-md-9 posta">
                <font class="article_t">搜尋此討論版：</font>
                <form class="article_search">
                    <input name=""><button type="submit"><i class="fas fa-search"></i></button><select>
                        <option>全部主題</option>
                        <option>發問問題發問問題發問問題發問問題</option>
                        <option>閒聊</option>
                    </select>
				</form>
				<div class="board_sort">
					<ul>
						<li><a href="">全部主題</a></li>
						<li><a href="">問題發問</a></li>
						<li><a href="">閒聊</a></li>
					</ul>
				</div>
				<h3><strong>遊戲討論</strong>
					<label1></label1>
				</h3>
				<div class="posta-top">
					<div class="posta-1">
						<div class="posta-left">
							<a href="single.html"><img src="images/7.jpg" class="img-responsive" alt=""></a>
						</div>
						<div class="posta-right">
							<h4><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h4>
							<p>目前微軟確定將會在美國東岸時間5月7日上午11點展示以Xbox Series X硬體實際執行的遊戲畫面，預期也能確認屆時會有哪些遊戲作品登上Xbox Series X。</p>

							
							<span class="itac">Paulo Ricardo<i class="dot_"></i><i class="far fa-clock"></i> 3 天前<i class="dot_"></i><i class="fas fa-comment-dots"></i> 5<i class="dot_"></i></span>
						</div>
						<div class="clearfix"> </div>
						<a class="anabtn" href="single.html">Análise</a>
					</div>
					<div class="posta-1">
						<div class="posta-left">
							<a href="single.html"><img src="images/7.jpg" class="img-responsive" alt=""></a>
						</div>
						<div class="posta-right">
							<h4><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h4>
							<p>目前微軟確定將會在美國東岸時間5月7日上午11點展示以Xbox Series X硬體實際執行的遊戲畫面，預期也能確認屆時會有哪些遊戲作品登上Xbox Series X。</p>

							
							<span class="itac">Paulo Ricardo<i class="dot_"></i><i class="far fa-clock"></i> 3 天前<i class="dot_"></i><i class="fas fa-comment-dots"></i> 5<i class="dot_"></i></span>
						</div>
						<div class="clearfix"> </div>
						<a class="anabtn" href="single.html">Análise</a>
					</div>
					<div class="posta-1">
						<div class="posta-left">
							<a href="single.html"><img src="images/7.jpg" class="img-responsive" alt=""></a>
						</div>
						<div class="posta-right">
							<h4><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h4>
							<p>目前微軟確定將會在美國東岸時間5月7日上午11點展示以Xbox Series X硬體實際執行的遊戲畫面，預期也能確認屆時會有哪些遊戲作品登上Xbox Series X。</p>

							
							<span class="itac">Paulo Ricardo<i class="dot_"></i><i class="far fa-clock"></i> 3 天前<i class="dot_"></i><i class="fas fa-comment-dots"></i> 5<i class="dot_"></i></span>
						</div>
						<div class="clearfix"> </div>
						<a class="anabtn" href="single.html">Análise</a>
					</div>
					<div class="posta-1">
						<div class="posta-left">
							<a href="single.html"><img src="images/7.jpg" class="img-responsive" alt=""></a>
						</div>
						<div class="posta-right">
							<h4><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h4>
							<p>目前微軟確定將會在美國東岸時間5月7日上午11點展示以Xbox Series X硬體實際執行的遊戲畫面，預期也能確認屆時會有哪些遊戲作品登上Xbox Series X。</p>

							
							<span class="itac">Paulo Ricardo<i class="dot_"></i><i class="far fa-clock"></i> 3 天前<i class="dot_"></i><i class="fas fa-comment-dots"></i> 5<i class="dot_"></i></span>
						</div>
						<div class="clearfix"> </div>
						<a class="anabtn" href="single.html">Análise</a>
					</div>
					<div class="p_index">
						<span><a href="#"><i class="fas fa-angle-left"></i></a></span>
						<ul>
							<li><a href="#">1</a></li>
						</ul>
						<span><a href="#"><i class="fas fa-angle-right"></i></a></span>
					</div>
				</div>
			</div>
			<div class="col-md-3  redes">
				<h3>
					最新 <strong>文章回覆</strong>
					<label3></label3>
				</h3>
				<div class="dicado-top">
					<h5>30 app para download</h5>
				</div>
				<div class="dicado-bottom">
					<%
						result = stm.executeQuery(
								"select * from article a inner join board using(board_id) inner join (select date(reply_update) reply_update, reply_txt,reply_id, arti_id from article_reply group by reply_id order by reply_update desc) b using(arti_id) left join user using(user_id) group by arti_id order by a.arti_id DESC limit 5");

						while (result.next()) {
					%>
					<div class="dicado-1">
						<h6>
							<a href="#"><%=result.getString("title")%></a>
						</h6>
						<span class="itac">最新回覆 : <%=result.getString("username")%><br />
						<i class="far fa-clock"></i> <%=result.getString("arti_update")%><i
							class="dot_"></i><i class="far fa-comment"></i> <%=result.getString("view_num")%></span>
					</div>
					<%
						}
						stm.close();
						result.close();
					%>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>