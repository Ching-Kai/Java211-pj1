package admin.other;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Search_count {	
	public int count(ResultSet result) {
		int count = 0;
		ResultSet res = result;
		try {
			while (res.next()) {
				count++;
			}
			res.beforeFirst();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
