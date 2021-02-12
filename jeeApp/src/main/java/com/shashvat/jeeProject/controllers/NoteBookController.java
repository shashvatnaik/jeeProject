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



/* Servlet implementation class TestServlet*/
@WebServlet(description = "notebook controller", urlPatterns = { "/noteBook" })
public class NoteBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoteBookController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("notebook get method called");
        response.sendRedirect(request.getContextPath() + "/home");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("notebook add method - name is "+request.getParameter("noteBookName"));
        HttpSession session=request.getSession();

        Notebook newnb = new Notebook(request.getParameter("noteBookName"), Integer.parseInt(""+session.getAttribute("uid")));
        int result = newnb.addNewNoteBook();
        if(result == 0){
            session.setAttribute("errorMessage", "Notebook with same name already exists!");
        } else if(result<0){
            session.setAttribute("errorMessage", "Could not process!");
        } else {
            session.setAttribute("errorMessage", "New Notebook Added!");
        }
        response.sendRedirect(request.getContextPath() + "/home");
	}

}
