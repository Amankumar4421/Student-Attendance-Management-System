
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {

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
            rd = req.getRequestDispatcher("index.html");
            rd.include(req,res);
        }
        else
        if(uname=="")
        {
            out.print("<span>Please Enter Your UserName</span>");
            rd = req.getRequestDispatcher("index.html");
            rd.include(req,res);
        }
        else
        if(pass=="")
        {
            out.print("<span>Please Enter Your Passsword</span>");
            rd = req.getRequestDispatcher("index.html");
            rd.include(req,res);
        }
        else
        if(sp.equals("Student"))
        {
            if(SValid.check(uname,pass))
            {
                req.setAttribute("sid",uname);
                HttpSession session=req.getSession();
                session.setAttribute("username", uname);
                rd = req.getRequestDispatcher("SHome.jsp");
                rd.forward(req,res);
//                res.sendRedirect("SHome.jsp");
            }
            else
            {
                out.print("<span>Incorrect UserName/Passsword</span>");
                rd = req.getRequestDispatcher("index.html");
                rd.include(req,res);
            }
        }
        else
        if(sp.equals("Teacher"))
        {
            if(TValid.check(uname,pass))
            {
                req.setAttribute("tid",uname);
                HttpSession session=req.getSession();
                session.setAttribute("username", uname);
                rd = req.getRequestDispatcher("THome.jsp");
                ServletContext sc = getServletContext();
                sc.setAttribute("tid", uname);
//                req.setAttribute("tid",uname);
//                rd = req.getRequestDispatcher("THome.jsp");
                rd.forward(req,res);
            }
            else
            {
                out.print("<span>Incorrect UserName/Passsword</span>");
                rd = req.getRequestDispatcher("index.html");
                rd.include(req,res);
            }
        }
        else
        {
            if(AValid.check(uname,pass))
            {
                req.setAttribute("aid",uname);
                HttpSession session=req.getSession();
                session.setAttribute("username", uname);
                rd = req.getRequestDispatcher("AHome.jsp");
                ServletContext sc1 = getServletContext();
                sc1.setAttribute("aid", uname);
//                rd = req.getRequestDispatcher("AHome.jsp");
                rd.forward(req,res);
            }
            else
            {
                out.print("<span>Incorrect UserName/Passsword</span>");
                rd = req.getRequestDispatcher("index.html");
                rd.include(req,res);
            }
        }
    }
}

