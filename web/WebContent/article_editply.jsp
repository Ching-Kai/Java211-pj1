<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
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
<body class="page article_in article_reply">
	<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
			<%	

				response.setContentType("text/html;charset=utf-8");
				request.setCharacterEncoding("utf-8");
				//會員session
				Object acc_ID = session.getAttribute("account");
				Object acc_user_id = session.getAttribute("user_id");
			
				String arti_id = request.getParameter("arti_id");
				String reply_id = request.getParameter("reply_id");
				String board_id = request.getParameter("board_id");
				String sql = "";

				//檢查會員
				RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberOnly");
				dispatcher.include(request, response);
				boolean memeber = (boolean)request.getAttribute("membercheck");
				if(memeber){
				%>
					<script>msg('請登入會員', 'article_view.jsp?arti_id=<%=arti_id %>&board_id=<%=board_id%>')</script>
				<%
				}
				
				//更新參數
				String act = "";
				String reply_cont = request.getParameter("reply_cont");
				act=request.getParameter("dir");

				if(act==null){
					act="";
				}
				//update
				if(act.equals("update")){
					sql = "update article_reply set reply_txt='"+reply_cont+"' where reply_id = "+reply_id+" and arti_id = "+arti_id;
					PreparedStatement upstm = con.prepareStatement(sql);
					upstm.executeUpdate();
					upstm.close();
					%>
						<script>
							msg('修改成功!!', 'article_view.jsp?arti_id=<%=arti_id%>&board_id=<%=board_id%>');
						</script>
					<%
				}
				//out.print(act);
				//回覆內容
				try {
					sql = "select * from (select * from article_reply ";
					sql += "where reply_id="+reply_id+" and arti_id="+arti_id+") article_reply ";
					sql += "inner join user using(user_id) ";
					sql += "inner join article using(arti_id) ";
					sql += "inner join board using(board_id) ";
					sql +="group by reply_id";
					result = stm.executeQuery(sql);

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("查詢發生錯誤!");
				}
			%>
			<div class="col-md-9 posta">
				<%
					Statement stm2 = con.createStatement();
					ResultSet result2 = conn.result;
					int count = 0;
					String view_sum = "";
					while (result.next()) {
						String gender = result.getString("gender");
						if (gender.equals("man")) {
							gender = "男";
						} else if (gender.equals("woman")) {
							gender = "女";
						} else {
							gender = "錯誤!!";
						}

						//計算回覆數量
						try {
							result2 = stm2
									.executeQuery("select * from article_reply inner join user using(user_id) where arti_id="
											+ result.getString("arti_id"));

						} catch (Exception e) {
							e.printStackTrace();
							System.out.println("查詢發生錯誤!");
						}

						count = new Search_count().count(result2);
						view_sum = result.getString("view_num");
				%>
				<div class="article_storey">
				<h3>修改 <strong>回覆內容</strong></h3>
					<div class="article_box col-md-12">
						<form id="myform" name="myform" method="post" action="article_editply.jsp">
							<div class="info_box">
								<strong><%=result.getString("title")%></strong>
								<div>
									<span class="art_s"><a class="sort" href=""><%=result.getString("board_name")%></a></span>
									<span class="art_num"> <font><%=result.getString("arti_date")%></font>
										<%
											//result = stm.executeQuery("select");
										%> <font><i class="far fa-comment"></i> <%=count%></font> <font>瀏覽人數
											<%=view_sum%></font>
									</span>
								</div>
							</div>
							<div class="article_txt">
								<textarea name="reply_cont"><%=result.getString("reply_txt")%></textarea>
								
							</div>
							<div class="other_fun">
								<a class="edit_but_sub" title="修改完成" href="javascript:void(0);"
								onclick="cofirm_mesf('myform', '確定修改嗎?')"><i class="fas fa-check"></i> 修改完成</a>
								<a title="取消" href="article_view.jsp?arti_id=${param.arti_id}&board_id=<%=board_id %>"><i class="fas fa-backspace"></i> 取消修改</a>
								<span class="edit_but" title="修改文章"><i class="far fa-trash-alt"></i> 刪除文章</span>
							</div>
							<input type="hidden" name="arti_id" value="<%=arti_id%>" />
							<input type="hidden" name="reply_id" value="<%=reply_id%>" />
							<input type="hidden" name="board_id" value="<%=board_id%>" />
							<input type="hidden" name="user_id" value="<%=result.getString("user_id")%>" />
							<input type="hidden" name="dir" value="update" />
						</form>

						<%
							}
							result2.close();
							result.close();
							stm.close();

						%>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<jsp:include page="ide/right_side.jsp" /><!--右側篇幅 -->
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="clearfix"></div>
	<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>