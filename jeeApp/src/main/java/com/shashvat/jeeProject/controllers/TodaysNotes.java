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

@WebServlet(description = "today's notes", urlPatterns = { "/todaysNotes" })
public class TodaysNotes extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
    public TodaysNotes() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("todaysnote get method");
        HttpSession session=request.getSession();
        if(session.getAttribute("uid") != null){
            Notebook ntb = new Notebook();
            
            request.setAttribute("notes", ntb.getTodaysNotes(Integer.parseInt(""+session.getAttribute("uid"))));
            request.getServletContext().getRequestDispatcher("/views/noteBook.jsp").include(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("todays notes post");
        
	}

}
