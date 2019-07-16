package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;
import java.time.temporal.TemporalAccessor;

import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import pojo.Employee;
import pojo.EmployeeSearch;

public class EmployeeDao {
	
	public static Connection getConnection()
	{
		Connection cn=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root", "root");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cn;
		
	}
	
	public void add(Employee emp)
	{

		try
		{
			Connection cn=EmployeeDao.getConnection();
			PreparedStatement ps=cn.prepareStatement("insert into employee(emp_code,full_name,job_title,department,salary,email,mobile_no,join_date,create_date,modification_date,status,checkbox,role_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, emp.getEmp_code());
			ps.setString(2, emp.getFull_name());
			ps.setString(3, emp.getJob_title());
			ps.setString(4, emp.getDepartment());
			ps.setFloat(5, emp.getSalary());
			ps.setString(6, emp.getEmail());
			ps.setString(7, emp.getMobile_no());
			
			Date jdate=emp.getJoin_date();
			java.sql.Date join_date=new java.sql.Date(jdate.getTime());
			ps.setDate(8, join_date);
			
			Date cdate=emp.getCreate_date();
			java.sql.Date create_date=new java.sql.Date(cdate.getTime());
			ps.setDate(9, create_date);
			
			Date mdate=emp.getModification_date();
			java.sql.Date modification_date=new java.sql.Date(mdate.getTime());
			ps.setDate(10, modification_date);
			
			ps.setString(11, emp.getStatus());
			ps.setBoolean(12, true);
			ps.setInt(13, emp.getRole_id());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List<EmployeeSearch> getAllEmployee()
	{
		List<EmployeeSearch> list=new ArrayList<EmployeeSearch>();
		try
		{
			Connection cn=EmployeeDao.getConnection();
			PreparedStatement ps=cn.prepareStatement("select * from employee emp inner join employee_role role on emp.role_id = role.role_id");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				/*Employee e=new Employee();
				e.setEmp_id(rs.getInt("emp_id"));
				e.setEmp_code(rs.getString("emp_code"));
				e.setFull_name(rs.getString("full_name"));
				e.setJob_title(rs.getString("job_title"));
				e.setSalary(rs.getFloat("salary"));
				e.setCreate_date(rs.getDate("create_date"));
				e.setDepartment(rs.getString("department"));
				e.setEmail(rs.getString("email"));
				e.setJoin_date(rs.getDate("join_date"));
				e.setMobile_no(rs.getString("mobile_no"));
				e.setModification_date(rs.getDate("modification_date"));*/
				EmployeeSearch e = new EmployeeSearch();
				e.setEmp_id(rs.getInt("emp_id"));
				e.setEmp_code(rs.getString("emp_code"));
				e.setFull_name(rs.getString("full_name"));
				e.setJob_title(rs.getString("job_title"));
				e.setSalary(rs.getFloat("salary"));
				e.setDepartment(rs.getString("department"));
				e.setEmail(rs.getString("email"));
				e.setJoin_date(rs.getDate("join_date"));
				e.setMobile_no(rs.getString("mobile_no"));
				e.setRole_name(rs.getString("role_name"));
				
				
				Date jdate=e.getJoin_date();
				LocalDate join_date = ((java.sql.Date) jdate).toLocalDate();
		        LocalDate today = LocalDate.now();
		        
		        Period workingtime = Period.between(join_date, today);
		        int year = workingtime.getYears();
		        int month = workingtime.getMonths();
		        int days  = workingtime.getDays();
		        if(year<0 || month<0 || days<0)
		        {
		        	String dates = "Employee will join in future.";
		        	e.setDates(dates);
		        }
		        else
		        {
		        	String dates="Y = "+year+" M ="+month+" D = "+days;
		        	e.setDates(dates);
		        }
		        e.setCheck(rs.getBoolean("checkbox"));
				e.setStatus(rs.getString("status"));
				
				e.setRole_name(rs.getString("role_name"));
				list.add(e);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public EmployeeSearch getEmployeeById(int emp_id)
	{
		EmployeeSearch e=new EmployeeSearch();
		try
		{
			Connection cn=EmployeeDao.getConnection();
			PreparedStatement ps=cn.prepareStatement("select * from employee emp inner join employee_role role on emp.role_id = role.role_id where emp_id=?");
			ps.setInt(1, emp_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				e.setEmp_id(rs.getInt("emp_id"));
				e.setFull_name(rs.getString("full_name"));
				e.setJob_title(rs.getString("job_title"));
				e.setSalary(rs.getFloat("salary"));
				e.setDepartment(rs.getString("department"));
				e.setEmail(rs.getString("email"));
				e.setJoin_date(rs.getDate("join_date"));
				e.setMobile_no(rs.getString("mobile_no"));
				e.setStatus(rs.getString("status"));
				e.setCheck(rs.getBoolean("checkbox"));
				e.setRole_name(rs.getString("role_name"));
				//e.setRole_id(rs.getInt("role_id"));
			}
			
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
		return e;
	}
	public void update(Employee e)
	{
		try
		{
			Connection cn=EmployeeDao.getConnection();
			PreparedStatement ps=cn.prepareStatement("update employee set full_name=?,job_title=?,salary=?,department=?,email=?,mobile_no=?,join_date=?,modification_date=?,status=?,checkbox=?,role_id=? where emp_id=?");
		
			ps.setString(1,e.getFull_name());  
            ps.setString(2,e.getJob_title());
            ps.setFloat(3, e.getSalary());
            ps.setString(4, e.getDepartment());
            ps.setString(5, e.getEmail());
            ps.setString(6, e.getMobile_no());
            
            Date jdate=e.getJoin_date();
            java.sql.Date join_date=new java.sql.Date(jdate.getTime());
            ps.setDate(7, join_date);
            
            Date mDate = e.getModification_date();
            java.sql.Date modificationdate = new java.sql.Date(mDate.getTime());
			ps.setDate(8, modificationdate);
			
			ps.setString(9, e.getStatus());
			ps.setBoolean(10, e.isCheck());
			ps.setInt(11, e.getRole_id());
			ps.setInt(12,e.getEmp_id());  
            ps.executeUpdate();    
            cn.close();  
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
	}
	public void delete(int id)
	{
		try
		{
			Connection cn=EmployeeDao.getConnection();
			PreparedStatement ps=cn.prepareStatement("delete from employee where emp_id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
	}
}
