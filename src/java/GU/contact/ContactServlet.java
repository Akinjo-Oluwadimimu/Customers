/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package GU.contact;

import GU.util.MailUtil126;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        // perform action and set URL to appropriate page
        String url = "/index.jsp";
        if (action.equals("contact")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            
            String to="oluwadimimuakinjo@126.com";
            String from="oluwadimimuakinjo@126.com";
            subject = name+": "+subject;
            String body = "<p>"+message+"</p>"
                    + "<br> <p>This message was originally sent by: "+email+"</p>";
            boolean bodyIsHTML=true;
            try {
                MailUtil126.sendMail(to, from, subject, body, bodyIsHTML);
            } catch (MessagingException ex) {
                Logger.getLogger(ContactServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("sentstatus", "failed");
              }
            request.setAttribute("sentstatus", "success");
            url="/contact.jsp";
        }
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

}
