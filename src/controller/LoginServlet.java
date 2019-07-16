package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeDao;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeDao dao=null;
	public LoginServlet()
	{
		super();
		dao=new EmployeeDao();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(username != null && password != null)
		{
			if(username.equals("Admin") && password.equals("123"))
			{
				HttpSession session=request.getSession();
				session.setAttribute("name", username);
				request.setAttribute("list", dao.getAllEmployee());
				/*RequestDispatcher rd=request.getRequestDispatcher("/ViewEmployee.jsp");
				rd.forward(request, response);*/
				response.sendRedirect("ViewServlet?action=view");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			}
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
