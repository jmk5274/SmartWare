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

	/**
	* Method : insertPopup
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param popup
	* @return
	* Method 설명 : 팝업 등록
	*/
	int insertPopup(Popup popup);

	/**
	* Method : deletePopup
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param pop_id
	* @return
	* Method 설명 : 팝업 삭제
	*/
	int deletePopup(String pop_id);

	/**
	* Method : getPopup
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param pop_id
	* @return
	* Method 설명 : 선택 팝업 정보 조회
	*/
	Popup getPopup(String pop_id);

	/**
	* Method : updatePopup
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param popup
	* @return
	* Method 설명 : 팝업 정보 수정
	*/
	int updatePopup(Popup popup);

	/**
	* Method : insertPopupNoLook
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 팝업 오늘만 보지 않기
	*/
	int insertPopupNoLook(Map map);
	
	/**
	* Method : getPopupNoLook
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : popup_nolook 테이블 조회
	*/
	List<Map> getPopupNoLook(String emp_id);
}
