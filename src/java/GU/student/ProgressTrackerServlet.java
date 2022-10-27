
package GU.student;

import GU.business.GraduationProject;
import GU.business.ProgressTracker;
import GU.business.ProjectSurvey;
import GU.business.Student;
import GU.data.GraduationProjectIO;
import GU.data.ProgressTrackerIO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProgressTrackerServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        Student student = (Student) session.getAttribute("student");
        String studentId = student.getId();
        String url = "/student/progress_tracker.jsp";
        // get current action
        String action = request.getParameter("action");
         
            // perform action and set URL to appropriate page
            if (action.equals("feeStatement")){
            ProgressTrackerIO.updateTaskDB(studentId, 2, true);
            ProgressTrackerIO.updateProgressDB(studentId, 15);
            ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
            session.setAttribute("progressList", progressList);
            session.setAttribute("progress", 15);
            request.setAttribute("status", "feeDone");
            url="/student/progress_tracker.jsp";
            } else if (action.equals("projectSurvey")){
            boolean startStatus=false;
            boolean supervisorContact=false;
            String start = request.getParameter("projectProgress");
            String contact = request.getParameter("supervisorContact");
            String comment = request.getParameter("comment");
            if("Yes".equals(start)){
                startStatus=true;
            } else{
                startStatus=false;
            }
            if("Yes".equals(contact)){
                supervisorContact=true;
            } else{
                supervisorContact=false;
            }
            ProjectSurvey projectSurvey = new ProjectSurvey();
            projectSurvey.setStudentId(studentId);
            projectSurvey.setStartStatus(startStatus);
            projectSurvey.setSupervisorContact(supervisorContact);
            projectSurvey.setComment(comment);
            ProgressTrackerIO.setProjectSurvey(projectSurvey);
            ProgressTrackerIO.updateTaskDB(studentId, 9, true);
            ProgressTrackerIO.updateTaskDB(studentId, 10, true);
            ProgressTrackerIO.updateProgressDB(studentId, 50);
            ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
            session.setAttribute("progressList", progressList);
            session.setAttribute("progress", 50);
            request.setAttribute("status", "surveyDone");
            url="/student/progress_tracker.jsp";
            } else if (action.equals("resultOverview")){
            ProgressTrackerIO.updateTaskDB(studentId, 3, true);
            ProgressTrackerIO.updateTaskDB(studentId, 4, true);
            ProgressTrackerIO.updateProgressDB(studentId, 25);
            ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
            session.setAttribute("progressList", progressList);
            session.setAttribute("progress", 25);
            request.setAttribute("status", "resultDone");
            url="/student/progress_tracker.jsp";
            } else if (action.equals("officialDocument")){
            ProgressTrackerIO.updateTaskDB(studentId, 8, true);
            ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
            session.setAttribute("progressList", progressList);
            request.setAttribute("status", "documentDone");
            url="/student/progress_tracker.jsp";
            } else if (action.equals("graduationProject")){
            request.setCharacterEncoding ("UTF-8");
            String projectTitle=request.getParameter("projectTitle");
            String supervisor = new String(request.getParameter("supervisor").getBytes("ISO-8859-1"), "UTF-8");
            String submissionDate=request.getParameter("submissionDate");
            GraduationProject graduationProject = new GraduationProject();
            graduationProject.setProjectTitle(projectTitle);
            graduationProject.setStudentId(studentId);
            graduationProject.setSubmissionDate(submissionDate);
            graduationProject.setSupervisor(supervisor);
            GraduationProjectIO.setGraduationProjectDB(graduationProject);
            session.setAttribute("graduationProject", graduationProject);
            ProgressTrackerIO.updateTaskDB(studentId, 7, true);
            ProgressTrackerIO.updateProgressDB(studentId, 40);
            ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
            session.setAttribute("progressList", progressList);
            session.setAttribute("progress", 40);
            request.setAttribute("status", "gradProjectDone");
            url="/student/progress_tracker.jsp";
            } else if (action.equals("profileCheck")){
            ProgressTrackerIO.updateTaskDB(studentId, 5, true);
            int failedCourses = (int) session.getAttribute("failedCourses");
            boolean retakeReceiptStatus = (boolean) session.getAttribute("retakeReceiptStatus");
            if (failedCourses==0){
                ProgressTrackerIO.updateTaskDB(studentId, 6, true);
                ProgressTrackerIO.updateProgressDB(studentId, 35);
                ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
                session.setAttribute("progressList", progressList);
                session.setAttribute("progress", 35);
            } else{
                if (retakeReceiptStatus==true){
                ProgressTrackerIO.updateTaskDB(studentId, 6, true);
                ProgressTrackerIO.updateProgressDB(studentId, 35);
                ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
                session.setAttribute("progressList", progressList);
                session.setAttribute("progress", 35);
            } else{
                ProgressTrackerIO.updateProgressDB(studentId, 30);
                ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
                session.setAttribute("progressList", progressList);
                session.setAttribute("progress", 30);
                }
            }
            request.setAttribute("status", "profileDone");
            url="/student/progress_tracker.jsp";
            } 
        // forward to the view
            getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
