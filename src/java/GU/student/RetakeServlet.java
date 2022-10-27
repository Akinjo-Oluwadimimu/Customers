package GU.student;

import GU.business.Course;
import GU.business.ProgressTracker;
import GU.business.RetakeReceiptInformation;
import GU.business.Student;
import GU.data.ProgressTrackerIO;
import GU.data.RetakeIO;
import java.io.File;
import java.io.IOException;
import static java.lang.System.out;
import java.text.SimpleDateFormat;
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

public class RetakeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();               
        String url = "/retake_application.jsp";
        // get current action
        String action = request.getParameter("action");
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
        String action = request.getParameter("action");
        if (action == null) {
                action = "uploadRetakeReceipt";  // default action
            }
        String url = "/applications/retake_application.jsp";
        if (action.equals("uploadRetakeReceipt")) {
        Student student = (Student) session.getAttribute("student");
        String engname = student.getEngName();
        String cnname = student.getCnName();
        String studentId = student.getId();
        String classId = student.getClassid();
        boolean approved = false;
        String receipt = "";
        Date submissiondate = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String submissionDate = ft.format(submissiondate);
        File file ;
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000 * 1024;
        ServletContext context = getServletContext();

        // Verify the content type
        String contentType = request.getContentType();
        RetakeReceiptInformation retakeReceiptInformation = new RetakeReceiptInformation();
        retakeReceiptInformation.setId(studentId);
        retakeReceiptInformation.setEngname(engname);
        retakeReceiptInformation.setCnname(cnname);
        retakeReceiptInformation.setSubmissionDate(submissionDate);
        retakeReceiptInformation.setApproved(approved);
        retakeReceiptInformation.setClassid(classId);
        String filePath = "D:\\GreenwoodUniversity\\RetakeReceipt\\"+classId+"\\";
        if ((contentType.contains("multipart/form-data"))) {
           DiskFileItemFactory factory = new DiskFileItemFactory();
           // maximum size that will be stored in memory
           factory.setSizeThreshold(maxMemSize);

           // Location to save data that is larger than maxMemSize.
           factory.setRepository(new File("D:\\GreenwoodUniversity\\RetakeReceipt\\temp\\"));

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
                    
                    receipt=newfilename;
                    retakeReceiptInformation.setReceipt(receipt);

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
        
        RetakeIO.setRetakeReceiptInformationDB(retakeReceiptInformation);
        boolean retakeReceiptStatus =RetakeIO.retakeReceiptStatus(studentId);
        session.setAttribute("retakeReceiptStatus", retakeReceiptStatus);
        ProgressTrackerIO.updateTaskDB(studentId, 6, true);
        ProgressTrackerIO.updateProgressDB(studentId, 35);
        ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
        session.setAttribute("progressList", progressList);
        session.setAttribute("progress", 35);
        request.setAttribute("receiptUpload", "success");
        url = "/applications/retake_application.jsp";
     } 
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
        }
    }

