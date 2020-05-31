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
@WebServlet("/MemberArticleReplyDelete")
public class MemberArticleReplyDelete extends HttpServlet {
    public MemberArticleReplyDelete() {
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
		String reply_id = request.getParameter("reply_id");
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");		
		String sql ="";
		sql="delete from article_reply where arti_id="+arti_id+" and user_id="+user_id + " and reply_id="+reply_id;
		try {
			//刪除該筆回覆
			PreparedStatement stm1 = conn.con.prepareStatement(sql);
			stm1.executeUpdate();
					
			session.setAttribute("msg", "已刪除回覆!!");
			session.setAttribute("url", "article_view.jsp?arti_id="+arti_id+"&board_id="+board_id);
			response.sendRedirect("msg.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("msg", "刪除回覆失敗!!");
			session.setAttribute("url", "article_view.jsp?arti_id="+arti_id+"&board_id="+board_id);
			response.sendRedirect("msg.jsp");
			
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
