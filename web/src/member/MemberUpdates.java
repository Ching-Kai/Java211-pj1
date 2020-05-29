package member;

import java.io.IOException;
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

/**
 * Servlet implementation class MemberUpdates
 */
@WebServlet("/MemberUpdates")
public class MemberUpdates extends HttpServlet {
private static final long serialVersionUID = 1L;
    

    

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		Connection_sql conn = new Connection_sql();
		conn.connection();
		Connection con = conn.con;
		Statement stm = conn.stm;
		ResultSet result = conn.result;
		
		String user_id = request.getParameter("user_id");
		
		
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		
		String email=request.getParameter("email");
		
		//System.out.print(user_id+""+password+""+username+""+email);
		
		String sql = "";
		sql += "update user set password = '" + password + "', username = '" + username + "' , email = '" + email + "'  where user_id=" + user_id;
		try {			
			PreparedStatement stm1 = con.prepareStatement(sql);
			stm1.executeUpdate();
			stm.close();
			con.close();
			HttpSession session = request.getSession();
			session.setAttribute("username",username);
			response.sendRedirect("modify_P.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}