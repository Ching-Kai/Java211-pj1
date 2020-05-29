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
			//取文章最新回覆
			String sql="";			
			sql = "select * from article a inner join board using(board_id) inner join ";
			sql += "(select reply_update, reply_txt,reply_id, arti_id, user_id user_id_re ";
			sql += "from article_reply group by reply_id order by reply_update desc) b ";
			sql += "using(arti_id) left join user using(user_id) ";
			sql += "group by arti_id order by b.reply_update DESC";
			
			result = stm.executeQuery(sql);
			
        	Statement stm2 = con.createStatement();
        	ResultSet result2 = conn.result;
			while (result.next()) {
				try {
					result2 = stm2.executeQuery("select * from article_reply where arti_id="+result.getString("arti_id"));
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("查詢發生錯誤!");
				}
				
				int count = new Search_count().count(result2);
				result2.close();
				

				sql="select username username_re from user where user_id="+result.getString("user_id_re");
				
				result2 = stm2.executeQuery(sql);

				while(result2.next()){
		%>
		<div class="dicado-1">
			<h6>
				<a href="article_view.jsp?arti_id=<%=result.getString("arti_id") %>&board_id=<%=result.getString("board_id") %>"><%=result.getString("title")%></a>
			</h6>
			<span class="itac">最新回覆 : <%=result2.getString("username_re")%><br />
			<i class="far fa-clock"></i> <%=result.getString("reply_update")%><i
				class="dot_"></i><i class="far fa-comment"></i> <%=count %></span>
		</div>
		<%
				}
			}
			result.close();
			stm.close();
			result2.close();
			stm2.close();
		%>
	</div>
</div>
<div class="clearfix"></div>