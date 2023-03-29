import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class Addatt extends HttpServlet {
 RequestDispatcher rd;
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int n=0;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        
        ServletContext sc = getServletContext();  
        String tid = (String) sc.getAttribute("tid");  
        
        ServletContext sc1 = getServletContext();  
        String aid = (String) sc1.getAttribute("aid");  
        
        String subject = req.getParameter("select");
        
        String period = req.getParameter("period");
//       String tid = req.getParameter("tid");
       String dt = req.getParameter("date");
        try{    
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ASP","root","201Fa@4413");
        PreparedStatement ps = con.prepareStatement("insert into attendance values(?,?,?,?,?,?,?);");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from student;");
        String[] values={"asdf"};
        if(req.getParameterValues("Attendance")!=null)
            values = req.getParameterValues("Attendance");
        while(rs.next())
        {
            n=0;
            String sid = rs.getString(1);
             for(String att : values) {
                 if(att.equals(sid))
                 {
                    String abc = "Absent";
                    ps.setString(1, dt);
                    ps.setString(2, subject);
                    ps.setString(3, abc);
                    ps.setString(4, period);
                    ps.setString(5, att);
                    ps.setString(6, tid);
                    ps.setString(7, aid);
                    
                    n = ps.executeUpdate();
                 }
             }
             if(n==0)
             {
                 String abc = "Present";
                    ps.setString(1, dt);
                    ps.setString(2, subject);
                    ps.setString(3, abc);
                    ps.setString(4, period);
                    ps.setString(5, sid);
                    ps.setString(6, tid);
                    ps.setString(7, aid);
                    n = ps.executeUpdate();
             }

            
        }
        if(n>0)
        {
        out.print("<script>"
                       + "alert('Attendance Marked Successfully')"
                        + "</script>");
            rd = req.getRequestDispatcher("Mark.jsp");
                rd.include(req,res);
        }
        else
        {
            out.print("<script>"
                       + "alert('Already Marked')"
                        + "</script>");
            rd = req.getRequestDispatcher("Mark.jsp");
                rd.include(req,res);
        }
        }
        catch(Exception e){
            out.println(e);
        }
    }

}
