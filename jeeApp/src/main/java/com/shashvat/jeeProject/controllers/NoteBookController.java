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

import com.shashvat.jeeProject.beans.*;

import java.util.*;


@WebServlet(description = "notebook controller", urlPatterns = { "/noteBook" })
public class NoteBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoteBookController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        if(session.getAttribute("uid") != null){
            if(request.getParameter("id") != null){
                System.out.println("notebook get with id= "+request.getParameter("id"));
                Notebook ntb = new Notebook(Integer.parseInt(request.getParameter("id")));
                //ntb.getNoteBookDetails();
                request.setAttribute("noteBookId", request.getParameter("id"));
                request.getServletContext().getRequestDispatcher("/views/noteBook.jsp").include(request, response);
            } else {
                System.out.println("notebook get method called");
                Notebook ntb = new Notebook();
                HashMap<String, Integer> notebooklist = ntb.getAllNotebooks(Integer.parseInt(""+session.getAttribute("uid")));
                request.setAttribute("noteBookList", notebooklist);
                request.getServletContext().getRequestDispatcher("/noteBookList").include(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        System.out.println("type="+request.getParameter("type"));
        if(session.getAttribute("uid") != null){
            if(request.getParameter("type").equals("add")){
                System.out.println("notebook add method - name is "+request.getParameter("noteBookName"));
                Notebook newnb = new Notebook(request.getParameter("noteBookName"), Integer.parseInt(""+session.getAttribute("uid")));
                int result = newnb.addNewNoteBook();
                if(result == 0){
                    session.setAttribute("errorMessage", "Notebook with same name already exists!");
                } else if(result<0){
                    session.setAttribute("errorMessage", "Could not process!");
                } else {
                    session.setAttribute("errorMessage", "New Notebook Added.");
                }
                response.sendRedirect(request.getContextPath() + "/home");
            } else if(request.getParameter("type").equals("edit")){
                System.out.println("notebook edit method - name is "+request.getParameter("noteBookName")+" "+request.getParameter("noteBookId"));
                Notebook newnb = new Notebook("", Integer.parseInt(""+session.getAttribute("uid")));
                if(newnb.editNoteBook(request.getParameter("noteBookName"), Integer.parseInt(request.getParameter("noteBookId")))){
                    session.setAttribute("errorMessage", "Notebook Edited Successfully.");
                } else {
                    session.setAttribute("errorMessage", "Could not process!");
                }
                response.sendRedirect(request.getContextPath() + "/home");
                
            } else {
                System.out.println("notebook delete method - id is "+request.getParameter("id"));

                Notebook newnb = new Notebook("", Integer.parseInt(""+session.getAttribute("uid")));
                if(newnb.deleteNoteBook(Integer.parseInt(request.getParameter("id")))){
                    session.setAttribute("errorMessage", "Notebook Delete Successfully.");
                    System.out.println("delete done on notebook");
                } else {
                    session.setAttribute("errorMessage", "Could not process!");
                }
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().append("done");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
	}

}
