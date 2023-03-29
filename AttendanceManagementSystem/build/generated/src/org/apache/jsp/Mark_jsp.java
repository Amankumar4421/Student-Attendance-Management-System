package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Mark_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String sid; 
 String sname; 
 ResultSet rs; 
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("      <head>\n");
      out.write("        <style>\n");
      out.write("          *{\n");
      out.write("            background: rgb(240, 241, 236);\n");
      out.write("          }\n");
      out.write("         .ll{\n");
      out.write("            margin-left: auto;\n");
      out.write("            margin-right: auto;\n");
      out.write("            width:70%;\n");
      out.write("          }\n");
      out.write("          td{\n");
      out.write("            color:rgb(53, 20, 125);\n");
      out.write("          }\n");
      out.write("          .data{\n");
      out.write("            text-align: center;\n");
      out.write("          }\n");
      out.write("          .tab{\n");
      out.write("            position: absolute;\n");
      out.write("            left: 15%;\n");
      out.write("            width:70%;\n");
      out.write("          }\n");
      out.write("      </style>\n");
      out.write("      </head>\n");
      out.write("      <body>\n");
      out.write("          \n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/ASP";
            String username = "root";
            String password = "201Fa@4413";
            Connection con = DriverManager.getConnection(url, username, password);
            Statement st = con.createStatement();
            rs= st.executeQuery("Select * from student");
        }
        catch (Exception e) {
            System.out.println(e);
        }
        
      out.write("\n");
      out.write("          \n");
      out.write("          \n");
      out.write("      <table border=\"2\" class=\"ll\">\n");
      out.write("          <form action=\"addatt\" method=\"post\">\n");
      out.write("            <tr>\n");
      out.write("              <th>subject</th>\n");
      out.write("              <th>ID</th>\n");
      out.write("              <th>Date</th>\n");
      out.write("              <th>Submit </th>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <th>\n");
      out.write("                    <input type=\"text\" name=\"subject\" >\n");
      out.write("                </th>\n");
      out.write("                <th>\n");
      out.write("                    <input type=\"text\" name=\"tid\">\n");
      out.write("                </th>\n");
      out.write("                <th>\n");
      out.write("                    <input type=\"date\" name=\"date\">\n");
      out.write("                </th>\n");
      out.write("                <th><button type=\"submit\" >Submit</button></th>\n");
      out.write("            </tr>\n");
      out.write("          </form>\n");
      out.write("      </table>\n");
      out.write("      <br><br>\n");
      out.write("\n");
      out.write("      <div style=\"display: flex;\">\n");
      out.write("      <br><br>\n");
      out.write("\n");
      out.write("      <form action=\"\" method=\"post\" id=\"\">\n");
      out.write("\n");
      out.write("        <table border=\"3\" class=\"tab\">\n");
      out.write("          <thead>\n");
      out.write("            <tr>\n");
      out.write("              <th>Serial Number</th>\n");
      out.write("              <th>Student Name</th>\n");
      out.write("              <th>Student Register Number</th>\n");
      out.write("              <th>Attendance</th>\n");
      out.write("            </tr>\n");
      out.write("          </thead>\n");
      out.write("          \n");
      out.write("         \n");
      out.write("          \n");
      out.write("          \n");
      out.write("          \n");
      out.write("          \n");
      out.write("         \n");
      out.write("          ");

              int c=0;
              while(rs.next()){
              sid=rs.getString(1);
              sname=rs.getString(2);
           
      out.write("\n");
      out.write("          <tr class=\"data\">\n");
      out.write("            <td>");
      out.print( c+=1 );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( sname);
      out.write("</td>\n");
      out.write("            <td>");
      out.print( sid );
      out.write("</td>\n");
      out.write("            <td ><button style=\"background:rgb(132, 179, 132)\" ><input type=\"radio\" name=\"");
      out.print( c );
      out.write("\" value=\"present\">present</button>\n");
      out.write("                <button style=\"background:rgb(178, 132, 132)\"><input type=\"radio\" name=\"");
      out.print( c );
      out.write("\" value=\"absent\">Absent</button></td>  \n");
      out.write("            \n");
      out.write("\n");
      out.write("            \n");
      out.write("          </tr>\n");
      out.write("          ");
 }
            
              
      out.write("\n");
      out.write("      </table>\n");
      out.write("      </form>\n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("      <script>\n");
      out.write("        function myFunction() {\n");
      out.write("          alert(\"Attendance sucessfully submmited\");\n");
      out.write("        }\n");
      out.write("        </script>\n");
      out.write("      </body>\n");
      out.write("      </html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
