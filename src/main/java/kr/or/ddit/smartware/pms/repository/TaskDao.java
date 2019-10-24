package kr.or.ddit.smartware.pms.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
