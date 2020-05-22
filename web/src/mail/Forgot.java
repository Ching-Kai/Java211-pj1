package mail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql_connection.Connection_sql;


/**
 * Servlet implementation class Forgot
 */
@WebServlet("/forgot")
public class Forgot extends HttpServlet {
	protected void doPost(
            HttpServletRequest request, HttpServletResponse response) 
                    throws ServletException, IOException {
        String account = request.getParameter("account");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday");
//System.out.append(account+email+birthday);
//        UserService userService =
//                (UserService) getServletContext().getAttribute("userService");
//        Optional<Account> optionalAcct = userService.accountByNameEmail(name, email);
//        
//        if(optionalAcct.isPresent()) {
//            EmailService emailService = 
//                    (EmailService) getServletContext().getAttribute("emailService");
//            emailService.passwordResetLink(optionalAcct.get());
//        }
        
//        request.setAttribute("email", email);
//        request.getRequestDispatcher("/WEB-INF/jsp/forgot.jsp")
//               .forward(request, response);
        
        
        Connection_sql conn = new Connection_sql();
		conn.connection();
		Connection con = conn.con;
		PreparedStatement preparedStatement = null;
		ResultSet result = conn.result;
		String sql = "";
		String account_ID;
		String password;
		sql = "select account_ID,password from gossipboard.user where account=? and email=? and birthday=?";
		
		 try {
			preparedStatement =con.prepareStatement(sql);
			preparedStatement.setString(1,account);
			preparedStatement.setString(2,email);
			preparedStatement.setString(3,birthday);
			result = preparedStatement.executeQuery();
			if(result.next()){//確認是否正確
				HttpSession session = request.getSession();
				session.setAttribute("account", account);
				session.setAttribute("email", email);
				session.setAttribute("birthday", birthday);
				account_ID=result.getString(1);
				password=result.getString(2);
				
				session.setAttribute("account_ID", account_ID);
				session.setAttribute("password", password);
				response.sendRedirect("Send");
			}else {
				
				
				
			}
			
		} catch (SQLException e) {
			
		}
        
        
        
        
        
        
        
        
        
    }
}
