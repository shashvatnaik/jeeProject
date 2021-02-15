<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.HashMap"%>
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

<%!HashMap<String, Integer> tags = new HashMap<String, Integer>(); %>
<%!HashMap<String, Integer> status = new HashMap<String, Integer>(); %>
<%!HashMap<String, String> note = new HashMap<String, String>(); %>
<%
    tags = (HashMap<String, Integer>)request.getAttribute("tags");
    status = (HashMap<String, Integer>)request.getAttribute("status");
    note = (HashMap<String, String>)request.getAttribute("noteDetails");
    if(note == null){
        note = new HashMap<String, String>();
        note.put("id", "");
        note.put("noteName", "");
        note.put("noteDescription", "");
        note.put("startDate", "");
        note.put("endDate", "");
        note.put("reminderDate", "");
        note.put("tag", "");
        note.put("status", "");
    }
%>


</head>

<center>
	<body style="background-color:#fafafa;">
        <jsp:include page="nav.jsp" >
		    <jsp:param name="route" value="close" />
	    </jsp:include>
        <% if(request.getAttribute("method").equals("add")) { %>
            <h3 class="txtColor">Add Note:</h3>
        <% } else { %>
            <h3 class="txtColor">Add Note:</h3>
        <% } %>
        <div class="card">
            <form action="/notes"  method="POST">
                <% if(request.getAttribute("method").equals("add")) { %>
                    <input type="hidden" name="type" value="addNote" />
                <% } else { %>
                    <input type="hidden" name="type" value="editNote" />
                    <input type="hidden" name="id" value='<%=note.get("id")%>' />
                <% } %>
                <input type="hidden" name="noteBookId" value='<%=request.getParameter("noteBook")%>' />
                    <% if(request.getAttribute("message") != null){ %>
                        <div id="form_message" class="alert alert-danger" role="alert"><%=request.getAttribute("message")%></div></td></tr>
                    <% } %>
                    <div class="mb-3 row">
                        <label for="noteName" class="col-sm-2 col-form-label">Note Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="noteName" name="noteName" value='<%=note.get("noteName")%>' required />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="noteDescription" class="col-sm-2 col-form-label">Notes Description</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="noteDescription" name="noteDescription" required><%=note.get("noteDescription")%></textarea>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="startDate" class="col-sm-1 col-form-label">Start Date</label>
                            <input type="date" class="form-control col-sm-2" id="startDate" name="startDate" value='<%=note.get("startDate")%>' required />
                        <label for="endDate" class="col-sm-1 col-form-label">End Date</label>
                            <input type="date" class="form-control col-sm-2" id="endDate" name="endDate" value='<%=note.get("endDate")%>' required />
                        <label for="reminderDate" class="col-sm-2 col-form-label">Reminder Date</label>
                            <input type="date" class="form-control col-sm-2" id="reminderDate" name="reminderDate" value='<%=note.get("reminderDate")%>' required />
                    </div>
                    <div class="mb-3 row">
                        <label for="tag" class="col-sm-2 col-form-label">tag</label>
                        <div class="col-sm-10">
                            <select class="custom-select select" id="tag" name="tag" value='<%=note.get("tag")%>' required>
                                <option value="">Choose Tag</option>
                                <% for(String t: tags.keySet()){ %>
                                    <% if(note.get("tag").equals(""+tags.get(t))){ %>
                                        <option value="<%=tags.get(t)%>" selected><%=t%></option>
                                    <% } else { %>
                                        <option value="<%=tags.get(t)%>" ><%=t%></option>
                                    <% } %>
                                <% } %>
                              </select>
                        </div>
                        <label for="status" class="col-sm-2 col-form-label">Status</label>
                        <div class="col-sm-10">
                            
                            <select class="custom-select select" id="status" name="status" value='<%=note.get("status")%>' required>
                                <option value="">Choose Status</option>
                                <% for(String s: status.keySet()){ %>
                                    <% if(note.get("status").equals(""+status.get(s))){ %>
                                        <option value="<%=status.get(s)%>" selected><%=s%></option>
                                    <% } else { %>
                                        <option value="<%=status.get(s)%>" ><%=s%></option>
                                    <% } %>
                                <% } %>
                              </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline-success" > 
                        <% if(request.getAttribute("method").equals("add")) {%>
                            Add Note 
                        <% } else { %>
                            Edit Note
                        <% } %>
                    </button>
                    <button type="button" onclick="window.history.back()" class="btn btn-outline-primary">Cancel</button>
                
                
            </form>
        </div>
    </body>
</center>
</html>