import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class SEdit extends HttpServlet {
 RequestDispatcher rd;
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int n=0;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        String sid = req.getParameter("id");
        String name = req.getParameter("name");
        String branch = req.getParameter("dept");
        String sec = req.getParameter("sec");
        String pass = req.getParameter("pass");
        String mob = req.getParameter("mob");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        try{
            
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ASP","root","201Fa@4413");
        PreparedStatement ps = con.prepareStatement("Update student set sname=?,branch=?,section=?,spass=?,mob=?,semail=?,address=? where sid=? ;");
            
            ps.setString(1, name);
            ps.setString(2, branch);
           ps.setString(3, sec);
           ps.setString(4, pass);
           ps.setString(5, mob);
           ps.setString(6, email);
            ps.setString(7, address);
            ps.setString(8, sid);
           n = ps.executeUpdate();
        if(n>0)
        {
            out.print("<script>"
                   + "alert('Details Updated')"
                    + "</script>");
            rd = req.getRequestDispatcher("AHome.jsp");
            rd.include(req,res);
        }
        else
        {
            out.print("<script>"
                   + "alert('Please Try Again')"
                    + "</script>");
            rd = req.getRequestDispatcher("AddStudent.html");
            rd.include(req,res);
        }
        }
        catch(Exception e){
        System.out.println(e);
        }
    }

}
