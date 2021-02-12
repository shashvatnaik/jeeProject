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

    	function notificationFunction() {
    		$.ajax({
    			type : "POST",
    			url : "listOfNotification.do",
    			success : function(result) {
    				$("#notification").html(result);
    			}
    		});

    	}
        function openNav() {
        document.getElementById("mySidenav").style.width = "20%";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
</script>
</head>
<body>
    <nav class="navbar navbar navbar-expand-lg bg-light">
        <div class="container-fluid">

            <% if(request.getParameter("route").equals("close")) {%>
                <ul class="nav navbar-nav navbar-left">
                    <span style="font-size: 30px; cursor: pointer; color: grey;"
                    onmouseover="openNav()">&#9776;</span>
                    <div onmouseleave="closeNav()" id="mySidenav" class="sidenav">
                        <a href="javascript:void(0)" class="closebtn" id="closeNav" onclick="closeNav()">&times;</a>
                        <h3 style="color: white;">Hi ${user.getUserName() }</h3>
                        <a id="noteBookView" href="noteBookList.do">NoteBooks</a> 
                        <a id="listOfNotes" href="listAllNotes.do">Notes</a> 
                        <a id="editUser" href="editUser.do">Edit User</a>
                    </div>
                </ul>
            <% } %>

            <a class="navbar-brand" href="/">Notifier</a>

            <ul class="nav navbar-nav navbar-right d-flex">
                <li><a id="logout" href="logout"><span
                        class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            </ul>
    
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class="dropdown-toggle glyphicon glyphicon-bell notify"
                    data-toggle="dropdown" role="button" aria-haspopup="true"
                    onclick="notificationFunction()" aria-expanded="false"
                    style="color: white;">
                    <span class="badge">${countRemainder}</span>
                </a>
                
                    <ul class="dropdown-menu notify-drop">
                        <div class="notify-drop-title">
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <h4>Reminder </h4>
                                </div>
                                
                            </div>
                        </div>
                        <div class="drop-content">
                            <li>
                                <div id="notification" >
                                    
                                </div>
                            </li>
                        </div>
                        </ul>
            </li>
            </ul>
            
            <ul class="nav navbar-nav navbar-right d-flex">
            
                <li><a  id="addNewNote" href="addNotes.do" data-toggle="modal"
                    data-target="#myModal" style="visibility: ${ui}">NEW NOTE</a></li>
            </ul>
        </div>
    </nav>
</body>
</html>
