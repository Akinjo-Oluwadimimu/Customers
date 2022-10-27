package GU.profile;

import GU.business.Country;
import GU.business.Course;
import GU.business.CourseRemarking;
import GU.business.FeeStatement;
import GU.business.ProgressTracker;
import GU.business.RetakeApplication;
import GU.business.RetakeInformation;
import GU.business.RetakeReceiptInformation;
import GU.business.Student;
import GU.business.Supervisor;
import GU.business.Transcript;
import GU.business.User;
import GU.data.CourseIO;
import GU.data.CourseRemarkingIO;
import GU.data.FeeStatementIO;
import GU.data.LoginIO;
import GU.data.ProgressTrackerIO;
import GU.data.RetakeIO;
import GU.data.StudentIO;
import GU.data.SupervisorIO;
import GU.data.TranscriptIO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
                User login = new User();
                login.setUsername(username);
                login.setPassword(password);
		
		LoginIO loginIO = new LoginIO();
		
		try {
			User user = loginIO.checkLogin(username, login);
			String url = "login.jsp";
			
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
                                session.setAttribute("username", username);
                                int changePassword = user.getChangepassword();
                                if (changePassword == 0){
                                String usertype = user.getUsertype();
                                session.setAttribute("usertype", usertype);
                                if("student".equals(usertype)){
                                    Student student = new Student();
                                    student = StudentIO.getStudentDB(username);
                                    session.setAttribute("student", student);
                                    
                                    FeeStatement feeStatement = FeeStatementIO.getFeeStatementDB(username);
                                    session.setAttribute("feeStatement", feeStatement);
                                    
                                    ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(username);
                                    session.setAttribute("progressList", progressList);
                                    
                                    int progress = ProgressTrackerIO.getProgressDB(username);
                                    session.setAttribute("progress", progress);
                                    
                                    ArrayList<Course> courseList = CourseIO.getCourseListDB(username);
                                    session.setAttribute("courseList", courseList);
                                    
                                    ArrayList<Course> failedCoursesList=new  ArrayList<Course>();
                                    failedCoursesList = RetakeIO.getFailedcourses(username);
                                    session.setAttribute("failedCoursesList", failedCoursesList);

                                    int failedCourses = failedCoursesList.size();
                                    session.setAttribute("failedCourses", failedCourses);
                                    
                                    ArrayList<RetakeApplication> retakeApplicationList =new  ArrayList<RetakeApplication>();
                                    retakeApplicationList = RetakeIO.getRetakeApplicationDB(username);
                                    session.setAttribute("retakeApplicationList", retakeApplicationList);

                                    int retakeApplications = retakeApplicationList.size();
                                    session.setAttribute("retakeApplications", retakeApplications);
                                    
                                    int total = RetakeIO.getTotal(failedCoursesList, retakeApplicationList);
                                    session.setAttribute("total", total);
                                    
                                    boolean retakeReceiptStatus =RetakeIO.retakeReceiptStatus(username);
                                    session.setAttribute("retakeReceiptStatus", retakeReceiptStatus);
                                    
                                    ArrayList<Transcript> result = TranscriptIO.getResultDB(username);
                                    session.setAttribute("result", result);
            
                                    ArrayList<Supervisor> supervisor = SupervisorIO.getSupervisorDB();
                                    session.setAttribute("supervisor", supervisor);
                                    
                                    session.setAttribute("nationality",student.getNationality());
                                    session.setAttribute("gender",student.getGender());
                                    
                                    ArrayList<Country> country = loginIO.getCountryDB();
                                    session.setAttribute("countryList", country);
                                    
                                    session.setAttribute("selectedCoursesListsize", 0);
                                    url = "/student/student.jsp";
                                } else if (usertype.equals("admin")){
                                    ArrayList<CourseRemarking> courseRemarkingList=CourseRemarkingIO.getRemarkingApplicationListDB();
                                    session.setAttribute("courseRemarkingList", courseRemarkingList);
                                    
                                    ArrayList<Student> studentList=StudentIO.getStudentListDB();
                                    session.setAttribute("studentList", studentList);
                                    
                                    ArrayList<RetakeInformation> retakeInformationList=RetakeIO.getRetakeInformationListDB();
                                    session.setAttribute("retakeInformationList", retakeInformationList);
                                    
                                    ArrayList<Country> country = loginIO.getCountryDB();
                                    session.setAttribute("countryList", country);
                                    
                                    ArrayList<FeeStatement> debt = FeeStatementIO.getDebtDB();
                                    session.setAttribute("debt", debt);
                                    
                                    ArrayList<Supervisor> supervisor = SupervisorIO.getSupervisorDB();
                                    session.setAttribute("supervisor", supervisor);
                                    
                                    
                                    ArrayList<RetakeReceiptInformation> retakeReceiptInformationList = RetakeIO.getRetakeReceiptInformationListDB();
                                    session.setAttribute("retakeReceiptInformationList", retakeReceiptInformationList);
                                    url = "/admin/admin.jsp";
                                }
				
                                } else {
                                    url = "set_password.jsp";
                                }
			} else {
				request.setAttribute("status", "failed");
                                url = "login.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		} catch (ClassNotFoundException ex) {
			throw new ServletException(ex);
		} catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
	}
}