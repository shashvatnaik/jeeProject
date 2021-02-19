<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="main.css">

        <jsp:include page="views/nav.jsp" >
		<jsp:param name="route" value="open" />
	</jsp:include>
	<% if(session.getAttribute("uid") != null) { 
		response.sendRedirect("/home");
		System.out.println(session.getAttribute("uid"));
	}
		
	%>

    </head>
    <body style="background-color:#fafafa;">
    <center>
        <h3>Register</h3>
        <div class="card" style="width: 60rem; top:6rem;">
        <form action="/app"  method="POST">
            <input type="hidden" name="type" value="register" />
                <% if(request.getAttribute("message") != null){ %>
                    <div id="email_error" class="alert alert-danger" role="alert"><%=request.getAttribute("message")%></div></td></tr>
                <% } %>
                <div class="mb-3 row">
                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" name="email" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="username" class="col-sm-2 col-form-label">User Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="mobile" class="col-sm-2 col-form-label">Mobile Number</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="mobile" name="mobile" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="password" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="confirmPassword" class="col-sm-2 col-form-label">Confirm Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
                    </div>
                </div>
                <button type="submit" class="btn btn-outline-success" > Register </button>
                <a href="/"><button type="button" class="btn btn-outline-primary">Cancel</button>
            
            
        </form>
    </div>
</center>
</body>
</html>