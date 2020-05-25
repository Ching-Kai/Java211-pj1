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
<script></script>
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
		location.href = 'https://www.google.com/';
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
						if (scout == null) {
					result = stm.executeQuery("select * from board");
						} else {
					result = stm.executeQuery("select * from board where board_name like '%" + search + "%' order by board_ID");
						}
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("查詢發生錯誤!");
					}
					String board_id = "";
					String board_name = "";
				%>

				<h1>討論版總攬</h1>
				<div class="search_box">
					<form class="search" action="" method="get">
						<input class="search_bar" name="search" type="text"
							value="<%=search%>">
						<button class="btn_sty1 btn_sty_blue" type='submit' name='act'
							value='select'>搜尋</button>
						<input name="scout" type="hidden" value="1">
					</form>
					<form class="sele_box_add" action="" method="get">
						<button class="btn_sty1" type='submit' name='act' value='add'>新增討論版</button>
					</form>
				</div>
				<ul>
					<%
						while (result.next()) {
						board_id = result.getString("board_ID");
						board_name = result.getString("board_name");
					%>
					<li><%=board_name%>
						<form class="sele_box" id="myform" name="myform" method='get'
							action=''>
							<button class="btn_sty1" type='submit' name='act' value='edit'>修改</button>
							<button class="btn_sty1 btn_sty_red" type='button' name=''
								value=''
								onclick="cofirm_mes('確定要刪除嗎?', 'board.jsp?act=delete_board&board_id=<%=board_id%>&act_s=board&oact=select')">刪除</button>
							<input type='hidden' name='board_id' value='<%=board_id%>'>
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
							<label for='title'>文章標題</label><input type='text' name='board_name'
								value=''>
						</div>
						<button type='button' class="btn_sty1"
							onclick="cofirm_mesf('myfome', '確定要新增嗎?')">確定新增</button>
						<button type='button' class="btn_sty1 btn_sty_red" name='act'
							value='select' onclick="cofirm_mes(null, 'board.jsp?act=select')">取消</button>
						<input type='hidden' name='act' value='add_data'>
						<!-- 管理者user_id -->
						<input type="hidden" name="user_id" value="1">
					</form>
				</div>
				<%
					}

				//新增文章SQL
				if (act.equals("add_data")) {

					RequestDispatcher dispatcher = request.getRequestDispatcher("/BoardAddData");
					dispatcher.include(request, response);
					String msg = (String)request.getAttribute("msg");
				%>
				<script>
					msg('<%=msg%>', null);
				</script>
				<%
					}

				//修改文章
				if (act.equals("edit") && request.getParameter("board_id") != null) {
					String board_id = request.getParameter("board_id");
					result = stm.executeQuery("select * from board board_id where board_id = " + board_id);

					String board_name = "";

					while (result.next()) {
						board_name = result.getString("board_name");
						board_id = result.getString("board_id");
				%>
				<div class="edit">
					<h1>更新資料</h1>
					<form class="" name="myfome" id="myfome" method='get' action=''>
						<div>
							<label for='board_name'>討論版名稱</label><input type='text'
								name='board_name' value='<%=board_name%>'>
						</div>
						<button class="btn_sty1" type='button'
							onclick="cofirm_mesf('myfome', '確定要修改嗎?')">確定修改</button>
						<button class="btn_sty1 btn_sty_red" type='button' name='act'
							value='select' onclick="cofirm_mes(null, 'board.jsp?act=select')">取消</button>
						<input type='hidden' name='board_id' value='<%=board_id%>'>
						<input type='hidden' name='act' value='update'>
					</form>
				</div>
				<%
					}
				result.close();
				stm.close();
				con.close();
				%>
				<%
					}

				//修改文章SQL
				if (act.equals("update") && request.getParameter("board_id") != null) {

					RequestDispatcher dispatcher = request.getRequestDispatcher("/ArticleUpdate");
					dispatcher.include(request, response);
				%>
				<script>
					msg('更新成功!!', null);
				</script>
				<%
					}

				//刪除文章
				if (act.equals("delete_board")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/BoardDelete");
					dispatcher.include(request, response);
					String board_id = request.getParameter("board_id");
					act = request.getParameter("oact");
				%>
				<script>
					msg('刪除成功!!', null);
				</script>
				<%
					}
				%>
			</div>
		</div>
		</div>
	</section>
</body>
</html>