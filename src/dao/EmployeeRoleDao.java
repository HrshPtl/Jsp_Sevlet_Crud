package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import controller.EmployeeRole;
import pojo.Employee;
import pojo.Role;


public class EmployeeRoleDao {
	
	
	public void add(Role r)
	{
		try
		{
			Connection cn=EmployeeDao.getConnection();
			PreparedStatement ps=cn.prepareStatement("insert into employee_role (role_name) values(?)");
			ps.setString(1, r.getRole_name());
			ps.executeUpdate();
			cn.close();
		}
		catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public List<Role> getAllRole()
	{
		List<Role> list=new ArrayList<Role>();
		try
		{
			Connection cn=EmployeeDao.getConnection();
			PreparedStatement ps=cn.prepareStatement("select * from employee_role");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Role r=new Role();
				r.setRole_id(rs.getInt("role_id"));
				r.setRole_name(rs.getString("role_name"));
				list.add(r);
			}
			cn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}	