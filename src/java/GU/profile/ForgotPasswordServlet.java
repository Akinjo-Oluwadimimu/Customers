package GU.profile;

import GU.business.User;
import GU.contact.ContactServlet;
import GU.data.StudentIO;
import GU.util.MailUtil126;
import java.io.IOException;
import java.security.SecureRandom;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ForgotPasswordServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String url = "/index.jsp";
        if (action.equals("validateEmail")) {
        String studentID=request.getParameter("username");
        String email=request.getParameter("email");
        session.setAttribute("username", studentID);
        session.setAttribute("useremail", email);
        boolean status = StudentIO.ValidateEmailDB(studentID, email);
        if (status==true){
            User user=new User();
            user.setUsername(studentID);
            user.setUsertype("student");
            user.setChangepassword(1);
            session.setAttribute("user", user);
            session.setAttribute("useremail", email);
            // sending otp
            SecureRandom rand = new SecureRandom();
            String otpvalue = new DecimalFormat("000000").format(rand.nextInt(125565));
            String to=email;
            String from="oluwadimimuakinjo@126.com";
            String subject = "Greenwood University: OTP";
            String body = "<p>Your OTP is: <b>" + otpvalue + "</b>. Please enter this value in the page you are redirected to on University's website.</p>";
            boolean bodyIsHTML=true;
            try {
                MailUtil126.sendMail(to, from, subject, body, bodyIsHTML);
            } catch (MessagingException ex) {
                Logger.getLogger(ContactServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("sentstatus", "failed");
              }
            email=email.replaceAll("(\\G(?!^)|^[^@]{2})[^@](?=[^@]{2,}@)", "$1*");
            request.setAttribute("OtpSentstatus", "success");
            request.setAttribute("message","OTP is sent to your email id");
	    session.setAttribute("otp",otpvalue); 
	    session.setAttribute("email",email); 
            url="/validate_OTP.jsp";
        } else{
            request.setAttribute("OtpSentstatus", "failed");
            url="/forgot_password.jsp";
        } 
   } else if (action.equals("validateOtp")) {
       String first = request.getParameter("first");
       String second = request.getParameter("second");
       String third = request.getParameter("third");
       String fourth = request.getParameter("fourth");
       String fifth = request.getParameter("fifth");
       String sixth = request.getParameter("sixth");
       String value = first+second+third+fourth+fifth+sixth;
       String otp=(String)session.getAttribute("otp");
		if (value.equals(otp)) 
		{
                    request.setAttribute("status", "success");
			  url = "/set_password.jsp";
		}
		else
		{
			request.setAttribute("status","failed");
                        url = "/validate_OTP.jsp";
		}
   }
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
  
    