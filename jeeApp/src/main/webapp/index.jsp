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
	<% 
		if(session.getAttribute("uid") != null) { 
			response.sendRedirect("/home");
			System.out.println(session.getAttribute("userEmail"));
		}
	%>
		

</head>
<center>
	<body style="background-color:#fafafa;">
		<h2 style="color: #062f4f; margin-top: 2rem;">Login</h2>
		<div class="card" style="width: 22rem; top:5rem;">
			<form action="/app"  method="post">
				<% if(request.getAttribute("message") != null){ %>
					<div id="email_error" class="alert alert-danger" role="alert"><%=request.getAttribute("message")%></div></td></tr>
				<% } %>
				<div class="form-group">
					<input type="hidden" name="type" value="login" />
					<label for="exampleInputEmail1" class="txtColor">Email address</label>
					<input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1" class="txtColor">Password</label>
					<input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
				</div>
				<div class="d-grid gap-2 " style="margin-top: 20px;">
					<button type="submit" class="btn btn-outline-success">Login</button>
					<button type="button" class="btn btn-outline-success" onclick="gotoReg()">Sign up</button>
				</div>
			</form>
		</div>
	</body>
</center>

<script>
	function gotoReg() {
		location.href="/register";
	}
</script>

</html>

