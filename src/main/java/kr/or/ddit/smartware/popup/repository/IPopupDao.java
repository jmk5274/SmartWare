package kr.or.ddit.smartware.popup.repository;

import java.util.List;

import kr.or.ddit.smartware.popup.model.Popup;

public interface IPopupDao {

	/**
	* Method : getAllPopupList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 전체 팝업리스트 조회
	*/
	List<Popup> getAllPopupList();

}
