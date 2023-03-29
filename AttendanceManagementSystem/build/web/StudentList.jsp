<%-- 
    Document   : StudentList
    Created on : 23-Jun-2022, 4:57:50 pm
    Author     : win10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
      <head>
          <title>Student List</title>
    <link rel="stylesheet" href="css/AHome.css">

        <style>
          *{
            /*background: rgb(215, 215, 220);*/
            /*margin-top: 30px;*/
          }
         .ll{
            margin-left: auto;
            margin-right: auto;
            width:70%;
          }
          td{
            color:rgb(170, 32, 112);
          }
          .data{
            text-align: center;
          }
          .tab{
            position: absolute;
            left: 12%; 
            width: 80%;
          }
          .sf{
            display: flex;
            justify-content: center;
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
          
          
          
          
          
          
          
      <br><br>
<h1 class="sf">Student List</h1>
      <div style="display: flex;">
      <br><br>
      <%! ResultSet rs; %>
        <table border="3" class="tab" width="70%">
            
            <thead>
            <tr>
              <th>Serial Number</th>
              <th>Student ID</th>
              <th>Student Name</th>
              <th>Branch</th>
              <th>Gender</th>
              <th>Section</th>
              <th>Mob.NO</th>
              <th>Email</th>
              <th>Address</th>
            </tr>
            </thead>
            
            
            
        <%   
            int c=1;
            try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/ASP";
            String username = "root";
            String password = "201Fa@4413";
            Connection con = DriverManager.getConnection(url, username, password);
            Statement st = con.createStatement();
            rs= st.executeQuery("Select * from student");
        while(rs.next())
        {
        %>
           <tr class="data">
            <td><%= c++ %></td>
            <td style="background: rgb(163, 156, 180);"><%= rs.getString(1) %></td>
            <td style="background: rgb(163, 156, 180);"><%= rs.getString(2) %></td>
            <td style="background: rgb(163, 156, 180);"><%= rs.getString(3) %></td>
            <td ><%= rs.getString(4) %></td> 
            <td ><%= rs.getString(5) %></td>    
            <td ><%= rs.getString(7) %></td> 
            <td ><%= rs.getString(8) %></td> 
            <td ><%= rs.getString(9) %></td> 
          </tr>
        
        
        <%
        }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        %>
            
            
            
            
          
          
      </table>
      </div>
      </body>
</html>
