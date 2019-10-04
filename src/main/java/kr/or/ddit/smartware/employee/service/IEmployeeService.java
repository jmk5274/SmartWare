package kr.or.ddit.smartware.employee.service;

import java.util.List;

import kr.or.ddit.smartware.employee.model.Employee;

public interface IEmployeeService {

	/**
	 * 
	* Method : getEmployee
	* 작성자 : PC-04
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원 상세 조회
	 */
	Employee getEmployee(String emp_id);
	
	List<Employee> getEmployeeList();

}
