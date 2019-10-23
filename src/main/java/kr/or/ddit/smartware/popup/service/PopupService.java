package kr.or.ddit.smartware.popup.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.popup.model.Popup;
import kr.or.ddit.smartware.popup.repository.IPopupDao;

@Service
public class PopupService implements IPopupService{

	@Resource(name = "popupDao")
	private IPopupDao popupDao;
	
	/**
	* Method : getPagePopupList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 팝업 페이징리스트 조회
	*/
	@Override
	public List<Popup> getPagePopupList(Map<String, Integer> map) {
		return popupDao.getPagePopupList(map);
	}

	/**
	* Method : getAllPopupList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 팝업 전체리스트 조회
	*/
	@Override
	public List<Popup> getAllPopupList() {
		return popupDao.getAllPopupList();
	}

	@Override
	public int insertPopup(Popup popup) {
		return popupDao.insertPopup(popup);
	}

	@Override
	public int deletePopup(String pop_id) {
		return popupDao.deletePopup(pop_id);
	}

	@Override
	public Popup getPopup(String pop_id) {
		return popupDao.getPopup(pop_id);
	}

	@Override
	public int updatePopup(Popup popup) {
		return popupDao.updatePopup(popup);
	}

	@Override
	public int insertPopupNoLook(Map map) {
		return popupDao.insertPopupNoLook(map);
	}

	@Override
	public List<Map> getPopupNoLook(String emp_id) {
		return popupDao.getPopupNoLook(emp_id);
	}

}
