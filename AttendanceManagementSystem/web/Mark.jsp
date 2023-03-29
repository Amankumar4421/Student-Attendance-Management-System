
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<html>
      <head>

        <style>
          *{
/*            background: rgb(240, 241, 236);*/
          }
         .ll{
             margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
            width:70%;
            
          }
          td{
            color:rgb(53, 20, 125);
          }
          .data{
            text-align: center;
          }
          .tab{
            position: absolute;
            left: 15%;
            width:70%;
          }
          .container{
              position: absolute;
              left:15%;
              right:15%;
              border: 1px solid black;
              border-radius: 5px;
              padding-bottom: 20px;
              padding-left: 20px;
              padding-right: 20px;
              
          }
          select{
              width: 100px;
          }
          
          
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    
   }
   /* body {
    font-family: cursive;
   } */
   a {
    text-decoration: none;
   }
   li {
    list-style: none;
    position:relative;
    right: 20px;
   }
   .navbar {display: flex;
 align-items: center;
 justify-content: space-between;
 padding: 15px;
 background-color: teal;
 color: #fff;
 /* width: 140%; */

}
.nav-links a {
 color: #fff;

}
/* LOGO */
.logo {
 font-size: 32px;
}
/* NAVBAR MENU */
.menu {
 display: flex;
 gap: 1em;
 font-size: 18px;
}
.menu li:hover {
 background-color: #4c9e9e;
 border-radius: 5px;
 transition: 0.5s ease;
}
.menu li {
 padding: 5px 10px;
}
/* DROPDOWN MENU */
.services {
 position: relative; 
}
.dropdown {
 background-color: rgb(1, 139, 139);
 padding: 3px;
 position: absolute;
 display: none;
 border-radius: 8px;
 top: 35px;
 z-index: 2;
}
.dropdown li + li {
 margin-top: 10px;
}
.dropdown li {
/* padding: 0.5em 1em;*/
 width: 12em;
 text-align: center;
}
.dropdown li:hover {
 background-color: #4c9e9e;
}
.services:hover .dropdown {
 display: block;
}
      </style>
      </head>
      <body>
          <nav class="navbar">
     <!-- LOGO -->
     <div class="logo">ASP</div>
     <!-- NAVIGATION MENU -->
     <ul class="nav-links">
       <!-- USING CHECKBOX HACK -->
       <!-- NAVIGATION MENUS -->
       <div class="menu">
         <li><a href="AHome.jsp">Home</a></li>
         <li><a href="Mark.jsp">Attendance</a></li>
         <li class="services">
           <a href="#">Student</a>

           <!-- DROPDOWN MENU -->
           <ul class="dropdown">
             <li><a href="AddStudent.html">Add Student </a></li>
             <li><a href="Remove.html">Remove Student</a></li>
             <li><a href="SEdit.html">Edit Details</a></li>
             <li><a href="StudentList.jsp">See List</a></li>
           </ul>
         </li>
         <li class="services">
            <a href="#">Teacher</a>
            
            <!-- DROPDOWN MENU -->
            <ul class="dropdown">
              <li><a href="AddTeacher.html">Add Teacher</a></li>
              <li><a href="RemoveTeacher.html">Remove Teacher</a></li>
              <li><a href="TEdit.html">Edit Details</a></li>
              <li><a href="TeacherList.jsp">See List</a></li>
            </ul>
          </li>
          <li><a href="index.html">Logout</a></li>
       </div>
     </ul>
   </nav>
   <!-- Student Profile -->
          
          
          
        <%! String sid; %>
        <%! String sname; %>
        <%! ResultSet rs; %>
        <%! ResultSet rs1; %>
        
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/ASP";
            String username = "root";
            String password = "201Fa@4413";
            Connection con = DriverManager.getConnection(url, username, password);
            Statement st = con.createStatement();
            
            rs1= st.executeQuery("Select distinct(subject) from teacher");
           
        }
        catch (Exception e) {
            out.println(e);
        }
        %>
       
          
          
      <table border="2" class="ll">
          <form action="addatt" method="post">
            <tr>
              <th>subject</th>
              <th>Period</th>
              <th>Date</th>
              <th>Submit </th>
            </tr>
            <tr>
                <th>
                    <select name="select" required>
                    <%
              while(rs1.next()){
              String subject=rs1.getString(1);
           %>
                    
           <option value="<%= subject %>"><%= subject %></option>
           
          <% }
            
              %>
                    
                    </select>
                </th>
                <th>
                    <select name="period" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </th>
                <th>
                    <input type="date" name="date" id="dt" readonly="readonly" required>
                </th>
                <th><button type="submit" >Submit</button></th>
            </tr>
          
      </table>
      <br><br>
      
      
      <%
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
            out.println(e);
        }
        %>

      <div style="display: flex;">
      <br><br>
          
      <div class="container">
           <h3>Mark Attendance</h3>
          <%
              while(rs.next()){
              sid=rs.getString(1);
           %>
           
           <input type="checkbox" name="Attendance" value="<%= sid %>"><%= sid %>&emsp;
          
          <% }
              %>
      </div>
      </div>
      
      
      </form>
      <script>
          var dt = document.getElementById("dt");
          var obj=new Date();
          var d = obj.getDate();
          var m = obj.getMonth()+1;
          var y = obj.getFullYear();
          if(m<10 && d<10)
            dt.value=y+"-0"+m+"-0"+d;
          else if(m<10)
              dt.value=y+"-0"+m+"-"+d;
          else if(d<10)
              dt.value=y+"-"+m+"-0"+d;
          else
              dt.value=y+"-"+m+"-"+d;
          
        function myFunction() {
          alert("Attendance sucessfully submmited");
        }
        </script>
      </body>
      </html>