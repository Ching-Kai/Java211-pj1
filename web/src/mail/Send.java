package mail;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;



import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet implementation class Send
 */
@WebServlet(
	    urlPatterns={"/Send"},
	    initParams={
	        @WebInitParam(name = "host", value = "smtp.gmail.com"),
	        @WebInitParam(name = "port", value = "587"),
	        @WebInitParam(name = "username", value = "JAVA211612@gmail.com"),
	        @WebInitParam(name = "password", value = "JA612211")
	    }
	)
public class Send extends HttpServlet {

	
  
	  private String host;
	    private int port;
	    private String username;
	    private String password;
	    private Properties props;
	@Override
    public void init() throws ServletException {
		
		host = getServletConfig().getInitParameter("host");
	    port = Integer.parseInt(getServletConfig().getInitParameter("port"));
	    username = getServletConfig().getInitParameter("username");
	    password = getServletConfig().getInitParameter("password");
	    
        props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", port);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");
	        
	        //String from = request.getParameter("from");
	        //String to = request.getParameter("to");
	        //String subject = request.getParameter("subject");
	        //String text = request.getParameter("text");
	        
	    	HttpSession session = request.getSession();
	        //String account= (String) session.getAttribute("account");
	        String email= (String) session.getAttribute("email");
	        //String account_ID= (String) session.getAttribute("account_ID");
	        String password= (String) session.getAttribute("password");
	        
	        
	       // String text1="<a href='Resetpasswd.jsp'>按此重設密碼</a>";
	        
	        String from = "JAVA211612@gmail.com";
	        String to = email;
	        String subject = "密碼重設";
	        String a="你的密碼是  "+password;
	        String text = a;
	        
	        try {
	            Message message = createMessage(from, to, subject, text);
	            Transport.send(message);  
	            response.getWriter().println("郵件傳送成功");
	            session.invalidate();
	            response.sendRedirect("sendfinish.html");
	        } catch (MessagingException e) {
	            throw new RuntimeException(e);
	        }
		}

	    private Message createMessage(
	            String from, String to, String subject, String text)
	                              throws MessagingException {
	        Session session = Session.getInstance(props, new Authenticator() {  
	            protected PasswordAuthentication getPasswordAuthentication() {  
	                return new PasswordAuthentication(username, password);  
	            }} 
	        );  
	        
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(from));
	        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
	        message.setSubject(subject);
	        message.setSentDate(new Date());
	        message.setText(text);
	        
	        return message;
	}
//    protected void doPost(HttpServletRequest request,
//                               HttpServletResponse response)
//                                     throws ServletException, IOException {
//       
//    }

}

