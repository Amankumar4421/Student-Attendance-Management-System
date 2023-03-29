
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class logout2 extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        HttpSession session =req.getSession();
        session.removeAttribute("username");
        session.invalidate();
//        String s = session.getAttribute("username").toString();
//        out.println(s);
        res.sendRedirect("index.html");
        ServletContext sc1 = getServletContext();
        sc1.removeAttribute("aid");
        sc1.removeAttribute("tid");
    }
}