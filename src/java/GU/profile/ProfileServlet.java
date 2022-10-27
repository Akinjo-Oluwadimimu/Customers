package GU.profile;

import GU.business.ProgressTracker;
import GU.business.Student;
import GU.data.ProgressTrackerIO;
import GU.data.StudentIO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        Student student=(Student)session.getAttribute("student");
        String studentID = student.getId();
        String action = request.getParameter("action");
        
        // perform action and set URL to appropriate page
        String url = "/index.jsp";
        String gender = "";
        if (action.equals("modifyInformation")) {
            student.setEngName(request.getParameter("studentEngName"));
            student.setDob(request.getParameter("studentDOB"));
            student.setGender(request.getParameter("gender"));
            student.setNationality(request.getParameter("country"));
            student.setPhone(request.getParameter("studentPhone"));
            student.setEmail(request.getParameter("studentEmail"));
            student.setPassportNo(request.getParameter("studentPassportNo"));
            StudentIO.updateStudentDB(student, studentID);
            
            session.setAttribute("nationality",student.getNationality());
            
            gender = request.getParameter("gender");
            if (gender.equals("F")){
                student.setGender("Female");
                session.setAttribute("gender", "Female");
            } else{
                student.setGender("Male");
                session.setAttribute("gender", "Male");
            } 
            ProgressTrackerIO.updateTaskDB(studentID, 5, true);
            ProgressTrackerIO.updateProgressDB(studentID, 30);
            ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentID);
            session.setAttribute("progressList", progressList);
            session.setAttribute("progress", 30);
            request.setAttribute("status", "profileDone");
            session.setAttribute("student", student);
            request.setAttribute("infoUpdateStatus", "success");
            
            url="/student/progress_tracker.jsp";
        } 
        
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
        }
    }