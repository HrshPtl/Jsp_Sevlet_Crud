package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeRoleDao;
import pojo.Employee;
import pojo.Role;

public class EmployeeRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmployeeRoleDao roleDao;
    public EmployeeRole() {
        super();
    roleDao=new EmployeeRoleDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	/*response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	
		request.setAttribute("role", roleDao.getAllRole());
		out.println("data is inserted.");
		response.sendRedirect("/EmpRole.jsp");*/
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String role_name=request.getParameter("role_name");
		
		Role r=new Role();
		r.setRole_name(role_name);
		
		roleDao.add(r);
		request.setAttribute("role", roleDao.getAllRole());
		//response.sendRedirect("/EmpRole.jsp");
		/*out.println("<script type=\"text/javascript\">");
		out.println("alert('Your Role is inserted..')");
		out.println("location='/ViewServlet?action=view'");
		out.println("</script>");*/
	}

}
