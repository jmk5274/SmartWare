package kr.or.ddit.smartware.pms.service;

import java.util.List;

import kr.or.ddit.smartware.pms.model.Project;

public interface IProjectService {

	List<Project> getAllPastProject(String emp_id);

	List<Project> getAllRunningProject(String emp_id);

}
