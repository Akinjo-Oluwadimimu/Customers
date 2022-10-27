/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package GU.tools;

import GU.business.Calculator;
import GU.data.TranscriptIO;
import java.io.IOException;
import static java.lang.Double.parseDouble;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
public class GPCalculatorServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Calculator> calculator = new ArrayList<Calculator>();
        HttpSession session=request.getSession();
        String s = request.getParameter(null);
        String[] unit = request.getParameterValues("unit");
        String[] grade = request.getParameterValues("grade");
        String[] course = request.getParameterValues("course");
        double cngpa=0;
        double usgpa=0;
        double cngp=0;
        double usgp=0;
        double units=0;
        double totalUnit=0;
        int id=1;
        for(int i=0; i<unit.length; i++){
            for (int j=0; j< grade.length; j++){
                for (int k=0; k< course.length; k++){
                    if(i==j&&i==k){
                    Calculator c = new Calculator();
                    c.setCourse(course[k]);
                    c.setUnit(unit[i]);
                    c.setGrade(grade[j]);
                    c.setCngp(TranscriptIO.round(TranscriptIO.gpCalc(grade[j]),1));
                    c.setUsgp(TranscriptIO.round(TranscriptIO.gpWSCalc(grade[j]),1));
                    c.setUsgrade(TranscriptIO.UsGrade(grade[j]));
                    c.setId(id);
                    id++;
                    calculator.add(c);
                    }
                }
                if(i==j){
                if(!"".equals(unit[i]) && !"".equals(grade[j]) || "".equals(unit[i]) && "".equals(grade[j])){
                    if("".equals(unit[i]) && "".equals(grade[j])){
                        units=0;
                        cngp=0;
                        usgp=0;
                    } else {
                        units = parseDouble(unit[i]);
                        cngp=TranscriptIO.round(TranscriptIO.gpCalc(grade[j]),1);
                        usgp=TranscriptIO.round(TranscriptIO.gpWSCalc(grade[j]),1);
                    }
                   cngpa+=units*cngp;
                   usgpa+=units*usgp;
                   totalUnit+=units;
                } else if ("".equals(unit[i]) || "".equals(grade[j])){
                    cngpa=-1;
                    request.setAttribute("done", "error");
                }
             }
           }
        }
        if(cngpa != -1){
            cngpa/=totalUnit;
            cngpa=TranscriptIO.round(cngpa,3);
            usgpa/=totalUnit;
            usgpa=TranscriptIO.round(usgpa,3);
            session.setAttribute("cngpa", cngpa);
            session.setAttribute("usgpa", usgpa);
            request.setAttribute("done", "done");
        }
        session.setAttribute("calculator", calculator);
        
        String url="/tools/gp_calculator.jsp";
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
