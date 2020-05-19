package sql_connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connection_sql {
	public Connection con = null;
	public Statement stm = null;
	public ResultSet result = null;

	public void connection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("驅動程式失敗!");
		}
		String url = "jdbc:mysql://localhost:8888/gossip_board?serverTimezone=UTC";
		try {
			con = DriverManager.getConnection(url, "root", "1234");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("資料庫連線失敗!");
		}
		try {
			stm = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("物件創建失敗!");
		}
	}
}
