package kr.or.ddit.smartware.employee.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.repository.IEmployeeDao;

@Service
public class EmployeeService implements IEmployeeService{

	@Resource(name = "employeeDao")
	private IEmployeeDao employeeDao; 
	
	public Employee getEmployee(String emp_id) {
		return employeeDao.getEmployee(emp_id);
	}
	
	@Override
	public List<Employee> getEmployeeList() {
		
		return employeeDao.getEmployeeList();
	}

}
