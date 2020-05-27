package admin.other;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(
	    urlPatterns={"/Check"},
	    initParams={
	        @WebInitParam(name = "admin", value = "JAVA211"),
	        @WebInitParam(name = "passwd", value = "JAVA612"),        
	    }
	)
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	 private String admin = getInitParameter("admin");
	 private String passwd = getInitParameter("passwd");
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 String account= (String) session.getAttribute("admin");
		 String password= (String) session.getAttribute("passwd");

	    
		 
		 
		 if(account.equals(admin)&&password.equals(passwd)) {
			 response.sendRedirect("edit.jsp");
		 }else {
			 response.sendRedirect("adminlogin.jsp");
		 }
		
		doGet(request, response);
	}

}
