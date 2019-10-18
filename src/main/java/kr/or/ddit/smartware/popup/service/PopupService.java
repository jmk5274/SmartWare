package kr.or.ddit.smartware.popup.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.popup.model.Popup;
import kr.or.ddit.smartware.popup.repository.IPopupDao;

@Service
public class PopupService implements IPopupService{

	@Resource(name = "popupDao")
	private IPopupDao popupDao;
	
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

}
