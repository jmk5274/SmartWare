package kr.or.ddit.smartware.pms.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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

}
