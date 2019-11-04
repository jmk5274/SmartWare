package kr.or.ddit.smartware.pms.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.pms.model.ProTask;
import kr.or.ddit.smartware.pms.model.Task;

@Repository
public class TaskDao implements ITaskDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
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
		return sqlSession.selectList("task.getWeekTask", map);
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
		return sqlSession.selectList("task.getDelayTask", map);
	}

	/**
	* Method : getAllProjectTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 프로젝트의 전체 업무 리스트 반환
	*/
	@Override
	public List<Task> getAllProjectTask(String emp_id) {
		return sqlSession.selectList("task.getAllProjectTask", emp_id);
	}

	/**
	* Method : getEmpProjectTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 프로젝트의 사원의 업무 리스트 반환
	*/
	@Override
	public List<Task> getEmpProjectTask(Map<String, String> map) {
		return sqlSession.selectList("task.getEmpProjectTask", map);
	}

	/**
	* Method : getAllGantt
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 전체 일감 반환(gantt)
	*/
	@Override
	public List<Map<String, Object>> getAllTask(String pro_id) {
		return sqlSession.selectList("task.getAllTask", pro_id);
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
		return sqlSession.selectList("task.getTask", task_id);
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
		Map<String, String> map = new HashMap<String, String>();
		map.put("pro_id", pro_id);
		map.put("emp_id", emp_id);
		
		return sqlSession.selectList("task.getEmpGantt", map);
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
	public List<Task> getAllDelayTask(String emp_id) {
		return sqlSession.selectList("task.getAllDelayTask", emp_id);
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
	public List<Task> getAllTodayTask(String emp_id) {
		return sqlSession.selectList("task.getAllTodayTask", emp_id);
	}
	
	/**
	* Method : getAllWeekDlayTask
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 모든 프로젝트의 주간 지연업무 조회
	*/
	@Override
	public List<Task> getAllWeekDlayTask(String emp_id) {
		return sqlSession.selectList("task.getAllWeekDlayTask", emp_id);
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
	public List<Task> getAllWeekTask(String emp_id) {
		return sqlSession.selectList("task.getAllWeekTask", emp_id);
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
	public int insertTask(Task task) {
		return sqlSession.insert("task.insertTask", task);
	}

	/**
	* Method : insertProTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param proTask
	* @return
	* Method 설명 : 일정의 담당자 추가
	*/
	@Override
	public int insertProTask(ProTask proTask) {
		return sqlSession.insert("task.insertProTask", proTask);
	}

	/**
	* Method : updateTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 일감 수정
	*/
	@Override
	public int updateTask(Task task) {
		return sqlSession.update("task.updateTask", task);
	}

	/**
	* Method : updateProTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 일감 담당자 수정
	*/
	@Override
	public int updateProTask(ProTask proTask) {
		return sqlSession.update("task.updateProTask", proTask);
	}

	/**
	* Method : updateParentPer
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pa_task_id
	* @return
	* Method 설명 : 자식 task가 변경되었을 때 부모 task의 per 갱신
	*/
	@Override
	public int updateParentPer(String pa_task_id) {
		return sqlSession.update("task.updateParentPer", pa_task_id);
	}
	
	/**
	* Method : deleteTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 삭제
	*/
	@Override
	public int deleteTask(String task_id) {
		return sqlSession.delete("task.deleteTask", task_id);
	}

	/**
	* Method : deleteProTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 담당자 삭제
	*/
	@Override
	public int deleteProTask(String task_id) {
		return sqlSession.delete("task.deleteProTask", task_id);
	}

	/**
	* Method : deleteTaskHistory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param task_id
	* @return
	* Method 설명 : 일감 히스토리 삭제
	*/
	@Override
	public int deleteTaskHistory(String task_id) {
		return sqlSession.delete("task.deleteTaskHistory", task_id);
	}

}
