package kr.or.ddit.smartware.employee.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.employee.model.Department;
import kr.or.ddit.smartware.employee.model.Employee;


public interface IDepartmentService {

	/**
	* Method : getDepartNm
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param depart_id
	* @return
	* Method 설명 : 부서 아이디에 해당하는 부서 이름을 반환
	*/
	String getDepartNm(String depart_id);
	
	List<Department> getAllDepartment();
	
	/**
	* Method : getAllDepartEmpList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return Map(key: emp_id, value: List<Employee>)
	* Method 설명 : 모든 부서의 사원리스트를 반환
	*/
	Map<String, List<Employee>> getAllDepartEmpList();
}
