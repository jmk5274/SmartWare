package kr.or.ddit.smartware.employee.service;

import java.util.List;
import java.util.Map;

public interface IDepartmentService {

	/**
	* Method : getDepartNm
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param depart_id
	* @return
	* Method 설명 : 부서 아이디에 해당하는 부서 이름을 반환
	*/
	String getDepartNm(String depart_id);
	
	
	/**
	 * Method : getDepartMentList
	 * 작성자 : KIM DO HOON
	 * 변경이력 :
	 * @return
	 * Method 설명 : 부서목록 출력
	 */
	List<Map> getDepartMentList();
}
