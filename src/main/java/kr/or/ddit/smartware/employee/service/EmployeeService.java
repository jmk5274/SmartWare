package kr.or.ddit.smartware.employee.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.repository.IEmployeeDao;
import kr.or.ddit.smartware.post.model.Post;

@Service
public class EmployeeService implements IEmployeeService{

	@Resource(name = "employeeDao")
	private IEmployeeDao employeeDao; 
	
	public Employee getEmployee(String emp_id) {
		return employeeDao.getEmployee(emp_id);
	}
	
	@Override
	public List<Employee> allEmployeeList() {
		List<Employee> list = employeeDao.allEmployeeList();
		return list;
	}
	
	@Override
	public List<Employee> getEmployeeList(Map map) {
		List<Employee> list = employeeDao.getEmployeeList(map);
		return list;
	}

	@Override
	public int insertEmployee(Employee employee) {
		return employeeDao.insertEmployee(employee);
	}

	@Override
	public int deleteEmployee(String emp_id) {
		return employeeDao.deleteEmployee(emp_id);
	}

	@Override
	public int updateEmployee(Employee employee) {
		return employeeDao.updateEmployee(employee);
	}
	
	@Override
	public int updateEmployeeAble(Employee employee) {
		return employeeDao.updateEmployeeAble(employee);
	}
	
	@Override
	public int updateEmployeeRank(Employee employee) {
		return employeeDao.updateEmployeeRank(employee);
	}
	
	@Override
	public int updateEmployeePosition(Employee employee) {
		return employeeDao.updateEmployeePosition(employee);
	}
	
	@Override
	public int updateEmployeeDepartment(Employee employee) {
		return employeeDao.updateEmployeeDepartment(employee);
	}
	
	@Override
	public int updateEmployeeJob(Employee employee) {
		return employeeDao.updateEmployeeJob(employee);
	}

}
