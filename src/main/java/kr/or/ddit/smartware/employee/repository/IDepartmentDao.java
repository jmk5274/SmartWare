package kr.or.ddit.smartware.employee.repository;

import java.util.List;
import kr.or.ddit.smartware.employee.model.Department;
import kr.or.ddit.smartware.employee.model.Employee;

import java.util.Map;

public interface IDepartmentDao {

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
	* Method : getDepartEmpList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 부서에 속한 사원의 리스트를 반환 
	*/
	List<Employee> getDepartEmpList(String depart_id);
}
