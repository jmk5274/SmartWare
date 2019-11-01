package kr.or.ddit.smartware.pms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.pms.model.ProTask;
import kr.or.ddit.smartware.pms.model.Project;
import kr.or.ddit.smartware.pms.model.Task;
import kr.or.ddit.smartware.pms.repository.IProjectDao;
import kr.or.ddit.smartware.pms.repository.ITaskDao;

@Service
public class TaskService implements ITaskService {

	@Resource(name="taskDao")
	private ITaskDao taskDao;
	
	@Resource(name="projectDao")
	private IProjectDao projectDao;
	
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
	* Method : getAllDelayTask
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 모든 프로젝트의 지연업무 조회 
	*/
	@Override
	public List<Map<String, Object>> getAllDelayTask(String emp_id) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<Task> taskList = taskDao.getAllDelayTask(emp_id);
		
		for(Task task : taskList) {
			Map<String, Object> subMap = new HashMap<String, Object>();
			subMap.put("task_id", task.getTask_id());
			subMap.put("task_cont", task.getTask_cont());
			subMap.put("st_dt", task.getSt_dt());
			subMap.put("end_dt", task.getEnd_dt());
			subMap.put("pa_task_id", task.getPa_task_id());
			subMap.put("per", task.getPer());
			subMap.put("pro_id", task.getPro_id());
			subMap.put("pro_nm", projectDao.getProject(task.getPro_id()));
			
			list.add(subMap);
		}
		
		return list;
	}

	/**
	* Method : getAllTodayTask
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 모든 프로젝트의 일간업무 조회 
	*/
	@Override
	public List<Map<String, Object>> getAllTodayTask(String emp_id) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<Task> taskList = taskDao.getAllTodayTask(emp_id);
		
		for(Task task : taskList) {
			Map<String, Object> subMap = new HashMap<String, Object>();
			subMap.put("task_id", task.getTask_id());
			subMap.put("task_cont", task.getTask_cont());
			subMap.put("st_dt", task.getSt_dt());
			subMap.put("end_dt", task.getEnd_dt());
			subMap.put("pa_task_id", task.getPa_task_id());
			subMap.put("per", task.getPer());
			subMap.put("pro_id", task.getPro_id());
			subMap.put("pro_nm", projectDao.getProject(task.getPro_id()));
			
			list.add(subMap);
		}
		
		return list;
	}

	/**
	* Method : getAllWeekTask
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 모든 프로젝트의 주간업무 조회
	*/
	@Override
	public List<Map<String, Object>> getAllWeekTask(String emp_id) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<Task> taskList = taskDao.getAllWeekTask(emp_id);
		
		for(Task task : taskList) {
			Map<String, Object> subMap = new HashMap<String, Object>();
			subMap.put("task_id", task.getTask_id());
			subMap.put("task_cont", task.getTask_cont());
			subMap.put("st_dt", task.getSt_dt());
			subMap.put("end_dt", task.getEnd_dt());
			subMap.put("pa_task_id", task.getPa_task_id());
			subMap.put("per", task.getPer());
			subMap.put("pro_id", task.getPro_id());
			subMap.put("pro_nm", projectDao.getProject(task.getPro_id()));
			
			list.add(subMap);
		}
		
		return list;
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
