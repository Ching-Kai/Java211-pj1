<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql"%>

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
					try {
						if(scout == null){
							result = stm.executeQuery("select * from article");
						}else{
							result = stm.executeQuery("select * from article where title like '%"+search+"%'");
						}
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("查詢發生錯誤!");
					}
					String arti_id = "";
					String title = "";
					String arti_date = "";
					String arti_txt = "";
				%>

				<h1>文章總攬</h1>
				<div class="search_box">
					<form class="search" action="" method="get">
						<input class="search_bar" name="search" type="text" value="<%=search %>">
						<button class="btn_sty1 btn_sty_blue" type='submit' name='act' value='select'>搜尋</button>
						<input name="scout" type="hidden" value="1">
					</form>
					<form class="sele_box_add" action="" method="get">
						<button class="btn_sty1" type='submit' name='act' value='add'>新增文章</button>
					</form>
				</div>
				<ul>
					<%
						while (result.next()) {
						arti_id = result.getString("arti_id");
						title = result.getString("title");
						arti_date = result.getString("arti_date");
						arti_txt = result.getString("arti_txt");
					%>
					<li><a href='edit.jsp?act=reply&arti_id=<%=arti_id%>'><%=title%></a>
						<form class="sele_box" id="myform" name="myform" method='get'
							action=''>
							<button class="btn_sty1" type='submit' name='act' value='edit'>修改</button>
							<button class="btn_sty1 btn_sty_red" type='button' name='' value=''
								onclick="cofirm_mes('確定要刪除嗎?', 'edit.jsp?act=delete_arti&arti_id=<%=arti_id%>&act_s=article&oact=select')">刪除</button>
							<button class="btn_sty1 btn_sty_org" type='submit' name='act' value='reply'>查看回覆</button>
							<input type='hidden' name='arti_id' value='<%=arti_id%>'>
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
				
				//新增文章
				if (act.equals("add")) {
				%>
				<div class="edit add">
				<h1>新增資料</h1>
				<form name="myfome" id="myfome" method='get' action=''>
					<div>
						<label for='title'>文章標題</label><input type='text' name='title'
							value=''>
					</div>
					<div>
						<label for='arti_txt'>文章內文</label>
						<textarea type='text' name='arti_txt'></textarea>
					</div>
					<div>
						<label for='board_id'>討論版分類</label><select name='board_id'>
							<%
								//討論版選擇
							result = stm.executeQuery("select * from board");
							String line = "";
							while (result.next()) {
								String board_ido = result.getString("board_id");
								String board_name = result.getString("board_name");
								line += "<option value='" + board_ido + "'>" + board_name + "</option>";
							}
							out.println(line);
							result.close();
							%>
						</select>
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

					RequestDispatcher dispatcher = request.getRequestDispatcher("/ArticleAddData");
					dispatcher.include(request, response);
				%>
				<script>msg('新增成功!!', null);</script>
				<%
					}
				
				//修改文章
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
				<div class="edit">
					<h1>更新資料</h1>
					<form class="" name="myfome" id="myfome" method='get'
						action=''>
						<div>
							<label for='title'>文章標題</label><input type='text' name='title'
								value='<%=title%>'>
						</div>
						<div>
							<label for=''>發文日期</label><font title="<%=arti_date%>" class="arti_time"><%=arti_date%></font></div>
						<div>
							<label for='arti_txt'>文章內文</label>
							<textarea type='text' name='arti_txt'><%=arti_txt%></textarea>
						</div>
						<div>
							<label for='board_id'>討論版類別</label><select name='board_id'>

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
								out.println(line);
								}
								result2.close();
								result.close();
								stm2.close();
								stm.close();
								con.close();
								%>
							</select>
						</div>
						<button class="btn_sty1" type='button'
							onclick="cofirm_mesf('myfome', '確定要修改嗎?')">確定修改</button>

						<button class="btn_sty1 btn_sty_red" type='button' name='act' value='select'
							onclick="cofirm_mes(null, 'edit.jsp?act=select')">取消</button>
						<input type='hidden' name='arti_id' value='<%=arti_id%>'>
						<input type='hidden' name='act' value='update'>
					</form>
				</div>
				<%
					}
				
				//修改文章SQL
				if (act.equals("update") && request.getParameter("arti_id") != null) {

					RequestDispatcher dispatcher = request.getRequestDispatcher("/ArticleUpdate");
					dispatcher.include(request, response);
				%>
				<script>msg('更新成功!!', null);</script>
				<%
					}
				
				//刪除文章
				if (act.equals("delete_arti")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/ArticleDelete");
					dispatcher.include(request, response);
					String arti_id = request.getParameter("arti_id");
					act = request.getParameter("oact");
				%>
				<script>msg('刪除成功!!', null);</script>
				<%
					}
				//刪除文章or回覆
				if (act.equals("delete_reply")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/ArticleDelete");
					dispatcher.include(request, response);
					String arti_id = request.getParameter("arti_id");
					String reply_id = request.getParameter("reply_id");
					act = request.getParameter("oact");
					out.print(reply_id + " " + act);
				%>
				<script>
					msg('刪除成功!!', 'edit.jsp?act=<%=act%>&reply_id=<%=reply_id%>&arti_id=<%=arti_id%>');
				</script>
				<%
					}
				
				//回覆文章總覽
				if (act.equals("reply") && request.getParameter("arti_id") != null) {

					String arti_id = request.getParameter("arti_id");
					Statement stm2 = con.createStatement();
					ResultSet result2 = conn.result;
					try {
						result = stm.executeQuery(
						"select a.reply_id, a.reply_txt, a.reply_date, a.user_id, u.username from article_reply as a inner join user as u where a.arti_id="
								+ arti_id + " group by a.reply_id");
						result2 = stm2.executeQuery("select a.title, a.arti_date, a.arti_txt, u.username from article as a inner join user as u on a.arti_id=" + arti_id + " group by arti_id");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("查詢發生錯誤!");
					}
					String reply_id = "";
					String reply_txt = "";
					String reply_date = "";
					String user_id = "";
					String username = "";

					while (result2.next()) {
						String title = result2.getString("title");
						String arti_date = result2.getString("arti_date");
						String arti_txt = result2.getString("arti_txt");
						String arti_username = result2.getString("username");
				%>
				<div class="reply">
					<h1>查看回覆</h1>
					<h2 class="article_title"><%=title%></h2>
					<div class="article_contain">
						<div>							
							<div class="storey">
								<span>樓主 </span><span class="username"><%=arti_username%></span>
							</div>
							<div class="arti_time">
								<span><%=arti_date%></span>
							</div>
							<span><%=arti_txt%></span>
						</div>
						<form class="sele_box" id="myform" name="myform" method='get'
							action=''>
							<button class="btn_sty1" type='submit' name='act' value='edit'>修改</button>
							<button class="btn_sty1 btn_sty_red" type='button' name='' value=''
								onclick="cofirm_mes('確定要刪除該篇文章嗎?', 'edit.jsp?act=delete_arti&arti_id=<%=arti_id%>&act_s=article&oact=select')">刪除</button>
							<input type='hidden' name='arti_id' value='<%=arti_id%>'>
						</form>
					</div>
					<%
						}
					//計算筆數
					int i = 0;
					while (result.next()) {
						reply_id = result.getString("reply_id");
						reply_date = result.getString("reply_date");
						reply_txt = result.getString("reply_txt");
						user_id = result.getString("user_id");
						username = result.getString("username");
						i++;
					%>
					<div class="reply_box">
						<div class="storey">
							<span><%=i%>樓 </span><span class="username"><%=username%></span>
						</div>
						<div class="reply_contain">
							<div class="reply_time">
								<span><%=reply_date%></span>
							</div>
							<span><%=reply_txt%></span>
						</div>

						<form id="myform" name="myform" method='get' action=''>
							<button class="btn_sty1" type='button' name='' value=''
								onclick="cofirm_mes('確定要刪除嗎?', 'edit.jsp?act=delete_reply&reply_id=<%=reply_id%>&arti_id=<%=arti_id%>&act_s=article_reply&oact=reply')">刪除</button>
							<input type='hidden' name='arti_id' value='<%=arti_id%>'>
						</form>
					</div>
					<%
						}
					if (i == 0) {
					%>
					<p>暫無回覆!!</p>
					<%
						}
					%>
				</div>
				<%
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