package admin.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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

		String board_id = request.getParameter("board_id");
		board_delete a= new board_delete(request, response);
		if(act_s.equals("board")) {
			a.article(board_id);
			a.board(board_id);
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	final class board_delete{
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
		board_delete(HttpServletRequest request, HttpServletResponse response){
			this.request = request;
			this.response = response;
		}
		//刪除討論版
		protected void board(String board_id) {

			Connection_sql conn = new Connection_sql();
			conn.connection();
			Connection con = conn.con;
			ResultSet result = conn.result;
			String sql = "delete from board where board_id="+board_id;
			try {
				PreparedStatement stm1 = conn.con.prepareStatement(sql);
				stm1.executeUpdate();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}	
		
		}
		//刪除討論版相關文章與回覆
		protected void article(String board_id) {

			Connection_sql conn = new Connection_sql();
			conn.connection();
			Connection con = conn.con;
			ResultSet result = conn.result;
			String sql="";
			String sql2="";
			
			sql="select arti_id from article where board_id = "+board_id;			
			try {
				Statement stm2 = con.createStatement();
				ResultSet result2 = stm2.executeQuery(sql);
				String arti_id="";
				while(result2.next()) {
					arti_id = result2.getString("arti_id");
					
					//刪除回覆
					sql2 = "delete from article_reply where arti_id="+arti_id;
					try {
						PreparedStatement stm1 = con.prepareStatement(sql2);
						stm1.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					}
					//刪除文章
					sql2 = "delete from article where arti_id="+arti_id;
					try {
						PreparedStatement stm1 = con.prepareStatement(sql2);
						stm1.executeUpdate();
						stm1.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				result2.close();
				stm2.close();
				
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO Auto-generated catch block
				System.out.println("物件創建失敗!");
			}			
		}
	}

}
