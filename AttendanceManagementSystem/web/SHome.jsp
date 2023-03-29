<%-- 
    Document   : SHome
    Created on : 21-Jun-2022, 10:29:57 pm
    Author     : win10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="css/head.css">
           

        <title>Student Home</title>
        
        <style>
            body {
               
                
    padding: 10%;
    margin: 10px;
    font-family: 'Lato', sans-serif;
    color: rgb(183, 68, 68);
    background-color: rgb(243, 235, 236);
  }
  
  .student-profile .card {
    border-radius: 10px;
  }
  
  .student-profile .card .card-header .profile_img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin: 10px auto;
    border: 20px solid rgb(159, 84, 84);
    border-radius: 50%;
  }
  
  .student-profile .card h3 {
      margin-top: 70px;
    font-size: 20px;
    font-weight: 700;
  }
  
  .student-profile .card p {
    font-size: 16px;
    color: rgb(72, 101, 160);
  }
  
  .student-profile .table th,
  .student-profile .table td {
    font-size: 14px;
    padding: 5px 10px;
    color: rgb(88, 81, 155);
    border: 10px;
  }
  /* .col-lg-8 {
    position:fixed;
    /* left: 50%; 
  } */
 #sd{
   position: absolute;
   top: 10%;
   left: 35%;
  }
  .und{
    position: absolute;
    top: 25%;
    left: 30%;

  }
  .table{
    padding: 25px;
  }

  .logout{
    position: absolute;
    top:20px;
    left: 90%;
  }
  .logout a{
    text-decoration: none;
    font-size: large;
  }

  .logout a:hover{
    color:blueviolet
  }
            
            .report{
                position: absolute;
                top: 20%;
                left: 73%;
/*                border:1px solid black;*/
                width: auto;
                height: 200px;
                
            }
            th{
                width: 100px;
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
         <li><a href="SHome.jsp">Home</a></li>
         <li><a href="logout2">Logout</a></li>
          
       </div>
     </ul>
   </nav>
         
         <%! String sid; %>
        
              <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
                


if(session.getAttribute("username") == null){
            response.sendRedirect("index.html");
     }
     else{
     sid=session.getAttribute("username").toString();
                  }
              %>
 
        <%! String sname; %>
        <%! String branch; %>
        <%! String gender; %>
        <%! String sec; %>
        <%! String smob; %>
        <%! String email; %>
        <%! String add; %>
       
     
     
       
        
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/ASP";
            String username = "root";
            String password = "201Fa@4413";
            Connection con = DriverManager.getConnection(url, username, password);
            PreparedStatement ps = con.prepareStatement("select * from student where sid=?");
            ps.setString(1, sid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            sname = rs.getString(2);
            branch = rs.getString(3);
            gender = rs.getString(4);
            sec = rs.getString(5);
            smob = rs.getString(7);
            email = rs.getString(8);
            add = rs.getString(9);
            con.close();
        }
        catch (Exception e) {
            System.out.println(e);
        }
        %>

        
<!--        <div class="logout">
        <a href="index.html">Logout</a>
<form action="logout2">
    <input type="submit" value ="logout">
</form>
        
      </div>-->
<div class="student-profile py-4">
 
    <div class="container">
      
      <div class="row">
        <div class="col-lg-4">
          <div class="card shadow-sm">
            <div class="card-header bg-transparent text-center">
              <img class="profile_img" src="student.png" alt="">
              <h3><%= sname %></h3>
            </div>
            <div class="card-body">
              <p class="mb-0"><strong class="pr-1">Student ID:</strong><%= sid %></p>
              <p class="mb-0"><strong class="pr-1">Branch:</strong><%= branch %></p>
              <p class="mb-0"><strong class="pr-1">Section:</strong><%= sec %></p>
            </div>
          </div>
        </div>
        <div class="col-lg-8">
          <div class="card shadow-sm">
            <div class="card-header bg-transparent border-0">
              <h3 class="mb-0" id="sd"><i class="far fa-clone pr-1"></i>Student General Information</h3>
            </div>
            <div class="card-body">
                <span class="und">
              <table class="table " border="10px" >
                
                <tr>
                  <th width="30%">Roll</th>
                  <td width="5%">:</td>
                  <td><%= sid %></td>
                </tr>
                <tr>
                  <th width="30%">Academic Year	</th>
                  <td width="2%">:</td>
                  <td>2022</td>
                </tr>
                <tr>
                  <th width="30%">Gender</th>
                  <td width="2%">:</td>
                  <td><%= gender %></td>
                </tr>
                <tr>
                  <th width="30%">Email Id</th>
                  <td width="2%">:</td>
                  <td><%= email %></td>
                </tr>
                <tr>
                  <th width="30%">Contact No.</th>
                  <td width="2%">:</td>
                  <td><%= smob %></td>
                </tr>
                <tr>
                  <th width="30%">Address</th>
                  <td width="2%">:</td>
                  <td><%= add %></td>
                </tr>
            
              </table>
            </span>
            </div>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="report">
      <h3>Attendance Report</h3>
      <table border="2px">
          <%! ResultSet rs; %>
          <%! ResultSet rs1; %>
          <%! PreparedStatement ps; %>
          <%! ResultSet rs2; %>
          <%! PreparedStatement ps1; %>
          <%! Connection con; %>
           
          
          <tr>
        <th>Subject</th>
        <th> Present</th>
        <th> Total</th>
         </tr>
           <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/ASP";
            String username = "root";
            String password = "201Fa@4413";
            con = DriverManager.getConnection(url, username, password);
            Statement st = con.createStatement();
            
            rs= st.executeQuery("Select distinct(subject) from teacher");
           
        }
        catch (Exception e) {
            out.println(e);
        }
        
        
        
        while(rs.next()){
        int n=0;
        String sub=rs.getString(1);
        try {
            
            ps = con.prepareStatement("Select count(distinct(adate)) from attendance where  subject=?");
            ps.setString(1,sub);
            rs1 = ps.executeQuery();
           rs1.next();
           
           ps1 = con.prepareStatement("Select count(distinct(adate)) from attendance where  subject=? and apresent='Present' and sid=?;");
            ps1.setString(1,sub);
            ps1.setString(2,sid);
            rs2 = ps1.executeQuery();
            rs2.next();
        }
        catch (Exception e) {
            out.println(e);
        }
                   %>
         <tr>
        <th><%= sub %></th>
        <th> <%= rs2.getString(1) %> </th>
        <th><%= rs1.getString(1) %></th>
         </tr>
        <% } %>
          
         
          
          
          
          
          
          
      </table>
      
  </div>
        
    </body>
</html>
