package GU.util;

import GU.contact.ContactServlet;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class MailUtil126 {
    public static void sendMail(String to, String from, String subject, String body, boolean bodyIsHTML) throws MessagingException{
        //sending the notification email to the user's email account
            final String username="oluwadimimuakinjo@126.com";
            final String password = "JTSPMIWTGUJDLBIK";      
            Properties props = new Properties();
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", "smtp.126.com");
            props.put("mail.smtp.port", "25");
            props.put("mail.smtp.auth", "true");
            
            Session session1 = Session.getDefaultInstance(props);
            session1.setDebug(true);
            
            Message message = new MimeMessage(session1);
            try {
                message.setSubject(subject);
                if(bodyIsHTML){
                    message.setContent(body, "text/html; charset=utf-8");
                }else
                    message.setText(body);
            
                Address fromAddress = new InternetAddress(from);
                Address toAddress = new InternetAddress(to);
                message.setFrom(fromAddress);
                message.setRecipient(Message.RecipientType.TO, toAddress);
                
                Transport transport = session1.getTransport();
                transport.connect(username, password);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                
            } catch (AddressException ex) {
                Logger.getLogger(ContactServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(ContactServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
    }
}
