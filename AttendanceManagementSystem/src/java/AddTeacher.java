import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class AddTeacher extends HttpServlet {
 RequestDispatcher rd;
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int n=0;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        String tid = req.getParameter("id");
        String name = req.getParameter("name");
        String subject = req.getParameter("subject");
        String gender = req.getParameter("gender");
        String pass = req.getParameter("pass");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        try{
            
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ASP","root","201Fa@4413");
        PreparedStatement ps = con.prepareStatement("insert into teacher values(?,?,?,?,?,?,?);");
            ps.setString(1, tid);
            ps.setString(2, name);
            ps.setString(3, subject);
            ps.setString(5, gender);
            ps.setString(4, pass);
            ps.setString(6, email);
            ps.setString(7, address);
            n = ps.executeUpdate();
           
            if(n>0)
            {
                out.print("<script>"
                       + "alert('Teacher Added')"
                        + "</script>");
                rd = req.getRequestDispatcher("AHome.jsp");
                rd.include(req,res);
            }
            else
            {
                out.print("<script>"
                       + "alert('Teacher already Exist')"
                        + "</script>");
                rd = req.getRequestDispatcher("AddTeacher.html");
                rd.include(req,res);
            }
        }
        catch(Exception e){
                   System.out.println(e);
        }
    }

}
