package GU.student;

import GU.business.Student;
import GU.business.Transcript;
import GU.data.TranscriptIO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TranscriptServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        String url = "/student/transcript.jsp";
       
            Student student=(Student)session.getAttribute("student");
            String studentID = student.getId();
            
            ArrayList<Transcript> transcriptList=new  ArrayList<Transcript>();
            transcriptList = TranscriptIO.getTranscriptDB(studentID, "Freshman", 1);
            session.setAttribute("SFMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getTranscriptDB(studentID, "Freshman", 2);
            session.setAttribute("FFMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getTranscriptDB(studentID, "Sophomore", 3);
            session.setAttribute("SSMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getTranscriptDB(studentID, "Sophomore", 4);
            session.setAttribute("FSMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getTranscriptDB(studentID, "Junior", 5);
            session.setAttribute("SJtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getTranscriptDB(studentID, "Junior", 6);
            session.setAttribute("FJtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getTranscriptDB(studentID, "Senior", 7);
            session.setAttribute("SStranscriptList", transcriptList);
            
            Transcript TranscriptSummary=new  Transcript();
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Freshman", 1);
            double freshmantotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            double avg1 = TranscriptSummary.getTotal();
            session.setAttribute("SFMSummary", TranscriptSummary);
            
            
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Freshman", 2);
            double freshmantotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            double avg2 = TranscriptSummary.getTotal();
            session.setAttribute("FFMSummary", TranscriptSummary);
            
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Sophomore", 3);
            double sophomoretotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            double avg3 = TranscriptSummary.getTotal();
            session.setAttribute("SSMSummary", TranscriptSummary);
             
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Sophomore", 4);
            double sophomoretotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            double avg4 = TranscriptSummary.getTotal();
            session.setAttribute("FSMSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Junior", 5);
            double juniortotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            double avg5 = TranscriptSummary.getTotal();
            session.setAttribute("SJSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Junior", 6);
            double juniortotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            double avg6 = TranscriptSummary.getTotal();
            session.setAttribute("FJSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Senior", 7);
            double seniortotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            double avg7 = TranscriptSummary.getTotal();
            session.setAttribute("SSSummary", TranscriptSummary);
            
            double avg=avg1+avg2+avg3+avg4+avg5+avg6+avg7;
            double cgpa=(freshmantotal1+freshmantotal2+sophomoretotal1+sophomoretotal2+juniortotal1+
                    juniortotal2+seniortotal1)/(avg);
            avg=TranscriptIO.round(avg,1);
            cgpa=TranscriptIO.round(cgpa,3);
            session.setAttribute("avg", avg);
            session.setAttribute("cgpa", cgpa);
           
                
            
            transcriptList = TranscriptIO.getCnTranscriptDB(studentID, "Freshman", 1);
            session.setAttribute("CNSFMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getCnTranscriptDB(studentID, "Freshman", 2);
            session.setAttribute("CNFFMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getCnTranscriptDB(studentID, "Sophomore", 3);
            session.setAttribute("CNSSMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getCnTranscriptDB(studentID, "Sophomore", 4);
            session.setAttribute("CNFSMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getCnTranscriptDB(studentID, "Junior", 5);
            session.setAttribute("CNSJtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getCnTranscriptDB(studentID, "Junior", 6);
            session.setAttribute("CNFJtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getCnTranscriptDB(studentID, "Senior", 7);
            session.setAttribute("CNSStranscriptList", transcriptList);
            
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Freshman", 1);
            freshmantotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg1 = TranscriptSummary.getTotal();
            session.setAttribute("SFMSummary", TranscriptSummary);
            
            
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Freshman", 2);
            freshmantotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg2 = TranscriptSummary.getTotal();
            session.setAttribute("FFMSummary", TranscriptSummary);
            
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Sophomore", 3);
            sophomoretotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg3 = TranscriptSummary.getTotal();
            session.setAttribute("SSMSummary", TranscriptSummary);
             
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Sophomore", 4);
            sophomoretotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg4 = TranscriptSummary.getTotal();
            session.setAttribute("FSMSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Junior", 5);
            juniortotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg5 = TranscriptSummary.getTotal();
            session.setAttribute("SJSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Junior", 6);
            juniortotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg6 = TranscriptSummary.getTotal();
            session.setAttribute("FJSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getTranscriptSummary(studentID, "Senior", 7);
            seniortotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg7 = TranscriptSummary.getTotal();
            session.setAttribute("SSSummary", TranscriptSummary);
            
            avg=avg1+avg2+avg3+avg4+avg5+avg6+avg7;
            cgpa=(freshmantotal1+freshmantotal2+sophomoretotal1+sophomoretotal2+juniortotal1+
                    juniortotal2+seniortotal1)/(avg);
            avg=TranscriptIO.round(avg,1);
            cgpa=TranscriptIO.round(cgpa,3);
            session.setAttribute("avg", avg);
            session.setAttribute("cgpa", cgpa);
            
            
            transcriptList = TranscriptIO.getWesternStyleTranscript(studentID, "Freshman", 1);
            session.setAttribute("WSSFMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getWesternStyleTranscript(studentID, "Freshman", 2);
            session.setAttribute("WSFFMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getWesternStyleTranscript(studentID, "Sophomore", 3);
            session.setAttribute("WSSSMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getWesternStyleTranscript(studentID, "Sophomore", 4);
            session.setAttribute("WSFSMtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getWesternStyleTranscript(studentID, "Junior", 5);
            session.setAttribute("WSSJtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getWesternStyleTranscript(studentID, "Junior", 6);
            session.setAttribute("WSFJtranscriptList", transcriptList);
            
            transcriptList = TranscriptIO.getWesternStyleTranscript(studentID, "Senior", 7);
            session.setAttribute("WSSStranscriptList", transcriptList);
            
            TranscriptSummary = TranscriptIO.getWSTranscriptSummary(studentID, "Freshman", 1);
            freshmantotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg1 = TranscriptSummary.getTotal();
            session.setAttribute("WSSFMSummary", TranscriptSummary);
            
            
            TranscriptSummary = TranscriptIO.getWSTranscriptSummary(studentID, "Freshman", 2);
            freshmantotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg2 = TranscriptSummary.getTotal();
            session.setAttribute("WSFFMSummary", TranscriptSummary);
            
            TranscriptSummary = TranscriptIO.getWSTranscriptSummary(studentID, "Sophomore", 3);
            sophomoretotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg3 = TranscriptSummary.getTotal();
            session.setAttribute("WSSSMSummary", TranscriptSummary);
             
            TranscriptSummary = TranscriptIO.getWSTranscriptSummary(studentID, "Sophomore", 4);
            sophomoretotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg4 = TranscriptSummary.getTotal();
            session.setAttribute("WSFSMSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getWSTranscriptSummary(studentID, "Junior", 5);
            juniortotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg5 = TranscriptSummary.getTotal();
            session.setAttribute("WSSJSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getWSTranscriptSummary(studentID, "Junior", 6);
            juniortotal2 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg6 = TranscriptSummary.getTotal();
            session.setAttribute("WSFJSummary", TranscriptSummary);
              
            TranscriptSummary = TranscriptIO.getWSTranscriptSummary(studentID, "Senior", 7);
            seniortotal1 = (TranscriptSummary.getTotal()*TranscriptSummary.getGpa());
            avg7 = TranscriptSummary.getTotal();
            session.setAttribute("WSSSSummary", TranscriptSummary);
            
            double wsavg=avg1+avg2+avg3+avg4+avg5+avg6+avg7;
            double wscgpa=(freshmantotal1+freshmantotal2+sophomoretotal1+sophomoretotal2+juniortotal1+
                    juniortotal2+seniortotal1)/(avg);
            wsavg=TranscriptIO.round(wsavg,1);
            wscgpa=TranscriptIO.round(wscgpa,3);
            session.setAttribute("wsavg", wsavg);
            session.setAttribute("wscgpa", wscgpa);
                
        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}