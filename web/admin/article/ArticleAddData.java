package article;

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
 * Servlet implementation class ArticleAddData
 */
@WebServlet("/ArticleAddData")
public class ArticleAddData extends HttpServlet {
    public ArticleAddData() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		Connection_sql conn = new Connection_sql();
		conn.connection();
		Connection con = conn.con;
		Statement stm = conn.stm;
		ResultSet result = conn.result;
		
		String user_id = request.getParameter("user_id");
		String title = request.getParameter("title");
		String arti_update = "current_timestamp";
		String board_id = request.getParameter("board_id");
		String arti_txt = request.getParameter("arti_txt");
		
		String sql = "insert into article (title, arti_txt, board_id, user_id, arti_update) values('"+title+"','"+arti_txt+"','"+board_id+"','"+user_id+"', "+arti_update+")";
		
		try {
			PreparedStatement stm1;
			stm1 = con.prepareStatement(sql);
			stm1.executeUpdate();
			stm1.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
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
