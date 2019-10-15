package kr.or.ddit.smartware.employee.service;

import java.util.List;
import kr.or.ddit.smartware.employee.model.Position;
import java.util.Map;

public interface IPositionService {

	/**
	* Method : getPosiNm
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param posi_id
	* @return
	* Method 설명 : 직책 아이디에 해당하는 직책 이름을 반환
	*/
	String getPosiNm(String posi_id);
	
	List<Position> getAllPosition();
	
	/**
	 * Method : getPositionList
	 * 작성자 : KIM DO HOON
	 * 변경이력 :
	 * @return
	 * Method 설명 : 
	 */
	List<Map> getPositionList();
}
