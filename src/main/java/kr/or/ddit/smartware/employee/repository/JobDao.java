package kr.or.ddit.smartware.employee.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.employee.model.Job;
import kr.or.ddit.smartware.employee.model.Position;

@Repository
public class JobDao implements IJobDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 
	* Method : getJobNm
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param job_id
	* @return
	* Method 설명 : 직급 아이디에 해당하는 직급명을 반환
	 */
	@Override
	public String getJobNm(String job_id) {
		return sqlSession.selectOne("job.getJobNm", job_id);
	}

	@Override
	public List<Job> getAllJob() {
		return sqlSession.selectList("job.getAllJob");
	}

}
