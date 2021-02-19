<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="main.css">

    <style>
        input[type=text], select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }
        
        input[type=date] {
            width: 17%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }
        
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        input[type=submit]:hover {
            background-color: #45a049;
        }
        
        .container {
            width:400px;
            border-radius: 2px;
            background-color: #f2f2f2;
            padding: 10px;
        }
        
        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav:hover {
            width: 33%;
        }
        
        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }
        
        .sidenav a:hover {
            color: #f1f1f1;
        }
        
        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }
        
        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }
            .sidenav a {
                font-size: 18px;
            }
        }
        
        .dropdown-menu.notify-drop {
            min-width: 330px;
            background-color: #fff;
            min-height: 360px;
            max-height: 360px;
        }
        
        .dropdown-menu.notify-drop .notify-drop-title {
            border-bottom: 1px solid #e2e2e2;
            padding: 5px 15px 10px 15px;
        }
        
        .dropdown-menu.notify-drop .drop-content {
            min-height: 280px;
            max-height: 280px;
            overflow-y: scroll;
        }
        
        .dropdown-menu.notify-drop .drop-content::-webkit-scrollbar-track {
            background-color: #F5F5F5;
        }
        
        .dropdown-menu.notify-drop .drop-content::-webkit-scrollbar {
            width: 8px;
            background-color: #F5F5F5;
        }
        
        .dropdown-menu.notify-drop .drop-content::-webkit-scrollbar-thumb {
            background-color: #ccc;
        }
        
        .dropdown-menu.notify-drop .drop-content>li {
            border-bottom: 1px solid #e2e2e2;
            padding: 10px 0px 5px 0px;
        }
        
        .dropdown-menu.notify-drop .drop-content>li:nth-child(2n+0) {
            background-color: #fafafa;
        }
        
        .dropdown-menu.notify-drop .drop-content>li:after {
            content: "";
            clear: both;
            display: block;
        }
        
        .dropdown-menu.notify-drop .drop-content>li:hover {
            background-color: #fcfcfc;
        }
        
        .dropdown-menu.notify-drop .drop-content>li:last-child {
            border-bottom: none;
        }
        
        .dropdown-menu.notify-drop .drop-content>li .notify-img {
            float: left;
            display: inline-block;
            width: 45px;
            height: 45px;
            margin: 0px 0px 8px 0px;
        }
        
        .dropdown-menu.notify-drop .allRead {
            margin-right: 7px;
        }
        
        .dropdown-menu.notify-drop .rIcon {
            float: right;
            color: #999;
        }
        
        .dropdown-menu.notify-drop .rIcon:hover {
            color: #333;
        }
        
        .dropdown-menu.notify-drop .drop-content>li a {
            font-size: 12px;
            font-weight: normal;
        }
        
        .dropdown-menu.notify-drop .drop-content>li {
            font-weight: bold;
            font-size: 11px;
        }
        
        .dropdown-menu.notify-drop .drop-content>li hr {
            margin: 5px 0;
            width: 70%;
            border-color: #e2e2e2;
        }
        
        .dropdown-menu.notify-drop .drop-content .pd-l0 {
            padding-left: 0;
        }
        
        .dropdown-menu.notify-drop .drop-content>li p {
            font-size: 11px;
            color: #666;
            font-weight: normal;
            margin: 3px 0;
        }
        
        .dropdown-menu.notify-drop .drop-content>li p.time {
            font-size: 10px;
            font-weight: 600;
            top: -6px;
            margin: 8px 0px 0px 0px;
            padding: 0px 3px;
            border: 1px solid #e2e2e2;
            position: relative;
            background-image: linear-gradient(#fff, #f2f2f2);
            display: inline-block;
            border-radius: 2px;
            color: #B97745;
        }
        
        dropdown-menu.notify-drop .drop-content>li p.time:hover {
            background-image: linear-gradient(#fff, #fff);
        }
        
        .dropdown-menu.notify-drop .notify-drop-footer {
            border-top: 1px solid #e2e2e2;
            bottom: 0;
            position: relative;
            padding: 8px 15px;
        }
        
        .dropdown-menu.notify-drop .notify-drop-footer a {
            color: #777;
            text-decoration: none;
        }
        .dropdown-menu.notify-drop .notify-drop-footer a:hover {
            color: #333;
        }
        .medium{
            width:100px
        }
        .dropdown-toggle .badge {
          position: absolute;
          right: 2px;
          top:1px;
          padding: 5px 10px;
          border-radius: 50%;
          background-color: red;
          color: white;
        
        }
        .notify{
            color:white !important;
            font-size: 1.5em !important;
            line-height: 0.9em !important;
            
        }
        .contain{
            width:1060px;
        }
        .changes{
            margin-left:10px;
        }
        .dochanges{
            margin-left:720px;
        }
        .column {
          float: left;
          padding: 10px;
          height: 700px; 
        }
        .center{
            width:2%;
            background-color:white;
        }
        .left {
          width: 18%;
            background-color: #f2f2f2;
          height:1000%;
        }
        
        .right {
          width: 80%;
              background-color: #f2f2f2;
              margin-rigth:200px;
        }
        .rows:after {
          content: "";
          display: table;
          clear: both;
        }
    </style>

<script>
        function openNav() {
        document.getElementById("mySidenav").style.width = "20%";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }

    function setAddInput(){
        document.getElementById("type").value = "add";
        document.getElementById("noteBookId").value=""
        document.getElementById("noteBookName").value = "";
    }
</script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #198754;">
        <div class="container-fluid">
            
            <% if(request.getParameter("route").equals("close")) {%>
                <ul class="nav nav-item navbar-left dropdown">
                    <span style="font-size: 30px; cursor: pointer; color: #293042;"
                    onmouseover="openNav()">&#9776;</span>
                    <a class="navbar-brand" style="margin-left: 10px;" href="/">Notifier</a>
                    <div onmouseleave="closeNav()" id="mySidenav" class="sidenav" style="background-color: #293042;">
                        <a href="javascript:void(0)" class="closebtn" id="closeNav" onclick="closeNav()">&times;</a>
                        <h3 style="color: white;">Hi <%=session.getAttribute("uname")%></h3>
                        <li><hr class="dropdown-divider"></li>
                        <a id="noteBookView" href="/">Note Books</a> 
                        <li><hr class="dropdown-divider"></li>
                        <a id="listOfNotes" href="todaysNotes">Today's Notes</a> 
                        <li><hr class="dropdown-divider"></li>
                        <a href="/" id="editUser" data-bs-toggle="modal" data-bs-target="#userModal">Edit User</a>
                        <li><hr class="dropdown-divider"></li>
                        <a id="logout" href="logout">Logout</a>
                        <li><hr class="dropdown-divider"></li>
                    </div>
                </ul>
            <% } else { %>
                <a class="navbar-brand" href="/">Notifier</a>
            <% } %>

            

            <% if(request.getParameter("route").equals("close")) {%>
            <ul class="nav nav-item d-flex gap-2">
            
                <!-- add a new notebook button -->
                <li style="margin-left: 10px;">
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="setAddInput()">
                        Add New Note Book
                      </button>
                </li>
                    
                <!-- notification button -->
                <li class="dropdown" style="margin-left: 10px;">
                        <jsp:include page="/notifications" />
                </li>

                <!-- logout button -->
                <li style="margin-left: 10px;">
                    <button class="noAnchor btn btn-success" id="logout" href="logout" onclick="location.href='logout'">
                        Logout
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                            <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                          </svg>
                    </a>
                </li>
                    
            </ul>
            <% } %>
        </div>
    </nav>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form action="/noteBook" method="POST">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Add Notebook</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="email" class="col-sm-6 col-form-label">Notebook Name:</label>
                    <div class="col-sm-10">
                        <input id="type" type="hidden" name="type" value="add">
                        <input id="noteBookId" type="hidden" name="noteBookId" value="">
                        <input type="text" class="form-control" id="noteBookName" name="noteBookName" placeholder="enter new notebook's name" required>
                    </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
        </form>
      </div>

      <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
        <form action="/user" method="POST">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="userModalLabel">Add Notebook</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="email" class="col-sm-6 col-form-label">Email:</label>
                <div class="col-sm-10">
                    <input type="text" value='<%=session.getAttribute("uemail")%>' class="form-control" id="email" name="email" disabled required>
                </div>
                <label for="userName" class="col-sm-6 col-form-label">User Name:</label>
                <div class="col-sm-10">
                    <input type="text" value='<%=session.getAttribute("uname")%>' class="form-control" id="userName" name="userName" placeholder="enter new user name" required>
                </div>
                <label for="mobileNumber" class="col-sm-6 col-form-label">Mobile Number:</label>
                <div class="col-sm-10">
                    <input type="text" value='<%=session.getAttribute("umobile")%>' class="form-control" id="mobileNumber" name="mobileNumber" placeholder="enter new mobile number" required>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
        </form>
      </div>


      <% if(session.getAttribute("errorMessage") != null && session.getAttribute("errorMessage") != "") { %>
          <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 5">
            <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" id="toast">
                <div class="toast-header">
                <strong class="me-auto">Notification</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close" onclick="document.getElementById('toast').classList.remove('show')"></button>
                </div>
                <div class="toast-body">
                    <%=session.getAttribute("errorMessage")%>
                </div>
            </div>
        </div>
        <% session.setAttribute("errorMessage", null); %>
    <% } %>
</body>
</html>
