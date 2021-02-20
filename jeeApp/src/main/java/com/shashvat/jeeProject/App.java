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
			if(!request.getParameter("password").equals(request.getParameter("confirmPassword"))){
				request.setAttribute("message", "Passwords do not match!");
				request.getServletContext().getRequestDispatcher("/register").forward(request, response);
			} else if(request.getParameter("mobile").length() != 10 ){
				request.setAttribute("message", "mobile number should be 10 digits!");
				request.getServletContext().getRequestDispatcher("/register").forward(request, response);
			} else {
				User newUser = new User(request.getParameter("username"), request.getParameter("mobile"), request.getParameter("email"), request.getParameter("password"));
				int result = newUser.registerUser();
				if(result == 1){
					System.out.println("New User Added: "+request.getParameter("email"));
					request.setAttribute("message", "Registration Successfull!");
					request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				} else if(result == 0) {
					request.setAttribute("message", "User with the email already exists!");
					request.getServletContext().getRequestDispatcher("/register").forward(request, response);
				} else {
					System.out.println("error in registering the user");
					response.sendRedirect("/register");
				}
			}
			
		} else {
			try{
				JDBCUtils dbUtil = new JDBCUtils();
				Connection conn = dbUtil.getConnection();
				PreparedStatement pst = conn.prepareStatement("select * from user where email='"+request.getParameter("email")+"' and password='"+request.getParameter("password")+"';");
				ResultSet rs = pst.executeQuery();
				int count = 0, id=0;
				String email="", uname="", mobileNumber="";
				while(rs.next()){
					System.out.println("Login Successful");
					count++;
					email=rs.getString("email");
					uname=rs.getString("userName");
					mobileNumber=rs.getString("mobileNumber");
					id=rs.getInt("id");
				}
				if(count == 1){
					HttpSession session=request.getSession();
        			session.setAttribute("uid", id);
					session.setAttribute("uname", uname);
					session.setAttribute("umobile", mobileNumber);
					session.setAttribute("uemail", email);

					response.sendRedirect(request.getContextPath() + "/home");
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
