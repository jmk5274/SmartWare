package kr.or.ddit.smartware.employee.repository;

import java.util.List;

import kr.or.ddit.smartware.employee.model.Employee;

public interface IEmployeeDao {

	List<Employee> getEmployeeList();
	
}
