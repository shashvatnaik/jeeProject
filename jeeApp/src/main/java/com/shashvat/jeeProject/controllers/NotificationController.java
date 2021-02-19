package com.shashvat.jeeProject;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import java.util.*;

import com.shashvat.jeeProject.beans.*;

import java.util.*;

@WebServlet(description = "notifications", urlPatterns = { "/notifications" })
public class NotificationController extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
    public NotificationController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NotificationController get method");
        HttpSession session=request.getSession();
        if(session.getAttribute("uid") != null){
            Notification nt = new Notification();
            nt.setUserId(Integer.parseInt(""+session.getAttribute("uid")));
            request.setAttribute("notifications", nt.getAllNotification());
            request.getServletContext().getRequestDispatcher("/views/notifications.jsp").include(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("NotificationController post");
        
	}

}
