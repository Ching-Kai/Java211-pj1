<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql, admin.other.Search_count"%>

<%
	//web title
	String web_title = "線上交流平台×討論版-後台管理";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=web_title%></title>
<link href="css/style_edit.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/fontawesome.css" rel="stylesheet">
<script src="../js/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://fonticons-free-fonticons.netdna-ssl.com/kits/ffe176a3/publications/72113/woff2.css"
	media="all">
<script src="js/fun.js"></script>
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
	String auth = "100";
	String auth_math = "100";
	if (auth != auth_math) {
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

	<header>
		<div class="contain">
			<h2><%=web_title%></h2>
		</div>
	</header>
	<section>
		<div class="contain">
			<div class="le_mu">
				<h3>後台選單</h3>
				<ul>
					<li><a href="member.jsp">會員管理</a></li>
					<li><a href="board.jsp">討論版管理</a></li>
					<li><a href="edit.jsp">文章管理</a></li>
				</ul>

			</div>
			<div class="ri_edit">
				<%
				//目前動作頁面						
				act = (String) request.getAttribute("act");
				String get_act = request.getParameter("act");
				//out.println(act);	
				//out.println(get_act);	
				//暫無法使用Attribute傳值，使用GET
				if (act == null && get_act == null) {
					//預設頁面
					request.setAttribute("act", "select");
					act = (String) request.getAttribute("act");
				} else if (get_act != "") {
					act = get_act;
				}
				
				//文章總覽頁面
				if (act.equals("select")) {
					String scout = request.getParameter("scout");
					String search = request.getParameter("search");
					if(search == null)
						search = "";
					try {
						if(scout == null){
							result = stm.executeQuery("select * from gossipboard.user");
						}else{
							result = stm.executeQuery("select * from gossipboard.user where username like '%"+search+"%'");
						}
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("查詢發生錯誤!");
					}
					String user_id = "";
					String username = "";
					String account_right = "";
					//String account_ID="";
					String account="";
					String email="";
					String birthday="";
					String gender="";
					String password="";
					
					
					
				%>

				<h1>會員總攬</h1>
				<div class="search_box">
					<form class="search" action="" method="get">
						<input class="search_bar" name="search" type="text" value="<%=search %>">
						<button class="btn_sty1 btn_sty_blue" type='submit' name='act' value='select'>搜尋</button>
						<input name="scout" type="hidden" value="1">
					</form>
					<form class="sele_box_add" action="" method="get">
						<button class="btn_sty1" type='submit' name='act' value='add'>新增帳號</button>
					</form>
				</div>
				<ul>
					
					
					<%
						int count = new Search_count().count(result);
						if(count==0){
							%>
								<div class="count_res"><h2>查無此資料!!</h2></div>
							<%
						}else{
					%>
							<div class="count_res">共有 <%=count %>筆 資料</div>
					<%
						}
						
						while (result.next()) {
							user_id = result.getString("user_id");
							account=result.getString("account");
							username = result.getString("username");
							account_right = result.getString("account_right");
							password=result.getString("password");
							gender=result.getString("gender");
							email=result.getString("email");
							birthday=result.getString("birthday");
							
					%>
					<li> 帳號: <%=account%> 暱稱: <%=username%> 密碼: <%=password%> 性別: <%=gender%> 信箱: <%=email%> 生日: <%=birthday%>
<%-- 					   <a href='member.jsp?act=reply&user_id=<%=user_id%>'></a> --%>
						<form class="sele_box" id="myform" name="myform" method='get'
							action=''>
							<button class="btn_sty1" type='submit' name='act' value='edit'>修改</button>
							<button class="btn_sty1 btn_sty_red" type='button' name='' value=''
								onclick="cofirm_mes('確定要刪除嗎?', 'member.jsp?act=delete_user&user_id=<%=user_id%>')">刪除</button>
							<button class="btn_sty1 btn_sty_org" type='submit' name='act' value='reply'>查看回覆</button>
							<input type='hidden' name='user_id' value='<%=user_id%>'>
						</form></li>
					<%
						}
					%>
				</ul>
				<%
					result.close();
				stm.close();
				con.close();
				}
				
				//新增會員
				if (act.equals("add")) {
				%>
				<div class="edit add">
				<h1>新增會員</h1>
				<form name="myfome" id="myfome" method='get' action=''>
					<div>
						<label for='account'>帳號</label>
						<textarea type='text' name='account'></textarea>
					</div>
					<div>
						<label for='password'>密碼</label>
						<textarea type='text' name='password'></textarea>
					</div>
					<div>
						<label for='user_name'>姓名</label><input type='text' name='username'
							value=''>
					</div>
					<div>
						<label for='gender'>性別</label><input name="gender" type="radio" value="mam">男 <input name="gender" type="radio" value="woman">女
					</div>
					<div>
						<label for='birthday'>生日</label><input name="birthday" type="date" value="">
					</div>
					<div>
						<label for='email'>信箱</label><input name="email" type="email" value="">
					</div>
					<button type='button' class="btn_sty1" onclick="cofirm_mesf('myfome', '確定要新增嗎?')">確定新增</button>
					<button type='button' class="btn_sty1 btn_sty_red" name='act' value='select'
						onclick="cofirm_mes(null, 'edit.jsp?act=select')">取消</button>
					<input type='hidden' name='act' value='add_data'>
					<!-- 管理者user_id -->
					<input type="hidden" name="user_id" value="1">
				</form>
				</div>
				<%
					}
				
				//新增文章SQL
				if (act.equals("add_data")) {

					RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberAddData");
					dispatcher.include(request, response);
				%>
				<script>msg('新增成功!!', null);</script>
				<%
					}
				
				
				
				
				
				
				
				
				
				//修改會員資料
				if (act.equals("edit") && request.getParameter("user_id") != null) {
					String line = "";
					String user_id = request.getParameter("user_id");
					//String arti_id = "1";
					
					 
					String account = "";
					String password = "";
					String username = "";
					String gender="";
					String email="";
					String birthday="";
					
					result = stm.executeQuery("select * from user where user_id = '" + user_id + "'");

					Statement stm2 = con.createStatement();
					ResultSet result2 = conn.result;
					result2 = stm2.executeQuery("select * from board");
					while (result.next()) {
						account = result.getString("account");
						password = result.getString("password");
						username = result.getString("username");
						gender = result.getString("gender");
						email=result.getString("email");
						birthday=result.getString("birthday");
				%>
				<div class="edit">
					<h1>更新資料</h1>
					<form class="" name="myfome" id="myfome" method='get'
						action=''>
						<div>
						<label for='account'>帳號</label>
						<input type='text' name='account' value='<%=account%>'></input>
						
					</div>
					<div>
						<label for='password'>密碼</label>
						<input type='text' name='password' value='<%=password%>'></input>
					</div>
					<div>
						<label for='user_name'>姓名</label>
						<input type='text' name='username'value='<%=username%>'></input>
					</div>
					<div>
						<label for='gender'>性別</label>
						<%if(gender.equals("man")){%>
						<input name="gender" type="radio" value="mam"  checked>男 
						<input name="gender" type="radio" value="woman">女
						<%}else{%>
						<input name="gender" type="radio" value="mam"  >男 
						<input name="gender" type="radio" value="woman" checked>女
						<%} %>
					</div>
					<div>
						<label for='birthday'>生日</label><input name="birthday" type="date" value="<%=birthday%>">
					</div>
					<div>
						<label for='email'>信箱</label><input name="email" type="email" value="<%=email%>">
					</div>
						<div>
								<%
									
								
								out.println(line);
								}
								result2.close();
								result.close();
								stm2.close();
								stm.close();
								con.close();
								%>
							
						</div>
						<button class="btn_sty1" type='button'
							onclick="cofirm_mesf('myfome', '確定要修改嗎?')">確定修改</button>

						<button class="btn_sty1 btn_sty_red" type='button' name='act' value='select'
							onclick="cofirm_mes(null, 'edit.jsp?act=select')">取消</button>
						<input type='hidden' name='user_id' value='<%=user_id%>'>
						<input type='hidden' name='act' value='update'>
					</form>
				</div>
				<%
					}
				
				//修改文章SQL
				if (act.equals("update") && request.getParameter("user_id") != null) {

					RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberUpdate");
					dispatcher.include(request, response);
				%>
				<script>msg('更新成功!!', null);</script>
				<%
					}
				
				//刪除文章
				if (act.equals("delete_user")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberDelete");
					dispatcher.include(request, response);
					String user_id = request.getParameter("user_id");
					//act = request.getParameter("oact");
				%>
				<script>msg('刪除成功!!', null);</script>
				<%
					}
				%>
<!-- 				//刪除文章or回覆 -->
<!-- // 				if (act.equals("delete_reply")) { -->
<!-- // 					RequestDispatcher dispatcher = request.getRequestDispatcher("/ArticleDelete"); -->
<!-- // 					dispatcher.include(request, response); -->
<!-- // 					String arti_id = request.getParameter("arti_id"); -->
<!-- // 					String reply_id = request.getParameter("reply_id"); -->
<!-- // 					act = request.getParameter("oact"); -->
<!-- // 					out.print(reply_id + " " + act); -->
<%-- 				%> --%>
<!-- 				<script> -->
<%-- 					msg('刪除成功!!', 'edit.jsp?act=<%=act%>&reply_id=<%=reply_id%>&arti_id=<%=arti_id%>'); --%>
<!-- 				</script> -->
<%-- 				<% --%>
<!-- // 					} -->
<%-- 				%> --%>

			
		</div>
		</div>
	</section>
</body>
</html>