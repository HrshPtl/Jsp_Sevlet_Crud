package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeDao;

public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeDao dao;
	
    public ViewServlet() {
        super();
        dao=new EmployeeDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	
    	String action=request.getParameter("action");
	
    	if(action.equalsIgnoreCase("view"))
    	{
    		RequestDispatcher rd=request.getRequestDispatcher("/ViewEmployee.jsp");
    		request.setAttribute("list", dao.getAllEmployee());
    		HttpSession session=request.getSession();
			request.setAttribute("name", session.getAttribute("name"));
    		rd.forward(request, response);
    	}
    	else if(action.equalsIgnoreCase("delete"))
    	{
    		int id=Integer.parseInt(request.getParameter("id"));
			dao.delete(id);
			request.setAttribute("list", dao.getAllEmployee());
			/*out.println("<script type=\"text/javascript\">");
			out.println("confirm('Are you sure you want to delete?')");
			out.println("location='AddServlet?action=view'");
			out.println("</script>");*/
			//out.println("Your record successfully deleted.");
			
    	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		
		//System.out.println("View");
		//RequestDispatcher rd=request.getRequestDispatcher("/ViewEmployee.jsp");
		//rd.forward(request, response);
	}
}
