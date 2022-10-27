package GU.applications;

import GU.business.Course;
import GU.business.ProgressTracker;
import GU.business.RetakeApplication;
import GU.business.Student;
import GU.data.ProgressTrackerIO;
import GU.data.RetakeIO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RetakeApplicationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        
        String url = "/retake_application.jsp";
        // get current action
        String action = request.getParameter("action");
            if (action == null) {
                action = "viewFailedCourses";  // default action
            }
            
            // perform action and set URL to appropriate page
            if (action.equals("viewFailedCourses")) {

            
            
            Student student=(Student)session.getAttribute("student");
            String studentID = student.getId();
            
            ArrayList<Course> failedCoursesList=new  ArrayList<Course>();
            failedCoursesList = RetakeIO.getFailedcourses(studentID);
            session.setAttribute("failedCoursesList", failedCoursesList);
            
            int failedCourses = failedCoursesList.size();
            session.setAttribute("failedCourses", failedCourses);
            
                url = "/retake_application.jsp";
            } else if (action.equals("generateInvoice")){
            String[] s = request.getParameterValues("ckb");
            
            ArrayList<Course> failedCoursesList=new  ArrayList<Course>();
            failedCoursesList = (ArrayList<Course>) session.getAttribute("failedCoursesList");
            
            ArrayList<Course> selectedCoursesList=new  ArrayList<Course>();
            selectedCoursesList = RetakeIO.retakeInvoice(failedCoursesList, s);
            session.setAttribute("selectedCoursesList", selectedCoursesList);
            
            url="/retake_invoice.jsp";
            } else if (action.equals("retakeinfo")){
                       
            
            
            url="/retake_invoice.jsp";
            }
        
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        
        String url = "/applications/retake_application.jsp";
        // get current action
        String action = request.getParameter("action");
            // perform action and set URL to appropriate page
            if (action.equals("submitApplication")) {
            Student student=(Student)session.getAttribute("student");
            String studentID = student.getId();
            String[] s = request.getParameterValues("ckb");
            
            ArrayList<Course> failedCoursesList=new  ArrayList<Course>();
            failedCoursesList = (ArrayList<Course>) session.getAttribute("failedCoursesList");
            
            RetakeIO.setRetakeApplicationDB(failedCoursesList, s, studentID);
            ArrayList<RetakeApplication> retakeApplicationList =new  ArrayList<RetakeApplication>();
            retakeApplicationList = RetakeIO.getRetakeApplicationDB(studentID);
            session.setAttribute("retakeApplicationList", retakeApplicationList);

            int retakeApplications = retakeApplicationList.size();
            session.setAttribute("retakeApplications", retakeApplications);
            
            int total = RetakeIO.getTotal(failedCoursesList, retakeApplicationList);
            session.setAttribute("total", total);
             url="/applications/retake_application.jsp";
            }
        
            // forward to the view
            getServletContext()
                    .getRequestDispatcher(url)
                    .forward(request, response);
    }
}