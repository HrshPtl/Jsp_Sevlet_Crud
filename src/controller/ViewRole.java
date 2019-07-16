package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeRoleDao;

public class ViewRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 EmployeeRoleDao roleDao;
       
    public ViewRole() {
        super();
        roleDao=new EmployeeRoleDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	
    	request.setAttribute("role", roleDao.getAllRole());
		out.println("data is inserted.");
		response.sendRedirect("/EmpRole.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
