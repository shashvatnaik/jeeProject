<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.HashMap"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="main.css">
<title>RemindMe</title>
<% 
if(session.getAttribute("uid") == null) { 
    response.sendRedirect("/");
}
%>
<%!ArrayList<HashMap<String, String>> notifications;%>
<%!int newNotificationCount = 0;%>
<%
    notifications = (ArrayList<HashMap<String, String>>)request.getAttribute("notifications");
%>

<% 
newNotificationCount = 0;
for(HashMap<String, String> noti: notifications) {
    if(noti.get("read").equals("0"))
        newNotificationCount++;
}
%>

</head>
<body>
    <!-- <div class="dropdown"> -->
        <button class="btn btn-success dropdown-toggle" type="button" id="notification" data-bs-toggle="dropdown" aria-expanded="false">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
            </svg>
            <% if(newNotificationCount>0) {%>
            <span class="badge rounded-pill bg-danger"><%=newNotificationCount%></span>
            <% } %>
        </button>
    <ul class="dropdown-menu dropdown-menu-end text-muted" aria-labelledby="notification">
        <% for(HashMap<String, String> noti: notifications) { %>
            <li><a class="dropdown-item" href='/notes?noteBook=<%=noti.get("noteBook_id")%>&note=<%=noti.get("noteId")%>&mode=view&read=true'><%=noti.get("text")%>
                <%if(noti.get("read").equals("0")){ %>
                    <span class="badge rounded-pill bg-danger">New</span>
                    <% newNotificationCount++; %>
                <% } %>
            </a>
            </li>
            <li><hr class="dropdown-divider"></li>
        <% } %>
    </ul>
    <!-- </div> -->
</body>

</html>