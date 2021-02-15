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

<%!ArrayList<HashMap<String, String>> notes;%>
<% notes =  (ArrayList<HashMap<String, String>>)request.getAttribute("notes");%>
</head>

<center>
	<body style="background-color:#fafafa;">
        <jsp:include page="nav.jsp" >
		    <jsp:param name="route" value="close" />
	    </jsp:include>
        <div>
            <h3 class="txtColor">Notes:</h3>
            <a href='/home'><button class="btn btn-outline-primary float-sm-right">Go Back</button></a>
            <a href='/notes?noteBook=<%=(String)request.getAttribute("noteBookId") %>'><button class="btn btn-outline-success float-sm-right">Add Note</button></a>
        </div>
        <% for(HashMap<String, String> m: notes){ %>
            <div class="card row">
                <div>
                <h5><%=m.get("noteName") %></h5>
                <p>Description: <%=m.get("noteDescription") %>
                </p>
                </div>
                <div >
                    <a href='/notes?noteBook=<%=(String)request.getAttribute("noteBookId") %>&note=<%=(String)m.get("id")%>'>
                        <button class="btn btn-outline-warning">Edit</button>
                    </a>
                    <button class="btn btn-outline-danger" onclick='deleteNote(<%=m.get("id")%>)'>Delete</button>
                </div>
            </div>
        <% } %>

    </body>
</center>
<script>
    function deleteNote(id) {
            console.log("delete", id);
    		let xhr = new XMLHttpRequest();

            fetch('/notes?type=deleteNote&id='+id+'&noteBookId=<%=(String)request.getAttribute("noteBookId")%>', {
                method : "POST",
                body: new FormData(),
            }).then((res) => {
                if(res.status == 200){
                    location.reload();
                }
            });
    	}
</script>
</html>