package mail;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(
	    urlPatterns={"/mail"},
	    initParams={
	        @WebInitParam(name = "host", value = "smtp.gmail.com"),
	        @WebInitParam(name = "port", value = "587"),
	        @WebInitParam(name = "username", value = "yourname@gmail.com"),//需再改
	        @WebInitParam(name = "password", value = "yourpassword")//需再改
	    }
	)
	public class Sendmail extends HttpServlet {
	
	

	
	
	
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

	    protected void doPost(HttpServletRequest request,
	                               HttpServletResponse response)
	                                     throws ServletException, IOException {
	        request.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");

	        
	    	HttpSession session = request.getSession();
	        String account= (String) session.getAttribute("account");
	        String email= (String) session.getAttribute("email");
	        String account_ID= (String) session.getAttribute("account_ID");
	        
	        
	        String text1="<a href='Resetpasswd.jsp'>按此重設密碼</a>";
	        
	        String from = request.getParameter("from");
	        String to = email;
	        String subject = "密碼重設";
	        String text = text1;
	        
	        try {
	            Message message = createMessage(from, to, subject, text);
	            Transport.send(message);  
	            response.getWriter().println("郵件傳送成功");
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
	}
