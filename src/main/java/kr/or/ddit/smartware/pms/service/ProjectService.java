package kr.or.ddit.smartware.pms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.pms.model.Project;
import kr.or.ddit.smartware.pms.repository.IProjectDao;
import kr.or.ddit.smartware.pms.repository.ITaskDao;

@Service
public class ProjectService implements IProjectService {

	@Resource(name="projectDao")
	private IProjectDao projectDao;
	
	@Resource(name="taskDao")
	private ITaskDao taskDao;
	
	/**
	* Method : getAllPastProject
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 현 시각 기준 사원이 속해있는 종료된 프로젝트를 반환
	*/
	@Override
	public List<Project> getAllPastProject(String emp_id) {
		return projectDao.getAllPastProject(emp_id);
	}

	/**
	* Method : getAllRunningProject
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 현 시각 기준 사원이 속해있는 진행중인 프로젝트를 반환
	*/
	@Override
	public List<Project> getAllRunningProject(String emp_id) {
		return projectDao.getAllRunningProject(emp_id);
	}

	/**
	* Method : getProjectEmployee
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 구성원 리스트를 반환
	*/
	@Override
	public List<Employee> getProjectEmployee(String pro_id) {
		return projectDao.getProjectEmployee(pro_id);
	}
	private static final Logger logger = LoggerFactory.getLogger(ProjectService.class);
	@Override
	public Map<String, Object> getDetailProject(String emp_id, String type) {
		// 사원이 속한 프로젝트 리스트(running or past)
		List<Project> projectList = null;
		
		if(type.equals("past")) // past
			projectList = projectDao.getAllPastProject(emp_id);
		else // running
			projectList = projectDao.getAllRunningProject(emp_id);
		
		// 결과를 저장할 맵 객체(2차원 맵)
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		for(Project project : projectList) {
			// 2차원 맵(결과)에 저장할 맵 객체
			Map<String, Object> innerMap = new HashMap<String, Object>();
			
			// 1. 프로젝트
			innerMap.put("project", project); 
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("emp_id", emp_id);
			map.put("pro_id", project.getPro_id());
			
			// 2. 주간 업무
			innerMap.put("weekTask", taskDao.getWeekTask(map)); 
			// 3. 지연 업무
			innerMap.put("delayTask", taskDao.getDelayTask(map)); 
			
			// 4. 구성원
			innerMap.put("projectEmployee", projectDao.getProjectEmployee(project.getPro_id())); 
			
			// 5. 프로젝트의 전체 업무
			innerMap.put("allProjectTask", taskDao.getAllProjectTask(emp_id));
			// 6. 프로젝트의 사원의 업무
			innerMap.put("empProjectTask", taskDao.getEmpProjectTask(map));	   
			
			// 7. 구성원의 직책, 사원아이디, 사원이름, 부서이름
			innerMap.put("projectEmpJob", projectDao.getProjectEmpJob(project.getPro_id()));
			
			// 8. 프로젝트 전체 차트
			innerMap.put("allProjectChart", projectDao.getAllProjectChart(project.getPro_id()));
			// 9. 프로젝트 사원 차트
			innerMap.put("empProjectChart", projectDao.getEmpProjectChart(map));

			// 2차원 맵에 innerMap 주입
			rtnMap.put("project_" + project.getPro_id(), innerMap);
		}
		
		return rtnMap;
	}

}
