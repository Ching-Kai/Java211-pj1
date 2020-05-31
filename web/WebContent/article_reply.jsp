<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql, admin.other.Search_count, java.util.Date, java.io.*, java.text.*, member.MemberOnly"%>
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
<link href="css/style_page.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/fun.js"></script>
</head>
<body class="page article_in article_reply">
	<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
			<%
				//會員session
				Object acc_ID = session.getAttribute("account");
				Object acc_user_id = session.getAttribute("user_id");
				String board_id = request.getParameter("board_id");
				String arti_id = request.getParameter("arti_id");
				
				//檢查會員
				RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberOnly");
				dispatcher.include(request, response);
				boolean memeber = (boolean)request.getAttribute("membercheck");
				if(memeber){
				%>
					<script>msg('請登入會員', 'article_view.jsp?arti_id=<%=arti_id %>&board_id=<%=board_id%>')</script>
				<%
				}

				String sql = "";
				//回覆參數
				String reply_id = request.getParameter("reply_id");		//如果是回覆房客
				//插入參數
				//user_id由session取得
				//String user_id = request.getParameter("user_id");
				String act = "";
				String title = request.getParameter("title");
				
				//回覆文章
				String reply_cont = request.getParameter("reply_cont");
				act = request.getParameter("dir");

				if (reply_id == null) {
					reply_id = "";
				}
				if (act == null) {
					act = "";
				}
				if (reply_cont == null) {
					reply_cont = "";
				}
				//update
				out.print(1);
				if (act.equals("re_insert") && acc_user_id != null) {

					out.print(2);
					String up_msg="";
					try{
						sql = "insert into article_reply(reply_txt, reply_update, arti_id, user_id) ";
						sql +="values('"+reply_cont+"', current_timestamp, "+arti_id+", "+acc_user_id+")";
						PreparedStatement upstm = con.prepareStatement(sql);
						upstm.executeUpdate();
						upstm.close();
						up_msg="回覆成功!!";
						} catch (Exception e) {
						e.printStackTrace();
						up_msg="回覆失敗!!";
					}
			%>
			<script>
							msg('<%=up_msg %>', 'article_view.jsp?arti_id=<%=arti_id%>&board_id=<%=board_id%>');
			</script>
			<%
				}
				out.print(act);
				//文章內容
				try {
					sql = "select * from (select * from article where board_id=" + board_id + " ";
					sql += "and arti_id=" + arti_id + ") article inner join board using(board_ID) ";
					sql += "inner join user using(user_id) group by arti_id";
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
					<div class="article_box col-md-12">
						<form id="myform" name="myform" method="get"
							action="article_reply.jsp">
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
								<%
										//回覆房客
										String user_name = "";
										if (reply_id != "") {
											sql = "select * from article_reply inner join user using(user_id) where ";
											sql += "arti_id=" + result.getString("arti_id") + " and reply_id=" + reply_id;
											result2 = stm2.executeQuery(sql);
											while (result2.next()) {
												user_name = result2.getString("username");
								%>
								<p>"引用 <%=user_name%>:<%=result2.getString("reply_txt")%>"</p>
								<textarea name="reply_cont">"引用 <%=user_name%>:<%=result2.getString("reply_txt")%>"</textarea>
								<%
											}
										} else {
										//回覆樓主
								%>
								<p>"回覆樓主"</p>
								<textarea name="reply_cont"></textarea>
								<%
										}
								%>

							</div>
							<div class="other_fun">
								<a class="edit_but_sub" title="我要回覆" href="javascript:void(0);"
									onclick="cofirm_mesf('myform', '確定回覆嗎?')"><i class="fas fa-reply"></i> 我要回覆</a> <a title="取消"
									href="arti_id=<%=result.getString("arti_id")%>"><i class="fas fa-backspace"></i> 取消回覆</a>
							</div>
							<input type="hidden" name="arti_id" value="<%=arti_id%>" /> 
							<input type="hidden" name="board_id" value="<%=board_id%>" />
							
							<input type="hidden" name="dir" value="re_insert" />
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