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
 * Servlet implementation class MemberAddData
 */
@WebServlet("/MemberAddData")
public class MemberAddData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAddData() {
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
		
		
		
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		String username=request.getParameter("username");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String birthday=request.getParameter("birthday");
		
		
		
//		String user_id = request.getParameter("user_id");
//		String board_name = request.getParameter("board_name");
		
		
		
		
		
		
		
		String sql="";
		int count=0;
		sql = "select count(*) from user where account = '"+account+"'";
		try {
			result = stm.executeQuery(sql);
			while(result.next()) {
			     count = result.getInt(1);
			}
			stm.close();
			result.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if(count==0) {
			sql = "insert into user (account,password,username,gender,email,birthday) values('"+account+"','"+password+"','"+username+"','"+gender+"','"+email+"','"+birthday+"')";
			try {
				PreparedStatement stm1;
				stm1 = con.prepareStatement(sql);
				stm1.executeUpdate();
				stm1.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("msg", "新增成功!!");
		}else {
			request.setAttribute("msg", "資料重複!!");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}