package kr.or.ddit.smartware.employee.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.employee.model.Job;
import kr.or.ddit.smartware.employee.model.Position;

public interface IJobDao {

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
