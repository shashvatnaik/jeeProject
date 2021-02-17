package com.shashvat.jeeProject;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shashvat.jeeProject.beans.*;

/* Servlet implementation class TestServlet*/
@WebServlet(description = "user controller", urlPatterns = { "/user" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {
        super();
    }

    
	public void init(ServletConfig config) throws ServletException {
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("edit user");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("edit user method - gg value is "+request.getParameter("userName"));
		HttpSession session=request.getSession();
		if(session.getAttribute("uid") != null){
			String newUserName = request.getParameter("userName");
			String newMobileNumber = request.getParameter("mobileNumber");
			User currentUser = new User(Integer.parseInt(""+session.getAttribute("uid")));
			if(currentUser.editUser(newUserName, newMobileNumber)){
				session.setAttribute("uname", newUserName);
				session.setAttribute("umobile", newMobileNumber);
				session.setAttribute("errorMessage", "User details successfully updated.");
			} else {
				session.setAttribute("errorMessage", "could not update user. ");
			}
			response.sendRedirect(request.getContextPath() + "/");
		}
	}

}
