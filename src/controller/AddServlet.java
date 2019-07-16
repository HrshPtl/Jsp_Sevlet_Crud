package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.EmployeeDao;
import dao.EmployeeRoleDao;
import pojo.Employee;
import pojo.EmployeeSearch;


 
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeDao dao;
	EmployeeRoleDao r_dao;
    public AddServlet() {
        super();
        dao=new EmployeeDao();
        r_dao =new EmployeeRoleDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	
    	String action=request.getParameter("action");
    	
    	if(action.equalsIgnoreCase("edit"))
    	{
	    	int emp_id=Integer.parseInt(request.getParameter("id"));
	    	EmployeeSearch employee=dao.getEmployeeById(emp_id);
			request.setAttribute("employee", employee);
			request.setAttribute("role", r_dao.getAllRole());
			RequestDispatcher rd=request.getRequestDispatcher("/AddServlet?action=insert");
			rd.forward(request, response);
    	}
    	else if(action.equalsIgnoreCase("insert"))
    	{
    		request.setAttribute("role", r_dao.getAllRole());
    		RequestDispatcher rd=request.getRequestDispatcher("/AddEmployee.jsp");
			rd.forward(request, response);
    	}
    	
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
	
			int emp_id=Integer.parseInt(request.getParameter("id"));
			String emp_code= AddServlet.getAlphaNumericString();
			String full_name=request.getParameter("name");
			String job_title=request.getParameter("jobtitle");
			String department=request.getParameter("Department");
			float salary=Float.parseFloat(request.getParameter("Salary"));
			String email=request.getParameter("Email");
			String mobile_no =request.getParameter("mobileno");
				
			String jdate=request.getParameter("joindate");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date join_date=null;
			try {
				join_date = sdf.parse(jdate);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			Date create_date=new Date();
			Date modification_date=new Date();
			
			int role_id=Integer.parseInt(request.getParameter("role_id"));
			
			String status=request.getParameter("check");
			
			Employee e=new Employee();
			
			e.setFull_name(full_name);
			e.setJob_title(job_title);
			e.setDepartment(department);
			e.setSalary(salary);
			e.setEmail(email);
			e.setMobile_no(mobile_no);
			e.setJoin_date(join_date);
			e.setModification_date(modification_date);
			e.setRole_id(role_id);
			
			if(emp_id == 0)
			{
				Boolean check=request.getParameter("checkbox") != null;
				e.setCheck(check);
				e.setStatus(status);
				e.setEmp_code(emp_code);
				e.setCreate_date(create_date);
				dao.add(e);
				
			}
			
			else
			{
				Boolean check1;
				if(check1=request.getParameter("checkbox") != null )
				{
					
					e.setCheck(check1);
				}
				else
				{
					e.setCheck(check1);
				}
				
				e.setStatus(status);
				e.setEmp_id(emp_id);
				dao.update(e);
			}
		request.setAttribute("list", dao.getAllEmployee());
		/*RequestDispatcher rd=request.getRequestDispatcher("/ViewServlet?action=view");
		rd.forward(request, response);*/
			response.sendRedirect("ViewServlet?action=view");
	}
	 static String getAlphaNumericString() 
	    { 
	        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	                                    + "0123456789"
	                                    + "abcdefghijklmnopqrstuvxyz"; 
	        StringBuilder sb = new StringBuilder(6); 
	  
	        for (int i = 0; i < 6; i++) { 
	            int index = (int)(AlphaNumericString.length()* Math.random()); 
	            sb.append(AlphaNumericString .charAt(index)); 
	        } 
	        return sb.toString(); 
	    } 

}
