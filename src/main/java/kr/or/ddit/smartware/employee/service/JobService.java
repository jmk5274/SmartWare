package kr.or.ddit.smartware.employee.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.employee.model.Job;
import kr.or.ddit.smartware.employee.model.Position;
import kr.or.ddit.smartware.employee.repository.IJobDao;
import kr.or.ddit.smartware.employee.repository.IPositionDao;

@Service
public class JobService implements IJobService {

	@Resource(name = "jobDao")
	private IJobDao jobDao; 
	
	/**
	* Method : getPosiNm
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param posi_id
	* @return
	* Method 설명 : 직책 아이디에 해당하는 직책 이름을 반환
	*/
	@Override
	public String getJobNm(String job_id) {
		return jobDao.getJobNm(job_id);
	}

	@Override
	public List<Job> getAllJob() {
		return jobDao.getAllJob();
	}
}
