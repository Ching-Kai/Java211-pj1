<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/style_edit.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/fontawesome.css" rel="stylesheet">
<script src="../js/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://fonticons-free-fonticons.netdna-ssl.com/kits/ffe176a3/publications/72113/woff2.css"
	media="all">
	<script>
	function msg(txt, path){
		alert(txt);
		//預設
		var default_path = 'edit.jsp';
		if(path == null){
			location.href=default_path;
		}else{
			location.href=path;
		}
	};		
	function cofirm_mes(mes, href){
		var str = href;
		if(mes != null){
			if(confirm(mes)){
				location.href=str;
			}
		}else{
			location.href=str;
		}
	};
	
	//送該表單
	function cofirm_mesf(myform, mes, article_id){
		var form = document.getElementById(myform);
		if(confirm(mes)){
			form.submit();
		}
	};
	</script>
</head>
<body>
	<%
		Connection_sql conn = new Connection_sql();
		conn.connection();
		Connection con = conn.con;
		Statement stm = conn.stm;
		ResultSet result = conn.result;
		String act = "";
		
		//後臺權限
		String auth="100";
		String auth_math="100";
		if(auth != auth_math){
			%>
			<script>
				alert("權限錯誤!");
				location.href='https://www.google.com/';
			</script>
			<%
			//response.sendRedirect("https://www.google.com/");
		}
		
		// 		//delete
		// 		try {
		// 			String sql = "delete from article where arti_id=2";
		// 			PreparedStatement stm1 = conn.con.prepareStatement(sql);
		// 			stm1.executeUpdate();
		// 			con.close();
		// 		} catch (Exception e) {
		// 			e.printStackTrace();
		// 		}

		// 		//update
		// 		try {
		// 			String sql = "update article set title = '0519《樂高旋風忍者 電影》' where arti_id=3";
		// 			PreparedStatement stm1 = con.prepareStatement(sql);
		// 			stm1.executeUpdate();
		// 			con.close();
		// 		} catch (Exception e) {
		// 			e.printStackTrace();
		// 		}

		// 		//insert
		// 		try {
		// 			String sql = "insert into article (title, arti_txt, view_num, board_id, user_id, arti_update) values('3《樂高旋風忍者 電影》即日起至 5 月 22 日開放限時免費下載 領取後將可永久保留','TT Games 宣布','1','5','20',current_timestamp)";
		// 			PreparedStatement stm1 = con.prepareStatement(sql);
		// 			stm1.executeUpdate();
		// 			con.close();
		// 		} catch (Exception e) {
		// 			e.printStackTrace();
		// 		}

		//select
		// 		try {
		// 			ResultSet result = stm.executeQuery("select count(*) from article");
		// 			int register_count = 0;
		// 			if (result.next()) {
		// 				register_count = result.getInt(1);
		// 				result.close();
		// 			}
		// 			if (register_count > 0) {
		// 				result = stm.executeQuery("select * from article");
		// 				while (result.next()) {
		// 					String username = result.getString("title");
		// 					out.println(result.getString("title") + "<br />");
		// 				}
		// 				result.close();
		// 				stm.close();
		// 			}
		// 			con.close();
		// 		} catch (Exception e) {
		// 			e.printStackTrace();
		// 			System.out.println("發生錯誤!");
		// 		}
	%>


	<section>
		<div class="contain">
			<div class="le_mu">
				<ul>
					<li><a href="#">會員管理</a></li>
					<li><a href="#">討論版管理</a></li>
					<li><a href="edit.jsp">文章管理</a></li>
				</ul>

			</div>
			<div class="ri_edit">
			<%
						//目前動作頁面						
						act = (String)request.getAttribute("act");
						String get_act= request.getParameter("act");
						out.println(act);	
						out.println(get_act);	
						//暫且無法使用Attribute傳值，使用GET
						if(act == null && get_act == null) {
							//預設頁面
							request.setAttribute("act", "select");
							act = (String)request.getAttribute("act");
						}else if(get_act != "") {
							act = get_act;
						}
						
						if (act.equals("select")) {
							try {
								result = stm.executeQuery("select * from article");
							} catch (Exception e) {
								e.printStackTrace();
								System.out.println("查詢發生錯誤!");
							}
							String line = "";
							String arti_id = "";
							String title = "";
							String arti_date = "";
							String arti_txt = "";
							%>
							
							<h1>文章總攬</h1>
							<form action="edit.jsp" method="get">
								<button type='submit' name='act' value='add'>新增</button>
							</form>
							<ul>
							<%
							while (result.next()) {
								arti_id = result.getString("arti_id");
								title = result.getString("title");
								arti_date = result.getString("arti_date");
								arti_txt = result.getString("arti_txt");
								%>
								<li><a href='edit.jsp?act=edit&arti_id=<%=arti_id %>'><%=title %></a>								
								<form id="myform" name="myform" method='get' action='edit.jsp'>
								<button type='submit' name='act' value='edit'>修改</button>
								<button type='button' name='' value='' onclick="cofirm_mes('確定要刪除嗎?', 'edit.jsp?act=delete&arti_id=<%=arti_id %>&act_s=article')">刪除</button>
								<button type='submit' name='act' value='reply'>查看回覆</button>
								<input type='hidden' name='arti_id' value='<%=arti_id %>'></form></li>
								<%
							}
							%>
							</ul>
							<%
							result.close();
							stm.close();
							con.close();
						}
						if (act.equals("add")) {
							
							%>
							<h1>新增資料</h1>
							<form name="myfome" id="myfome" method='get' action='edit.jsp'>					
								<div><label for='title'>文章標題：</label><input type='text' name='title' value=''></div>								
								<div><label for='arti_txt'>文章內文：</label><textarea type='text' name='arti_txt'></textarea></div>
								<div><label for='board_id'>討論版分類：</label><select name='board_id'>
							<%
							//討論版選擇
							result = stm.executeQuery("select * from board");
							String line="";
							while (result.next()) {
								String board_ido = result.getString("board_id");
								String board_name = result.getString("board_name");
								line += "<option value='" + board_ido + "'>" + board_name + "</option>";
							}
							out.println(line);
							result.close();
							%>
							</select></div>
								<button type='button' onclick="cofirm_mesf('myfome', '確定要新增嗎?')">確定修改</button>
								<button type='button' name='act' value='select' onclick="cofirm_mes(null, 'edit.jsp?act=select')">取消</button>
								<input type='hidden' name='act' value='add_data'>		
								<!-- 管理者user_id -->
								<input type="hidden" name="user_id" value="1">
							</form>
							<%							
						}
						if (act.equals("add_data")){
							
							RequestDispatcher dispatcher=request.getRequestDispatcher("/ArticleAddData");
							dispatcher.include(request, response);
							 %>
							 <script>msg('新增成功!!', null);</script>
							 <%
							
						}

						if (act.equals("edit") && request.getParameter("arti_id") != null) {
							String line = "";
							String arti_id = request.getParameter("arti_id");
							//String arti_id = "1";
							String title = "";
							String arti_date = "";
							String arti_txt = "";
							String board_id = "";
							result = stm.executeQuery("select * from article where arti_id = '" + arti_id + "'");

							Statement stm2 = con.createStatement();
							ResultSet result2 = conn.result;
							result2 = stm2.executeQuery("select * from board");
							while (result.next()) {
								title = result.getString("title");
								arti_date = result.getString("arti_date");
								board_id = result.getString("board_id");
								arti_txt = result.getString("arti_txt");									
								%>
								<h1>更新資料</h1>
								<form name="myfome" id="myfome" method='get' action='edit.jsp'>
								<div><label for=title''>文章標題：</label><input type='text' name='title' value='<%=title%>'></div>
								<div><label for=''>發文日期：</label><%=arti_date %></div>
								<div><label for='arti_txt'>文章內文：</label><textarea type='text' name='arti_txt'><%=arti_txt%></textarea></div>
								<div><label for='board_id'>討論版類別：</label><select name='board_id'>
										
								<%
								//討論版選擇
								while (result2.next()) {
									String board_ido = result2.getString("board_id");
									String board_name = result2.getString("board_name");
									line += "<option value='" + board_ido + "' ";
									//預設當前討論版
									if (board_id.equals(board_ido)) {
										line += "selected";
									}
									line += ">" + board_name + "</option>";
								}
								result2.close();
								out.println(line);
							}
							result.close();
							%>
							</select></div>
							<button type='button' onclick="cofirm_mesf('myfome', '確定要修改嗎?')">確定修改</button>
							
							<button type='button' name='act' value='select' onclick="cofirm_mes(null, 'edit.jsp?act=select')">取消</button>
							<input type='hidden' name='arti_id' value='<%=arti_id %>'>
							<input type='hidden' name='act' value='update'>
							</form>
							
							<% 
						}
						if (act.equals("update") && request.getParameter("arti_id") != null) {

							RequestDispatcher dispatcher=request.getRequestDispatcher("/ArticleUpdate");
							dispatcher.include(request, response);
							 %>
							 <script>msg('更新成功!!', null);</script>
							 <%
						}
						if (act.equals("delete")) {
							RequestDispatcher dispatcher=request.getRequestDispatcher("/ArticleDelete");
							dispatcher.include(request, response);
							 %>
							 	<script>msg('刪除成功!!', null);</script>
							 <%
						}
						if (act.equals("reply") && request.getParameter("arti_id") != null) {

							String arti_id = request.getParameter("arti_id");
							Statement stm2 = con.createStatement();
							ResultSet result2 = conn.result;
							try {
								result = stm.executeQuery("select distinct a.reply_id, a.reply_txt, a.reply_date, a.user_id, u.username from article_reply as a inner join user as u where a.arti_id="+arti_id);
								result2 = stm2.executeQuery("select title from article where arti_id="+arti_id);
							} catch (Exception e) {
								e.printStackTrace();
								System.out.println("查詢發生錯誤!");
							}
							String reply_id = "";
							String reply_txt = "";
							String reply_date = "";
							String user_id = "";
							String username = "";

							while(result2.next()) {
							%>							
								<h1>回覆總攬</h1>
								<strong><%=result2.getString("title") %></strong>
								<div>
							<%
							}
							int i = 0;
							while (result.next()) {
								reply_id = result.getString("reply_id");
								reply_date = result.getString("reply_date");
								reply_txt = result.getString("reply_txt");
								user_id = result.getString("user_id");
								username = result.getString("username");
								i++;
								%>
								<div><span>(<%=i %>樓)回覆者:</span><span class="username"><%=username %></span></div>
								<div><span>回覆時間:</span><span><%=reply_date %></span></div>
								<div><span>回覆內容:</span><span><%=reply_txt %></span></div>	
								<div><span>回覆id:</span><span><%=reply_id %></span></div>	
								
															
								<form id="myform" name="myform" method='get' action='edit.jsp'>
									<button type='submit' name='act' value='edit'>修改</button>
									<button type='button' name='' value='' onclick="cofirm_mes('確定要刪除嗎?', 'edit.jsp?act=delete&reply_id=<%=reply_id %>&act_s=article_reply')">刪除</button>
									<button type='submit' name='act' value='reply'>查看回覆</button>
									<input type='hidden' name='arti_id' value='<%=arti_id %>'>
								</form>
								<%
							}
							result2.close();
							result.close();
							stm2.close();
							stm.close();
							con.close();
						}
					%>
					</div>
			</div>
		</div>
	</section>
</body>
</html>