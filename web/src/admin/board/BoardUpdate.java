package admin.board;

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
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/BoardUpdate")
public class BoardUpdate extends HttpServlet {
    public BoardUpdate() {
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
		String board_id = request.getParameter("board_id");
		String board_name = request.getParameter("board_name");
		String sql="";
		int count=0;
		sql = "select count(*) from board where board_name = '"+board_name+"'";
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
			sql = "update board set board_name = '" + board_name + "' where board_id=" + board_id;
			try {
				PreparedStatement stm1;
				stm1 = con.prepareStatement(sql);
				stm1.executeUpdate();
				stm1.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("msg", "更新成功!!");
		}else {
			request.setAttribute("msg", "資料重複!!");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
