import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class RemoveStudent extends HttpServlet {
 RequestDispatcher rd;
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int n=0;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        String sid = req.getParameter("id");
        try{
            
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ASP","root","201Fa@4413");
        PreparedStatement ps = con.prepareStatement("delete from student where sid=?");
            ps.setString(1, sid);
         PreparedStatement ps1 = con.prepareStatement("delete from student where sid=?");
            ps1.setString(1, sid);  
           n=ps1.executeUpdate();
            if(n>0)
            {
                out.print("<script>"
                       + "alert('Student Removed')"
                        + "</script>");
                rd = req.getRequestDispatcher("AHome.jsp");
                rd.include(req,res);
            }
            else
            {
                out.print("<script>"
                       + "alert('Student Not Exist')"
                        + "</script>");
                rd = req.getRequestDispatcher("Remove.html");
                rd.include(req,res);
            }
        }
        catch(Exception e){
                    System.out.println(e);
    }
    }
}
