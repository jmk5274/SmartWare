package kr.or.ddit.smartware.email.service;

import java.util.List;
import java.util.Map;

public interface IEmailService {
	/**
	 * Method : getAddressbookList
	 * 작성자 : KIM DO HOON
	 * 변경이력 :
	 * @param depart_id
	 * @return
	 * Method 설명 : 부서에 해당하는 사원들 출력
	 */
	List<Map> getAddressbookList(String depart_id);
	
	
	/**
	 * Method : getEmpSearchList
	 * 작성자 : KIM DO HOON
	 * 변경이력 :
	 * @param keyword
	 * @return
	 * Method 설명 : 사원검색을통한 조회
	 */
	List<Map> getEmpSearchList(String keyword);
	
	/**
	 * Method : getDepSearchList
	 * 작성자 : KIM DO HOON
	 * 변경이력 :
	 * @param keyword
	 * @return
	 * Method 설명 : 부서검색을 통한 조회
	 */
	List<Map> getDepSearchList(String keyword);
}
