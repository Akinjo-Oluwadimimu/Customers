package GU.student;

import GU.business.Course;
import GU.business.CourseRemarking;
import GU.business.Student;
import GU.data.CourseRemarkingIO;
import java.io.File;
import java.io.IOException;
import static java.lang.System.out;
import java.text.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

public class CourseRemarkingServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {
       
        }

    @Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {  
        HttpSession session=request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
                action = "uploadEvidence";  // default action
            }
        String url = "/course_remarking.jsp";
        if (action.equals("uploadEvidence")) {
        Student student = (Student) session.getAttribute("student");
        String name = student.getEngName();
        String studentId = student.getId();
        String phone = student.getPhone();
        
        File file ;
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000 * 1024;
        ServletContext context = getServletContext();
        ArrayList<String> imagepath=new ArrayList<String>();  

        // Verify the content type
        String contentType = request.getContentType();
        String selectedCourse = (String) session.getAttribute("selectedCourse");
        String classno = (String) session.getAttribute("classId");
        String lecturer = (String) session.getAttribute("lecturer");
        String courseId = (String) session.getAttribute("courseId");
        String currentResult = (String) session.getAttribute("currentGrade");
        String expectedResult = (String) session.getAttribute("expectedResult");
        String applicationReason = (String) session.getAttribute("applicationReason");
        String supportingEvidence = (String) session.getAttribute("supportingEvidence");
        String applicationDate = (String) session.getAttribute("applicationDate");
        
        CourseRemarking courseremarking = new CourseRemarking();
        courseremarking.setApplicationReason(applicationReason);
        courseremarking.setClassid(classno);
        courseremarking.setCourseId(courseId);
        courseremarking.setCourseTitle(selectedCourse);
        courseremarking.setCurrentResult(currentResult);
        courseremarking.setId(studentId);
        courseremarking.setLecturer(lecturer);
        courseremarking.setName(name);
        courseremarking.setPhone(phone);
        courseremarking.setSupportingEvidence(supportingEvidence);
        courseremarking.setExpectedResult(expectedResult);
        courseremarking.setEvidenceOne("");
        courseremarking.setEvidenceTwo("");
        courseremarking.setEvidenceThree("");
        courseremarking.setApplicationDate(applicationDate);
        
        String filePath = "D:\\GreenwoodUniversity\\CourseRechecking\\"+courseId+"\\";
        if ((contentType.contains("multipart/form-data"))) {
           DiskFileItemFactory factory = new DiskFileItemFactory();
           // maximum size that will be stored in memory
           factory.setSizeThreshold(maxMemSize);

           // Location to save data that is larger than maxMemSize.
           factory.setRepository(new File("D:\\GreenwoodUniversity\\CourseRechecking\\temp\\"));

           // Create a new file upload handler
           ServletFileUpload upload = new ServletFileUpload(factory);

           // maximum file size to be uploaded.
           upload.setSizeMax( maxFileSize );

           try { 
              // Parse the request to get file items.
              List fileItems = upload.parseRequest(new ServletRequestContext(request));

              // Process the uploaded file items
              Iterator i = fileItems.iterator();
              int j = 0;
              while ( i.hasNext () ) {
                 FileItem fi = (FileItem)i.next();
                 if ( !fi.isFormField () ) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    //this genrates unique file name
                    String id = UUID.randomUUID().toString();
                    id = studentId + "-" +id;
                    //we are splitting file name here such that we can get file name and extension differently
                    String[] fileNameSplits = fileName.split("\\.");
                   // extension is assumed to be the last part
                    int extensionIndex = fileNameSplits.length - 1;
                    // add extension to id
                    String newfilename= id + "." + fileNameSplits[extensionIndex];
                    //this stores the new file name to arraylist so that it cn be stored in database
                    imagepath.add(newfilename);  

                    File uploadedFile = new File(filePath , newfilename);   
                    fi.write(uploadedFile);
                    out.println("Uploaded Filename: " + filePath + 
                    newfilename + "<br>");
                 }
              }
              out.println("</body>");
              out.println("</html>");
           } catch(Exception ex) {
              out.println(ex);
           }
        } 

        else {
           out.println("<html>");
           out.println("<head>");
           out.println("<title>Servlet upload</title>");  
           out.println("</head>");
           out.println("<body>");
           out.println("<p>No file uploaded</p>"); 
           out.println("</body>");
           out.println("</html>");
        }
        
        for (int j=0;j<imagepath.size();j++){
            if (j==0){
                courseremarking.setEvidenceOne(imagepath.get(j));
            } else if (j==1){
                courseremarking.setEvidenceTwo(imagepath.get(j));
            } else if (j==2){
                courseremarking.setEvidenceThree(imagepath.get(j));
            }
        }
        CourseRemarkingIO.updateCourseRemarkingDB(courseremarking);
        url = "/index.jsp";
     } else if (action.equals("courseRemarking")) {
        Student student = (Student) session.getAttribute("student");
        String name = student.getEngName();
        String studentId = student.getId();
        String phone = student.getPhone();
        
        ArrayList<Course> courseList=(ArrayList<Course>)session.getAttribute("courseList");
        String selectedCourse = request.getParameter("courseName");
        String grade = "";
        String classId = "";
        String lecturer = "";
        String courseId = "";
        for(int i=0;i<courseList.size();i++){
            if (courseList.get(i).getCourseTitle().equals(selectedCourse)){
                     grade = courseList.get(i).getGrade();
                     classId = courseList.get(i).getClassid();
                     lecturer = courseList.get(i).getLecturer();
                     courseId = courseList.get(i).getCourseId();
                 }
        }
        session.setAttribute("selectedCourse", selectedCourse);
        session.setAttribute("currentGrade", grade);
        session.setAttribute("classId", classId);
        session.setAttribute("lecturer", lecturer);
        session.setAttribute("courseId", courseId);
        session.setAttribute("expectedResult", request.getParameter("expectedResult"));
        session.setAttribute("applicationReason", request.getParameter("applicationReason"));
        session.setAttribute("supportingEvidence", request.getParameter("supportingEvidence"));
        
        Date applicationDate = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
        
        CourseRemarking courseremarking = new CourseRemarking();
        courseremarking.setApplicationReason(request.getParameter("applicationReason"));
        courseremarking.setClassid(classId);
        courseremarking.setCourseId(courseId);
        courseremarking.setCourseTitle(selectedCourse);
        courseremarking.setCurrentResult(grade);
        courseremarking.setId(studentId);
        courseremarking.setLecturer(lecturer);
        courseremarking.setName(name);
        courseremarking.setPhone(phone);
        courseremarking.setSupportingEvidence(request.getParameter("supportingEvidence"));
        courseremarking.setExpectedResult(request.getParameter("expectedResult"));
        courseremarking.setEvidenceOne("");
        courseremarking.setEvidenceTwo("");
        courseremarking.setEvidenceThree("");
        courseremarking.setApplicationDate(ft.format(applicationDate));
        session.setAttribute("applicationDate", ft.format(applicationDate));
        CourseRemarkingIO.setCourseRemarkingDB(courseremarking);
        request.setAttribute("stored", "success");
        url = "/applications/course_remarking.jsp";
        }
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
        }
}
