<html lang="en">
 <head>
   <meta charset="UTF-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <link rel="stylesheet" href="css/AHome.css">
   <title>Admin</title>
 </head>
 <h1>
    <body>
        
         <%! String aid; %>
        
              <% 
                


if(session.getAttribute("username") == null){
            response.sendRedirect("index.html");
     }
     else{
     aid=session.getAttribute("username").toString();
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
 

<div class="student-profile py-4">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="card shadow-sm">
            <div class="card-header bg-transparent text-center">
              <img class="profile_img" src="admin.png" alt="">
              <h3>ADMIN</h3>
            </div>
            <div class="card-body">
              <p class="mb-0"><strong class="pr-1">Admin ID:</strong>501</p>
              <p class="mb-0"><strong class="pr-1">Name</strong>Prem Raj</p>
              
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
                  <td width="2%">:</td>
                  <td>501</td>
                </tr>
                <tr>
                  <th width="30%">Academic Year	</th>
                  <td width="2%">:</td>
                  <td>2022</td>
                </tr>
                <tr>
                  <th width="30%">Gender</th>
                  <td width="2%">:</td>
                  <td>Male</td>
                </tr>
                <tr>
                  <th width="30%">Email Id</th>
                  <td width="2%">:</td>
                  <td>tihi12@gmail.com</td>
                </tr>
                <tr>
                  <th width="30%">Contact No.</th>
                  <td width="2%">:</td>
                  <td>5647292031</td>
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