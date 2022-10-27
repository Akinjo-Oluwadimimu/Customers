/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package GU.applications;

import GU.business.ProgressTracker;
import GU.business.Student;
import GU.business.StudySuspension;
import GU.data.ProgressTrackerIO;
import GU.data.StudySuspensionIO;
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

public class StudySuspensionServlet extends HttpServlet {

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
        if(action==null){
            action="suspension";
        }
        String url = "/course_remarking.jsp";
        if (action.equals("suspension")) {
        Student student = (Student) session.getAttribute("student");
        String studentId = student.getId();
        String studentClass = student.getClassid();
        
        StudySuspension studySuspension = new StudySuspension();
        studySuspension.setId(studentId);
        
        String reason="";
        Date applicationDate = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        studySuspension.setDate(ft.format(applicationDate));
        
        File file ;
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000 * 1024;
        ServletContext context = getServletContext();
        ArrayList<String> imagepath=new ArrayList<String>();  

        // Verify the content type
        String contentType = request.getContentType();
        
        String filePath = "D:\\GreenwoodUniversity\\SuspendStudy\\"+studentClass+"\\";
        if ((contentType.contains("multipart/form-data"))) {
           DiskFileItemFactory factory = new DiskFileItemFactory();
           // maximum size that will be stored in memory
           factory.setSizeThreshold(maxMemSize);

           // Location to save data that is larger than maxMemSize.
           factory.setRepository(new File("D:\\GreenwoodUniversity\\temp\\"));

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
                    studySuspension.setEvidence(newfilename);

                    File uploadedFile = new File(filePath , newfilename);   
                    fi.write(uploadedFile);
                    out.println("Uploaded Filename: " + filePath + 
                    newfilename + "<br>");
                 }
                 else if (fi.isFormField()) {
      if(fi.getFieldName().equals("applicationReason"))
        {   
          reason=fi.getString();
          studySuspension.setSuspensionreason(reason);
        }

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
        
        StudySuspensionIO.setStudySuspensionInfoDB(studySuspension);
        ArrayList<ProgressTracker> progressList = ProgressTrackerIO.getProgressListDB(studentId);
        session.setAttribute("progressList", progressList);
        session.setAttribute("progress", 10);
        url = "/applications/suspension_success.jsp";
        } 
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
        }
}