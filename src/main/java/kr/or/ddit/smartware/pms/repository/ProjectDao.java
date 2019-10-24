package kr.or.ddit.smartware.pms.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.pms.model.Project;

@Repository
public class ProjectDao implements IProjectDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Project> getAllPastProject(String emp_id) {
		return sqlSession.selectList("project.getAllPastProject", emp_id);
	}

	@Override
	public List<Project> getAllRunningProject(String emp_id) {
		return sqlSession.selectList("project.getAllRunningProject", emp_id);
	}

}
