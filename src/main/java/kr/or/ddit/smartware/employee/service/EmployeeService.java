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
	
	@Override
	public List<Employee> getEmployeeList() {
		
		return employeeDao.getEmployeeList();
	}

}
