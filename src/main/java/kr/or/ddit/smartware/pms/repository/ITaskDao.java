package kr.or.ddit.smartware.pms.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.pms.model.ProTask;
import kr.or.ddit.smartware.pms.model.Task;

public interface ITaskDao {

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
	* Method : getAllProjectTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 프로젝트의 전체 업무 리스트 반환
	*/
	List<Task> getAllProjectTask(String emp_id);

	/**
	* Method : getEmpProjectTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 프로젝트의 사원의 업무 리스트 반환
	*/
	List<Task> getEmpProjectTask(Map<String, String> map);

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
	* Method 설명 : 일감 반환(gantt)
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
	* Method : getAllDelayTask
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 모든 프로젝트의 지연업무 조회 
	*/
	List<Task> getAllDelayTask(String emp_id);

	/**
	* Method : getAllTodayTask
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 모든 프로젝트의 일간업무 조회 
	*/
	List<Task> getAllTodayTask(String emp_id);
	
	/**
	* Method : getAllWeekTask
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 모든 프로젝트의 주간업무 조회
	*/
	List<Task> getAllWeekTask(String emp_id);
	
	/**
	* Method : insertTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task
	* @return
	* Method 설명 : 일정 추가
	*/
	int insertTask(Task task);

	/**
	* Method : insertProTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param proTask
	* @return
	* Method 설명 : 일정의 담당자 추가 
	*/
	int insertProTask(ProTask proTask);

	/**
	* Method : updateTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 일감 수정
	*/
	int updateTask(Task task);

	/**
	* Method : updateProTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 일감 담당자 수정
	*/
	int updateProTask(ProTask proTask);
	
	/**
	* Method : deleteTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 삭제
	*/
	int deleteTask(String task_id);
	
	/**
	* Method : deleteProTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 담당자 삭제
	*/
	int deleteProTask(String task_id);
	
	/**
	* Method : deleteTaskHistory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 히스토리 삭제
	*/
	int deleteTaskHistory(String task_id);

}
