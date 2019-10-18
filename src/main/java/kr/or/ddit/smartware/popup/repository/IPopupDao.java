package kr.or.ddit.smartware.popup.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.popup.model.Popup;

public interface IPopupDao {

	/**
	* Method : getPagePopupList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 팝업 페이징 리스트 조회
	*/
	List<Popup> getPagePopupList(Map<String, Integer> map);

	/**
	* Method : getAllPopupList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 전체 팝업리스트 조회
	*/
	List<Popup> getAllPopupList();
	
}
