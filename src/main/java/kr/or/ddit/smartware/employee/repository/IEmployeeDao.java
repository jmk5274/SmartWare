package kr.or.ddit.smartware.employee.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.post.model.Post;

public interface IEmployeeDao {
	
	public List<Employee> allEmployeeList();

	List<Map> getDetailEmpList();

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
	 * Method : getEmployeeDetail
	 * 작성자 : Bae Sang Hyun
	 * 변경이력 :
	 * @param emp_id
	 * @return
	 * Method 설명 : 사원 상세 정보조회 ( 부서, 직책, 직급 이름 추가 )
	 */
	Map getEmployeeDetail(String emp_id);
	
	
	/**
	 * Method : getEmployeeDetail2
	 * 작성자 : KIM DO HOON
	 * 변경이력 :
	 * @param emp_id
	 * @return
	 * Method 설명 : 사원 상세 정보조회 ( 부서, 직책, 직급 이름 추가 )
	 */
	Map getEmployeeDetail2(String emp_id);
	
	/**
	 * Method : getEmployeeDetail
	 * 작성자 : KIM DO HOON
	 * 변경이력 :
	 * @param depart_id
	 * @return
	 * Method 설명 : 부서별 사원 상세정보 ( 부서, 직책, 직급 이름 추가 )
	 */
	List<Map> getDepartEmpDetail(String depart_id);
	
	
	
	List<Map> getDetailPagingList(Map map);
	
	
	/**
	 * Method : SearchEmp
	 * 작성자 : KIM DO HOON
	 * 변경이력 :
	 * @param keyword
	 * @return
	 * Method 설명 : 주소록 사원검색 
	 */
	List<Map> searchEmp(String keyword);
	
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
	* Method 설명 : 사원 계정 리스트 수정
	 */
	int updateEmployeeRank(Employee employee); 

	/**
	 * 
	* Method : updateEmployeePosition
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param employee
	* @return
	* Method 설명 : 사원 직급 수정
	 */
	int updateEmployeePosition(Employee employee);
	
	/**
	 * 
	* Method : updateEmployeeDepartment
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param employee
	* @return
	* Method 설명 : 사원 부서 수정
	 */
	int updateEmployeeDepartment(Employee employee);
	
	/**
	 * 
	* Method : updateEmployeeJob
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param employee
	* @return
	* Method 설명 : 사원 직책 수정
	 */
	int updateEmployeeJob(Employee employee);
	
	/**
	 * 
	* Method : idCheck
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 아이디 중복 체크
	 */
	int idCheck(String emp_id);
	
}
