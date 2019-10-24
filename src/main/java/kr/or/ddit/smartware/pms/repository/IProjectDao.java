package kr.or.ddit.smartware.pms.repository;

import java.util.List;

import kr.or.ddit.smartware.pms.model.Project;

public interface IProjectDao {

	List<Project> getAllPastProject(String emp_id);

	List<Project> getAllRunningProject(String emp_id);

}
