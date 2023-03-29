
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ResetPassword extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        String uname = req.getParameter("uname");
        String pass = req.getParameter("pass");
        String sp = req.getParameter("select");
        RequestDispatcher rd;
//        out.println("<h1>uname: "+uname+"</h1>");
//        out.println("<h1>pass: "+pass+"</h1>");
//        out.println("<h1>aldf: "+sp+"</h1>");
        if(uname=="" && pass=="")
        {
            out.print("<span>Please Enter UserName and Password</span>");
            rd = req.getRequestDispatcher("Reset.html");
            rd.include(req,res);
        }
        else
        if(uname=="")
        {
            out.print("<span>Please Enter Your UserName</span>");
            rd = req.getRequestDispatcher("Reset.html");
            rd.include(req,res);
        }
        else
        if(pass=="")
        {
            out.print("<span>Please Enter Your Passsword</span>");
            rd = req.getRequestDispatcher("Reset.html");
            rd.include(req,res);
        }
        else
        if(sp.equals("Student"))
        {
            
            if(SValid.check1(uname))
            {
                SValid.changePass(uname ,pass);
                out.print("<span>Password Changed</span>");
                rd = req.getRequestDispatcher("index.html");
                rd.include(req,res);
            }
            else
            {
                out.print("<span>Incorrect UserName</span>");
                rd = req.getRequestDispatcher("Reset.html");
                rd.include(req,res);
            }
        }
        else
        if(sp.equals("Teacher"))
        {
            if(TValid.check1(uname))
            {
                TValid.changePass(uname ,pass);
                out.print("<span>Password Changed</span>");
                rd = req.getRequestDispatcher("index.html");
                rd.include(req,res);
            }
            else
            {
                out.print("<span>Incorrect UserName</span>");
                rd = req.getRequestDispatcher("Reset.html");
                rd.include(req,res);
            }
        }
        else
        {
            if(AValid.check1(uname))
            {
                AValid.changePass(uname ,pass);
                out.print("<span>Password Changed</span>");
                rd = req.getRequestDispatcher("index.html");
                rd.include(req,res);
            }
            else
            {
                out.print("<span>Incorrect UserName</span>");
                rd = req.getRequestDispatcher("Reset.html");
                rd.include(req,res);
            }
        }
        
        

    }
}

