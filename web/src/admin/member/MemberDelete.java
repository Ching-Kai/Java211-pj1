package admin.member;

import java.io.IOException;
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

/**
 * Servlet implementation class MemberDelete
 */
@WebServlet("/MemberDelete")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDelete() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		Connection_sql conn = new Connection_sql();
		conn.connection();
		Connection con = conn.con;
		Statement stm = conn.stm;
		ResultSet result = conn.result;
		ResultSet result2 = conn.result;
		String user_id = request.getParameter("user_id");
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String birthday=request.getParameter("birthday");
		String arti_id="";
		
		
		
		
		
		String sql0 =  "delete from article_reply where user_id="+user_id;//刪除他的回覆
		
		String sql="select arti_id from article where user_id="+user_id;
		
		Statement stm2 = null;
		try {
			stm2 = con.createStatement();
		} catch (SQLException e4) {
			// TODO Auto-generated catch block
			e4.printStackTrace();
		}
		try {
			stm2 = con.createStatement();
		} catch (SQLException e3) {
			// TODO Auto-generated catch block
			e3.printStackTrace();
		}
		
		try {
			result2 = stm2.executeQuery(sql);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			while (result2.next()) {
				arti_id = result2.getString("arti_id");
			    String sql1 =  "delete from article_reply where user_id="+arti_id;//刪除他文章的回覆
			    try {			
					PreparedStatement stm1 = con.prepareStatement(sql1);
					stm1.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql2 =  "delete from article where user_id="+user_id;//刪除他的文章
		
		String sql3 =  "delete from user where user_id="+user_id;//刪除他的帳號
		try {			
			PreparedStatement stm1 = con.prepareStatement(sql0);
			stm1.executeUpdate();
			PreparedStatement stm3 = con.prepareStatement(sql2);
			stm3.executeUpdate();
			PreparedStatement stm4 = con.prepareStatement(sql3);
			stm4.executeUpdate();
			
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
