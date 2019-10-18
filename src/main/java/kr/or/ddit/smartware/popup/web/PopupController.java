package kr.or.ddit.smartware.popup.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.smartware.popup.model.Popup;
import kr.or.ddit.smartware.popup.service.IPopupService;

@Controller
public class PopupController {
	
	@Resource(name = "popupService")
	private IPopupService popupService;
	
	/**
	* Method : popup
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 팝업 전체 리스트 조회
	*/
	@GetMapping("popup")
	public String popup(Model model) {
		
		List<Popup> allPopupList = popupService.getAllPopupList();
		
		model.addAttribute("allPopupList", allPopupList);
		
		return "tiles/popup/popup";
	}
	
	
	
}
