package GU.admin;

import GU.business.Student;
import GU.business.Supervisor;
import GU.business.User;
import GU.data.StudentIO;
import GU.data.SupervisorIO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NewUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String url = "/admin/admin.jsp";
        if (action.equals("newStudent")) {
        Student student = new Student();
        student.setEngName(request.getParameter("engName"));
        request.setCharacterEncoding("UTF-8");
        String chineseName = new String(request.getParameter("cnName").getBytes("ISO-8859-1"), "UTF-8");
        student.setCnName(chineseName);
        student.setClassid(request.getParameter("classid"));
        student.setId(request.getParameter("id"));
        student.setDob(request.getParameter("dob"));
        student.setGender(request.getParameter("gender"));
        student.setMajor(request.getParameter("major"));
        student.setEmail(request.getParameter("email"));
        student.setPhone(request.getParameter("phone"));
        student.setNationality(request.getParameter("country"));
        student.setPassportNo(request.getParameter("passportNo"));
        StudentIO.setStudentDB(student);
        
        User user = new User();
        user.setUsername(request.getParameter("id"));
        user.setPassword("123");
        user.setUsertype("student");
        user.setChangepassword(1);
        StudentIO.setUserDB(user);
        ArrayList<Student> studentList=StudentIO.getStudentListDB();
        session.setAttribute("studentList", studentList);
        request.setAttribute("status", "success");
        url = "/admin/student.jsp";
        } else if (action.equals("newSupervisor")) {
        Supervisor supervisor = new Supervisor();
        supervisor.setName(request.getParameter("name"));
        supervisor.setId(request.getParameter("id"));
        supervisor.setDepartment(request.getParameter("department"));
        SupervisorIO.setSupervisorDB(supervisor);
        
        ArrayList<Supervisor> supervisorList=SupervisorIO.getSupervisorDB();
        session.setAttribute("supervisorList", supervisorList);
        request.setAttribute("status", "success");
        url = "/admin/lecturer.jsp";
        } 
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
  
    