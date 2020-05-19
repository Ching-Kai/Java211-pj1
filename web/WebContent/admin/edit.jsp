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
</head>
<body>
	<%
		Connection_sql conn = new Connection_sql();
		conn.connection();
		final Connection con = conn.con;
		Statement stm = conn.stm;
		ResultSet result = conn.result;
		String act = "";

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
					<li><a href="">文章管理</a></li>
				</ul>

			</div>
			<div class="ri_edit">
				<form>
					<%
						if (true) {
							try {
								result = stm.executeQuery("select count(*) from article");
							} catch (Exception e) {
								e.printStackTrace();
								System.out.println("查詢發生錯誤!");
							}
							int register_count = 0;
							if (true) {
								result = stm.executeQuery("select * from article");
								String line = "";
								line += "<ul>";
								while (result.next()) {
									String arti_id = result.getString("arti_id");
									String title = result.getString("title");
									String arti_date = result.getString("arti_date");
									String arti_txt = result.getString("arti_txt");
									line = "<li><a href='edit.jsp?act=update&arti_id=" + arti_id + "'>" + title + "</a>";
									line += "<form method='get' action='edit.jsp'><button type='submit' value='edit'>修改</button>";
									line += "<button type='submit' value='delete'>刪除</button>";
									line += "<input type='hidden' value='" + arti_id + "'></form></li>";	
								}
								line += "</ul>";
								out.println(line);
					%>
					<%
						result.close();
								stm.close();
								con.close();
							}
						}

						if (act == "update") {
							if (true) {
								result = stm.executeQuery("select * from article where arti_id=3");
								while (result.next()) {
									String title = result.getString("title");
									String arti_date = result.getString("arti_date");
									String arti_txt = result.getString("arti_txt");
									String line = "<div><label>標題</label>";
									line += "<input type='text' name='title' value='" + title + "'></div>";
									line += "<div><label>發文日期</label>" + arti_date + "</div>";
									line += "<div><label>內文</label><input type='text' name='content' value='" + arti_txt
											+ "'></div>";
									out.println(line);
								}
					%>
					<button type="submit">送出</button>
					<input type="hidden" value="select">
					<%
						result.close();
								stm.close();
								con.close();
							}

							//update
							try {
								String sql = "update article set title = '0519《樂高旋風忍者 電影》' where arti_id=3";
								PreparedStatement stm1 = con.prepareStatement(sql);
								stm1.executeUpdate();
								con.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					%>
				</form>
			</div>
		</div>
	</section>
</body>
</html>