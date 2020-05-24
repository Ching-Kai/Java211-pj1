package admin.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sql_connection.Connection_sql;

@WebServlet("/BoardDelete")
public class BoardDelete extends HttpServlet {
    public BoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String act_s = request.getParameter("act_s");
		PrintWriter out = response.getWriter();

		String reply_id = request.getParameter("reply_id");
		String arti_id = request.getParameter("arti_id");
		article_delete a= new article_delete(request, response);
		if(act_s.equals("article")) {
			a.article(arti_id);
			a.article_reply(reply_id, arti_id);
		}
		if(act_s.equals("article_reply")) {
			a.article_reply(reply_id, null);
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	final class article_delete{
		HttpServletRequest request;
		HttpServletResponse response;
//		Connection_sql conn;
//		Connection con = conn.con;
//		ResultSet result = conn.result;

//		this.request = request;
//		this.response = response;
//		this.conn = conn;
//		this.con = con;
//		this.result = result;			
		article_delete(HttpServletRequest request, HttpServletResponse response){
			this.request = request;
			this.response = response;
		}
		protected void article(String arti_id) {

			Connection_sql conn = new Connection_sql();
			conn.connection();
			Connection con = conn.con;
			ResultSet result = conn.result;
			String sql = "delete from article where arti_id="+arti_id;
			try {
				PreparedStatement stm1 = conn.con.prepareStatement(sql);
				stm1.executeUpdate();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}	
		
		}
		protected void article_reply(String reply_id, String arti_id) {

			Connection_sql conn = new Connection_sql();
			conn.connection();
			Connection con = conn.con;
			ResultSet result = conn.result;
			String sql="";
			if(arti_id != null) {
				sql = "delete from article_reply where arti_id="+arti_id;
			}else if(reply_id != null) {
				sql = "delete from article_reply where reply_id="+reply_id;
			}
			try {
				PreparedStatement stm1 = conn.con.prepareStatement(sql);
				stm1.executeUpdate();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
