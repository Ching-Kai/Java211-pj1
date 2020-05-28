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
		name="Check",
	    urlPatterns={"/Check"},
	    initParams={
	        @WebInitParam(name = "admin", value = "1234"),
	        @WebInitParam(name = "passwd", value = "1234"),        
	    }
	)
public class Check extends HttpServlet {
	
	 private String admin ;
	 private String passwd ;
	
	 public void init() throws ServletException{
		 admin=getInitParameter("admin");
		 passwd=getInitParameter("passwd");
	 }
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		 
		 
		 String account= request.getParameter("admin");
		 String password= request.getParameter("passwd");

		 	
		 
		 if(admin.equals(account)&&passwd.equals(password)) {
			 request.getSession().setAttribute("auth", 100);
			 
			 response.sendRedirect("admin/edit.jsp");
		 }else {
			 
			 response.sendRedirect("admin/adminlogin.jsp");
		 }
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		doGet(request, response);
	}

}
