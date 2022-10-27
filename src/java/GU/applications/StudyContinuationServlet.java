package GU.applications;

import GU.business.ProgressTracker;
import GU.business.Student;
import GU.data.ProgressTrackerIO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StudyContinuationServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        String action = request.getParameter("action");
        
        String url = "/course_remarking.jsp";
        if (action.equals("studyContinuation")) {
            Student student = (Student) session.getAttribute("student");
            String studentId = student.getId();
            Date date = new Date( );
            SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
            String registrationDate = ft.format(date);
            ProgressTrackerIO.setRegistration(studentId, "Proceed", registrationDate);
            ProgressTrackerIO.updateTaskDB(studentId, 1, true);
            ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
            session.setAttribute("progressList", progressList);
            ProgressTrackerIO.updateProgressDB(studentId, 10);
            session.setAttribute("progress", 10);
            url = "/applications/continuation_success.jsp";
            } 
            // forward to the view
            getServletContext()
                    .getRequestDispatcher(url)
                    .forward(request, response);
            }
}
