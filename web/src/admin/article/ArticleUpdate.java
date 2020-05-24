package admin.article;

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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ArticleUpdate
 */
@WebServlet("/ArticleUpdate")
public class ArticleUpdate extends HttpServlet {
    public ArticleUpdate() {
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
		
		String arti_id = request.getParameter("arti_id");
		String title = request.getParameter("title");
		String arti_txt = request.getParameter("arti_txt");
		String board_id = request.getParameter("board_id");
		String sql = "update article set title = '" + title + "', ";
		sql += "arti_txt = '" + arti_txt + "', board_id = '" + board_id + "' where arti_id=" + arti_id;
		try {			
			PreparedStatement stm1 = con.prepareStatement(sql);
			stm1.executeUpdate();
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
