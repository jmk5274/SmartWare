package kr.or.ddit.smartware.pms.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.pms.model.Project;
import kr.or.ddit.smartware.pms.repository.IProjectDao;

@Service
public class ProjectService implements IProjectService {

	@Resource(name="projectDao")
	private IProjectDao projectDao;
	
	@Override
	public List<Project> getAllPastProject(String emp_id) {
		return projectDao.getAllPastProject(emp_id);
	}

	@Override
	public List<Project> getAllRunningProject(String emp_id) {
		return projectDao.getAllRunningProject(emp_id);
	}

}
