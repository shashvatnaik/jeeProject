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


@WebServlet(description = "notes controller", urlPatterns = { "/notes" })
public class NotesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NotesController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("notes get method");
        HttpSession session=request.getSession();
        if(session.getAttribute("uid") != null){
            if(request.getParameter("note") == null){
                request.setAttribute("method", "add");
                Tag tg = new Tag();
                request.setAttribute("tags", tg.getAllTags());
                Status st = new Status();
                request.setAttribute("status", st.getAllStatus());

                request.getServletContext().getRequestDispatcher("/views/addNotes.jsp").include(request, response);
            } else {
                System.out.println("edit note - "+request.getParameter("mode"));
                Note n = new Note();
                System.out.println(request.getParameter("note")+" - "+request.getParameter("noteBook"));
                n.setId(Integer.parseInt(""+request.getParameter("note")));
                n.setNoteBookId(Integer.parseInt(""+request.getParameter("noteBook")));

                if(request.getParameter("mode").equals("edit")){
                    request.setAttribute("method", "edit");
                } else {
                    Notification nt = new Notification();
                    nt.setNoteBookId(n.getNoteBookId());
                    nt.setNoteId(n.getId());
                    nt.markRead();
                    request.setAttribute("method", "view");
                }
                Tag tg = new Tag();
                request.setAttribute("tags", tg.getAllTags());
                Status st = new Status();
                request.setAttribute("status", st.getAllStatus());

                request.setAttribute("noteDetails", n.getNoteDetails(Integer.parseInt(""+session.getAttribute("uid"))));
                
                request.getServletContext().getRequestDispatcher("/views/addNotes.jsp").include(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("notes post method with type="+request.getParameter("type"));
        HttpSession session=request.getSession();
        if(session.getAttribute("uid") != null){
            if(request.getParameter("type").equals("addNote")){
                Note n = new Note();
                n.setNoteBookId(Integer.parseInt(request.getParameter("noteBookId")));
                n.setName(request.getParameter("noteName"));
                n.setDescription(request.getParameter("noteDescription"));
                n.setStartDate(request.getParameter("startDate"));
                n.setEndDate(request.getParameter("endDate"));
                n.setReminderDate(request.getParameter("reminderDate"));
                n.setTag(Integer.parseInt(request.getParameter("tag")));
                n.setStatus(Integer.parseInt(request.getParameter("status")));
                

                if(n.addNewNote()){
                    Notification nt = new Notification();
                    nt.setNoteBookId(Integer.parseInt(request.getParameter("noteBookId")));
                    nt.setNoteId(n.getId());
                    nt.setText(n.getName());
                    nt.setDate(n.getReminderDate());
                    nt.setUserId(Integer.parseInt(""+session.getAttribute("uid")));
                    if(nt.addNotification()){
                        session.setAttribute("errorMessage", "Note added successfully with name : "+n.getName());
                    } else {
                        session.setAttribute("errorMessage", "problem genereating notification: "+n.getId());
                    }
                    
                } else {
                    session.setAttribute("errorMessage", "coud not process add notes request");
                }
                response.sendRedirect(request.getContextPath() + "/noteBook?id="+request.getParameter("noteBookId"));
            } else if(request.getParameter("type").equals("deleteNote")) {
                Note n = new Note();
                n.setId(Integer.parseInt(""+request.getParameter("id")));
                n.setNoteBookId(Integer.parseInt(""+request.getParameter("noteBookId")));
                if(n.deleteNote(Integer.parseInt(""+session.getAttribute("uid")))){
                    Notification nt = new Notification();
                    nt.setNoteBookId(n.getNoteBookId());
                    nt.setNoteId(n.getId());
                    if(nt.deleteNotification()){
                        session.setAttribute("errorMessage", "Note added successfully with name : "+n.getName());
                    } else {
                        session.setAttribute("errorMessage", "Error in deleting notification "+n.getName());
                    }
                } else {
                    session.setAttribute("errorMessage", "could not process delete request"+n.getName());
                }
                response.sendRedirect(request.getContextPath() + "/noteBook?id="+request.getParameter("noteBookId"));
            } else {
                //edit method
                Note n = new Note();
                n.setId(Integer.parseInt(request.getParameter("id")));
                n.setNoteBookId(Integer.parseInt(request.getParameter("noteBookId")));
                n.setName(request.getParameter("noteName"));
                n.setDescription(request.getParameter("noteDescription"));
                n.setStartDate(request.getParameter("startDate"));
                n.setEndDate(request.getParameter("endDate"));
                n.setReminderDate(request.getParameter("reminderDate"));
                n.setTag(Integer.parseInt(request.getParameter("tag")));
                n.setStatus(Integer.parseInt(request.getParameter("status")));
                if(n.editNote(Integer.parseInt(""+session.getAttribute("uid")))){
                    Notification nt = new Notification();
                    nt.setDate(n.getReminderDate());
                    nt.setText(n.getName());
                    nt.setNoteBookId(n.getNoteBookId());
                    nt.setNoteId(n.getId());
                    if(nt.editNotification(nt)){
                        session.setAttribute("errorMessage", "Note edited successfully with name : "+n.getName());    
                    } else {
                        session.setAttribute("errorMessage", "Error in generating notification "+n.getName());
                    }
                } else {
                    session.setAttribute("errorMessage", "coud not process add notes request");
                }
                response.sendRedirect(request.getContextPath() + "/noteBook?id="+request.getParameter("noteBookId"));
            }
        }
	}

}
