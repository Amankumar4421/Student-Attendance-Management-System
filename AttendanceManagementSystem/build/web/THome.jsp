<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Teacher</title>
      <style>
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

body {
    padding: 0px;
    margin: 0px;
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
    margin:15px auto;
    border: 20px solid rgb(159, 84, 84);
    border-radius: 50%;

 margin-left:100px ;

  }
  
  .student-profile .card h3 {
    font-size: 20px;
    font-weight: 700;
    margin-left: 110px;
  }
  
  .student-profile .card p {
    font-size: 16px;
    color: rgb(72, 101, 160);
    margin-left: 100px;
    margin-top: 10px;
  }
  
  .student-profile .table th,
  .student-profile .table td {
    font-size: 14px;
    padding: 5px 10px;
    color: rgb(88, 81, 155);
    border: 10px;
    z-index: 1;
  }
  /* .col-lg-8 {
    position:fixed;
    /* left: 50%; 
  } */
 #sd{
   position:relative;
   /* top: 10%; */
   left: 45%;
  }
  .und{
    position:relative;
    top: -230px;
    left: 30%;

  }
  .table{
    padding: 20px;
    width: 60%;
  }
  .card-body{
    margin-left: 10px;
    padding:10px
  }
      </style>
    </head>
    
       <body>
   
           <%! String tid; %>
           
        
              <% 
                


if(session.getAttribute("username") == null){
            response.sendRedirect("index.html");
     }
     else{
     tid=session.getAttribute("username").toString();
                  }
              %>
           
           
           
        <%! String tname; %>
        <%! String subject; %>
        <%! String gender; %>
        <%! String email; %>
        <%! String add; %>
        <% tid = request.getAttribute("tid").toString(); %>
        <h1>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            String url = "jdbc:mysql://localhost:3306/ASP";
            String username = "root";
            String password = "201Fa@4413";
            Connection con = DriverManager.getConnection(url, username, password);
            PreparedStatement ps = con.prepareStatement("select * from teacher where tid=?");
            ps.setString(1, tid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            tname = rs.getString(2);
            subject = rs.getString(3);
            gender = rs.getString(5);
            email = rs.getString(6);
            add = rs.getString(7);
            con.close();
        }
        catch (Exception e) {
            System.out.println(e);
        }
        %>
           
           
           
           
      <nav class="navbar">
        <!-- LOGO -->
        <div class="logo">ASP</div>
        <!-- NAVIGATION MENU -->
        <ul class="nav-links">
          <!-- USING CHECKBOX HACK -->
          <!-- NAVIGATION MENUS -->
          <div class="menu">
            <li><a href="#">Home</a></li>
            <li><a href="Mark.jsp">Attendance</a></li>
            <li class="services">
              <a href="#">Student</a>
   
              <!-- DROPDOWN MENU -->
              <ul class="dropdown">
                <li><a href="StudentList.jsp">See Details</a></li>
              </ul>
            </li>
        
               <!-- DROPDOWN MENU -->
              
             </li>
             <li><a href="index.html">Logout</a></li>
          </div>
        </ul>
      </nav>
      <!-- Student Profile -->
    
       
   
   <div class="student-profile py-4">
       <div class="container">
         <div class="row">
           <div class="col-lg-4">
             <div class="card shadow-sm">
               <div class="card-header bg-transparent text-center">
                 <img class="profile_img" src="teacher.png" alt="">
                 <h3>Teacher</h3>
               </div>
               <div class="card-body">
                   <p class="mb-0"><strong class="pr-1">Teacher ID : </strong><%= tid %></p>
                 <p class="mb-0"><strong class="pr-1">Name : </strong><%= tname %></p>
                 
               </div>
             </div>
           </div>
           <div class="col-lg-8">
             <div class="card shadow-sm">
               <div class="card-body">
                   <span class="und">
                 <table class="table " border="10px" >
                   
                   <tr>
                     <th width="30%">Id</th>
                     <td width="5%">:</td>
                     <td><%= tid %></td>
                   </tr>
                   <tr>
                     <th width="30%">Gender</th>
                     <td width="5%">:</td>
                     <td><%= gender %></td>
                   </tr>
                   <tr>
                     <th width="30%">Email Id</th>
                     <td width="5%">:</td>
                     <td><%= email %></td>
                   </tr>
                   <tr>
                     <th width="30%">Address</th>
                     <td width="5%">:</td>
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
    </body>
   </html>