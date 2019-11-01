package kr.or.ddit.smartware.pms.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.pms.model.ProTask;
import kr.or.ddit.smartware.pms.model.Task;

public interface ITaskService {
	
	/**
	* Method : getWeekTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 주간 업무 리스트 반환
	*/
	List<Task> getWeekTask(Map<String, String> map);
	
	/**
	* Method : getDelayTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 지연중인 업무 리스트 반환
	*/
	List<Task> getDelayTask(Map<String, String> map);

	/**
	* Method : getAllTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 전체 일감 반환(gantt)
	*/
	List<Map<String, Object>> getAllTask(String pro_id);
	
	/**
	* Method : getTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 반환
	*/
	List<Map<String, Object>> getTask(String task_id);
	
	/**
	* Method : getEmpGantt
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @param emp_id
	* @return
	* Method 설명 : 프로젝트의 사원 일감 반환(gantt)
	*/
	List<Map<String, Object>> getEmpGantt(String pro_id, String emp_id);

	/**
	* Method : insertTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task
	* @param emp_id
	* @return
	* Method 설명 : 일정 추가
	*/
	String insertTask(Task task, String emp_id);
	
	/**
	* Method : deleteTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 삭제, 일감담당자 삭제, 일감히스토리 삭제 
	*/
	int deleteTask(String task_id);
}
