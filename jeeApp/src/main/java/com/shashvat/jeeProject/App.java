package com.shashvat.jeeProject;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;  
import java.sql.*;


/* Servlet implementation class TestServlet*/
@WebServlet(description = "test servlet - first servlet", urlPatterns = { "/app" })
public class App extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public App() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    /**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("hello from servlet - get method");
		response.getWriter().print("hello from servlet - get method ");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("inside post"+request.getParameter("type"));
		if(request.getParameter("type").equals("register")){
			System.out.println("inside post-register");
			User newUser = new User(request.getParameter("username"), request.getParameter("mobile"), request.getParameter("email"), request.getParameter("password"));
			if(newUser.registerUser()){
				System.out.println("New User Added: "+request.getParameter("email"));
				request.setAttribute("message", "Registration Successfull!");
				request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				System.out.println("error in registering the user");
				response.sendRedirect("/register");
			}
		} else {
			try{
				JDBCUtils dbUtil = new JDBCUtils();
				Connection conn = dbUtil.getConnection();
				PreparedStatement pst = conn.prepareStatement("select * from user where email='"+request.getParameter("email")+"' and password='"+request.getParameter("password")+"';");
				ResultSet rs = pst.executeQuery();
				int count = 0;
				String email="";
				while(rs.next()){
					System.out.println("Login Successful");
					count++;
					email=rs.getString("email");
				}
				if(count == 1){
					request.setAttribute("userEmail", email);
					response.sendRedirect(request.getContextPath() + "/home");

					HttpSession session=request.getSession();  
        			session.setAttribute("userEmail",email);  
				} else {
					request.setAttribute("message", "Email or Password is wrong.");
					request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				}
			} catch(Exception e){
				e.printStackTrace();
			}
		}

	}

}
