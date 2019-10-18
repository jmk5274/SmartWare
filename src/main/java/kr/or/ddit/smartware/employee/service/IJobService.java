package kr.or.ddit.smartware.employee.service;

import java.util.List;

import kr.or.ddit.smartware.employee.model.Job;

public interface IJobService {

	/**
	 * 
	* Method : getJobNm
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param job_id
	* @return
	* Method 설명 : 직급 아이디에 해당하는 직급명을 반환
	 */
	String getJobNm(String job_id);
	
	List<Job> getAllJob();
	
}
