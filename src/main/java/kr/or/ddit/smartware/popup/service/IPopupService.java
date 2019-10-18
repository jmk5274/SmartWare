package kr.or.ddit.smartware.popup.service;

import java.util.List;

import kr.or.ddit.smartware.popup.model.Popup;

public interface IPopupService {

	/**
	* Method : getAllPopupList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 팝업 전체리스트 조회
	*/
	List<Popup> getAllPopupList();

}
