package kr.or.ddit.smartware.pms.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.pms.model.Project;

public interface IProjectDao {

	/**
	* Method : getProject
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트 반환
	*/
	Project getProject(String pro_id);
	
	/**
	* Method : getAllPastProject
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 현 시각 기준 사원이 속해있는 종료된 프로젝트를 반환
	*/
	List<Project> getAllPastProject(String emp_id);

	/**
	* Method : getAllRunningProject
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 현 시각 기준 사원이 속해있는 진행중인 프로젝트를 반환
	*/
	List<Project> getAllRunningProject(String emp_id);

	/**
	* Method : getProjectEmployee
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 구성원 리스트를 반환
	*/
	List<Employee> getProjectEmployee(String pro_id);
	
	/**
	* Method : getProjectEmpJob
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 구성원의 이름, 직책, 아이디, 부서 반환
	*/
	List<Map<String, Object>> getProjectEmpJob(String pro_id);
	
	/**
	* Method : getAllProjectChart
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 전체 차트 반환
	*/
	List<Map<String, Object>> getAllProjectChart(String pro_id);
	
	/**
	* Method : getEmpProjectChart
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 프로젝트의 사원의 차트 반환
	*/
	List<Map<String, Object>> getEmpProjectChart(Map<String, String> map);

	/**
	* Method : insertProject
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param project
	* @return
	* Method 설명 : 프로젝트 추가
	*/
	int insertProject(Project project);

	/**
	* Method : insertProjectMember
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 프로젝트 구성원 추가
	*/
	int insertProjectMember(Map<String, String> map);

}
