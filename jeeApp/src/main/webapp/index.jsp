<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="main.css">
	<title>RemindMe</title>
	<jsp:include page="views/nav.jsp" >
		<jsp:param name="route" value="open" />
	</jsp:include>
	<% if(session.getAttribute("userEmail") != null) { 
		response.sendRedirect("/home");
		System.out.println(session.getAttribute("userEmail"));
	}
		
	%>
		

</head>
<center>
	<body style="background-color:#fafafa;">
		<div class="card" style="width: 22rem;">
			<form action="/app"  method="post">
				<% if(request.getAttribute("message") != null){ %>
					<div id="email_error" class="alert alert-danger" role="alert"><%=request.getAttribute("message")%></div></td></tr>
				<% } %>
				<div class="form-group">
					<input type="hidden" name="type" value="login" />
					<label for="exampleInputEmail1">Email address</label>
					<input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
				</div>
				<button type="submit" class="btn btn-outline-primary">Submit</button>
			</form>
			<a href="/register"><button type="button" class="btn btn-outline-success">Sign up</button>
		</div>
	</body>
</center>
</html>

