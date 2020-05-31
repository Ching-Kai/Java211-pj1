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
<body class="page article_in article_reply">
	<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
			<%
				//會員session
				Object acc_ID = session.getAttribute("account");
				Object acc_user_id = session.getAttribute("user_id");
				
				String board_id = request.getParameter("board_id");
				String sql = "";

				if(board_id==null){
					board_id="";
				}
				
				//更新參數
				String act = "";
				String title = request.getParameter("title");
				String arti_txt = request.getParameter("article_cont");
				act=request.getParameter("dir");
				

				//檢查會員
				RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberOnly");
				dispatcher.include(request, response);
				boolean memeber = (boolean)request.getAttribute("membercheck");
				if(memeber){
				%>
					<script>
						alert("請登入會員");
						window.history.go(-1);
					</script>
				<%
				}

				if(act==null){
					act="";
				}
				//insert
				if(act.equals("insert")){
					sql = "insert into article(title, arti_update, arti_txt, board_id, user_id) ";
					sql +="values('"+title+"', current_timestamp, '"+arti_txt+"', "+board_id+", "+acc_user_id+")";
					PreparedStatement upstm = con.prepareStatement(sql);
					upstm.executeUpdate();
					upstm.close();
					
					//找尋剛新增那筆
					sql = "select arti_id, board_id from article where user_id="+acc_user_id+" order by arti_id desc limit 1";
					result = stm.executeQuery(sql);
					
					while(result.next()){
					%>
						<script>
							msg('新增成功!!', 'article_view.jsp?arti_id=<%=result.getString("arti_id") %>&board_id=<%=result.getString("board_id") %>');
						</script>
					<%
					
					}
				}
				//文章內容
				try {
// 					if(board_id == "")
// 						sql = "select * from board where board_id=" + board_id;
// 					else
						sql = "select * from board";
					result = stm.executeQuery(sql);

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("查詢發生錯誤!");
				}
			%>
			<div class="col-md-9 posta">
				<div class="article_storey">
				<h3>新增<strong>討論版文章</strong></h3>
					<div class="article_box col-md-12">
						<form id="myform" name="myform" method="get" action="article_add.jsp">
							<div class="info_box">
								<strong><input class="title" name="title" value="" /></strong>
							</div>
							<div class="article_txt">
								<div>討論版分類：
									<select name="board_id">
										<option value="0">請選擇</option>
									<%	
									while(result.next()){
										String boards_id = result.getString("board_id");
										String board_name = result.getString("board_name");
										if(!boards_id.equals(board_id)){		
											%>
											<option value="<%=boards_id %>"><%=board_name %></option>
											<%	
										}else{
											%>
											<option value="<%=boards_id %>" selected><%=board_name %></option>
											<%			
										}
									}
									%>
									</select>
								</div>
								<textarea name="article_cont"></textarea>
								
							</div>
							<div class="other_fun">
								<a class="edit_but_sub" title="我要發佈" href="javascript:void(0);"
								onclick="cofirm_mesf('myform', '確定發佈嗎?')"><i class="fas fa-check"></i> 我要發佈</a>
								<a title="取消" href="arti_id="><i class="fas fa-backspace"></i> 取消發佈</a>
							</div>
							<input type="hidden" name="dir" value="insert" />
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<jsp:include page="ide/right_side.jsp" /><!--右側篇幅 -->
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="clearfix"></div>
	</div>
	<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>