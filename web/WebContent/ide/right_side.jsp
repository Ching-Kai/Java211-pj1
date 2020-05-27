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
			result = stm.executeQuery(
					"select * from article a inner join board using(board_id) inner join (select date(reply_update) reply_update, reply_txt,reply_id, arti_id from article_reply group by reply_id order by reply_update desc) b using(arti_id) left join user using(user_id) group by arti_id order by a.arti_id DESC limit 5");

        	Statement stm2 = con.createStatement();
        	ResultSet result2 = conn.result;
			while (result.next()) {
				

				stm2 = con.createStatement();
                result2 = conn.result;
				try {
					result2 = stm2.executeQuery("select * from article_reply where arti_id="+result.getString("arti_id"));
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("查詢發生錯誤!");
				}
				
				int count = new Search_count().count(result2);
				result2.close();
				stm2.close();
		%>
		<div class="dicado-1">
			<h6>
				<a href="article_view.jsp?arti_id=<%=result.getString("arti_id") %>&board_id=<%=result.getString("board_id") %>"><%=result.getString("title")%></a>
			</h6>
			<span class="itac">最新回覆 : <%=result.getString("username")%><br />
			<i class="far fa-clock"></i> <%=result.getString("arti_update")%><i
				class="dot_"></i><i class="far fa-comment"></i> <%=count %></span>
		</div>
		<%
			}
			stm.close();
			result.close();
		%>
	</div>
</div>
<div class="clearfix"></div>