package kr.or.ddit.smartware.employee.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.post.model.Post;

public interface IEmployeeDao {
	
	public List<Employee> allEmployeeList();

	/**
	 * 
	* Method : getEmployee
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원 상세 조회
	 */
	Employee getEmployee(String emp_id);
	
	/**
	 * 
	* Method : getEmployeeList
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @return
	* Method 설명 : 사원 리스트 출력
	 */
	List<Employee> getEmployeeList(Map map);
	
	/**
	 * 
	* Method : insertEmployee
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param employee
	* @return
	* Method 설명 : 사원 추가
	 */
	int insertEmployee(Employee employee);
	
	/**
	 * 
	* Method : deleteEmployee
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원 삭제
	 */
	int deleteEmployee(String emp_id);

	/**
	 * 
	* Method : updateEmployee
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param employee
	* @return
	* Method 설명 : 마이페이지 사원 계정 수정
	 */
	int updateEmployee(Employee employee);
	
	/**
	 * 
	* Method : updateEmployeeList
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param employee
	* @return
	* Method 설명 : 사원 계정 리스트 수정(비활성화)
	 */
	int updateEmployeeAble(Employee employee);
	
	/**
	 * 
	* Method : updateEmployeeRank
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param employee
	* @return
	* Method 설명 : 사원 계정 리스트 수정(직책 변경)
	 */
	int updateEmployeeRank(Employee employee); 

}
