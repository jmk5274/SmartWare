package kr.or.ddit.smartware.pms.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.pms.model.Project;

public interface IProjectService {

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
	
	Map<String, Object> getDetailProject(String emp_id, String type);

}