<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
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
	<%@include file="head.jsp"%><!--CSS及JQ-->
	<link href="css/style_page.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="page">
	<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
			<div class="col-md-9 posta">
                <%

				String search = request.getParameter("search");
				//System.out.print(scout);
				if(search == null)
					search = "";
				try {
					if(search == "")
						result = stm.executeQuery("select * from (select * from article) article inner join board using(board_ID) inner join user using(user_id) group by arti_id order by arti_update desc");
					else
						result = stm.executeQuery("select * from (select * from article where title like '%"+search+"%') article inner join board using(board_ID) inner join user using(user_id) group by arti_id order by arti_update desc");
				
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("查詢發生錯誤!");
				}
                %>
<!--                 <form class="article_search" action="" method="get"> -->
<!--                     <input class="search_bar" name="search" type="text" -->
<%-- 							value="<%=search%>"><button type="submit" name='' value=''><i class="fas fa-search"></i></button><select> --%>
<!--                         <option>全部主題</option> -->
<!--                         <option>發問問題發問問題發問問題發問問題</option> -->
<!--                         <option>閒聊</option> -->
<!--                     </select> -->
<!-- 					<input name="scout" type="hidden" value="1"> -->
<%-- 					<input name="board_id" type="hidden" value="<%=board_id %>"> --%>
<!-- 				</form> -->
				<div class="board_sort">
					<ul>
						<li><a href="">全部主題</a></li>
						<li><a href="">問題發問</a></li>
						<li><a href="">閒聊</a></li>
					</ul>
				</div>
				<h3>
				<strong>搜尋結果</strong>
					<label1></label1>
				</h3>
				<div class="posta-top">
				<%		

                	Statement stm2 = con.createStatement();
                	ResultSet result2 = conn.result;
					while(result.next()){
						//擷取部分內容，如果文字長度小於擷取長度就顯示全部
						String title = new TextCut().txtBack(result.getString("title"), 50);
						String arti_txt = new TextCut().txtBack(result.getString("arti_txt"), 150);
						
				%>
					<div class="posta-1">
						<div class="posta-left">
							<a href="single.html"><img src="images/7.jpg" class="img-responsive" alt=""></a>
						</div>
						<div class="posta-right">
							<h4><a href="article_view.jsp?arti_id=<%=result.getString("arti_id") %>&board_id=<%=result.getString("board_id") %>"><%=title %></a></h4>
							<p><%=arti_txt %></p>

							<%

							try {
								result2 = stm2.executeQuery("select * from article_reply where arti_id="+result.getString("arti_id"));
								
							} catch (Exception e) {
								e.printStackTrace();
								System.out.println("查詢發生錯誤!");
							}
							
							int count = new Search_count().count(result2);

							%>
							<a class="sort_t blue" href="article_list.jsp?board_id=<%=result.getString("board_id") %>"><%=result.getString("board_name") %></a><span class="itac"><%=result.getString("username") %><i class="dot_"></i><i class="far fa-clock"></i> <%=result.getString("arti_update") %><i class="dot_"></i><i class="fas fa-comment-dots"></i> <%=count %><i class="dot_"></i></span>
						</div>
						<div class="clearfix"> </div>
						<a class="anabtn" href="single.html">Análise</a>
					</div>
				<%				
					}
				result2.close();
				stm2.close();
						
				%>
					<div class="p_index">
						<span><a href="#"><i class="fas fa-angle-left"></i></a></span>
						<ul>
							<li><a href="#">1</a></li>
						</ul>
						<span><a href="#"><i class="fas fa-angle-right"></i></a></span>
					</div>
				</div>
			</div>
			<jsp:include page="ide/right_side.jsp" /><!--右側篇幅 -->
			<div class="clearfix"></div>
		</div>
	</div>

	<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>