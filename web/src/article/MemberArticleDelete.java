package article;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql_connection.Connection_sql;
import admin.other.*;

/**
 * Servlet implementation class MemberArticleDelete
 */
@WebServlet("/MemberArticleDelete")
public class MemberArticleDelete extends HttpServlet {
    public MemberArticleDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Connection_sql conn = new Connection_sql();
		conn.connection();
		Connection con = conn.con;
		ResultSet result = conn.result;
		Statement stm = conn.stm;
		
		PrintWriter out = response.getWriter();
		String arti_id = request.getParameter("arti_id");
		String board_id = request.getParameter("board_id");
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");		
		String sql ="";
		sql="delete from article where arti_id="+arti_id+" and user_id="+user_id;
		try {
			//刪除文章
			PreparedStatement stm1 = conn.con.prepareStatement(sql);
			stm1.executeUpdate();
						
			//回覆數量
			sql="select * from article_reply where arti_id="+arti_id;
			result = stm.executeQuery(sql);
			int count = new Search_count().count(result);
			out.print(count);
			if(count>0) {
				out.print(1);
				String reply_id="";
				while(result.next()) {
					reply_id = result.getString("reply_id");
					//刪除文章回覆
					sql="delete from article_reply where arti_id="+arti_id+" and reply_id = "+reply_id;
					stm1 = conn.con.prepareStatement(sql);
					stm1.executeUpdate();
				}
			}
			session.setAttribute("msg", "刪除成功!!");
			session.setAttribute("url", "article_list.jsp?board_id="+board_id);
			//刪除後回原討論版list
			response.sendRedirect("msg.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("msg", "刪除失敗!!");
			session.setAttribute("url", "article_view.jsp?arti_id="+arti_id+"&board_id="+board_id);
			response.sendRedirect("msg.jsp");
			
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
