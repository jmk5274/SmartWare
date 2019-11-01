package kr.or.ddit.smartware.pms.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.pms.model.ProTask;
import kr.or.ddit.smartware.pms.model.Task;
import kr.or.ddit.smartware.pms.repository.ITaskDao;

@Service
public class TaskService implements ITaskService {

	@Resource(name="taskDao")
	private ITaskDao taskDao;
	
	/**
	* Method : getWeekTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 주간 업무 리스트 반환
	*/
	@Override
	public List<Task> getWeekTask(Map<String, String> map) {
		return taskDao.getWeekTask(map);
	}

	/**
	* Method : getDelayTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 지연중인 업무 리스트 반환
	*/
	@Override
	public List<Task> getDelayTask(Map<String, String> map) {
		return taskDao.getDelayTask(map);
	}

	/**
	* Method : getAllTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 전체 일감 반환(gantt)
	*/
	@Override
	public List<Map<String, Object>> getAllTask(String pro_id) {
		return taskDao.getAllTask(pro_id);
	}
	
	/**
	* Method : getTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 반환
	*/
	@Override
	public List<Map<String, Object>> getTask(String task_id) {
		return taskDao.getTask(task_id);
	}

	/**
	* Method : getEmpGantt
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @param emp_id
	* @return
	* Method 설명 : 프로젝트의 사원 일감 반환(gantt)
	*/
	@Override
	public List<Map<String, Object>> getEmpGantt(String pro_id, String emp_id) {
		return taskDao.getEmpGantt(pro_id, emp_id);
	}

	/**
	* Method : insertTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task
	* @return
	* Method 설명 : 일정 추가
	*/
	@Override
	public String insertTask(Task task, String emp_id) {
		taskDao.insertTask(task); // 일감 추가
		ProTask proTask = new ProTask(emp_id, task.getPro_id(), task.getTask_id());
		taskDao.insertProTask(proTask); // 일감 담당자 추가 
		
		return task.getTask_id();
	}
	
	/**
	* Method : updateTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task
	* @param emp_id
	* @return
	* Method 설명 : 일정 수정, 일정 담당자 수정 
	*/
	@Override
	public int updateTask(Task task, String emp_id) {
		ProTask proTask = new ProTask(emp_id, task.getPro_id(), task.getTask_id());
		taskDao.updateProTask(proTask);

		return taskDao.updateTask(task);
	}

	/**
	* Method : deleteTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 삭제, 일감담당자 삭제, 일감히스토리 삭제 
	*/
	@Override
	public int deleteTask(String task_id) {
		taskDao.deleteTaskHistory(task_id);
		taskDao.deleteProTask(task_id);
		
		return taskDao.deleteTask(task_id);
	}

}
