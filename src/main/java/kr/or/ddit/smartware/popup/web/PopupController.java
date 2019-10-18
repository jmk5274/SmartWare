package kr.or.ddit.smartware.popup.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.smartware.popup.model.Popup;
import kr.or.ddit.smartware.popup.service.IPopupService;

@Controller
public class PopupController {
	
	private static final Logger logger = LoggerFactory.getLogger(PopupController.class);
	
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
	public String popup(@RequestParam(name = "page", defaultValue = "1") Integer page, @RequestParam(name = "pagesize", defaultValue = "10") Integer pagesize, Model model) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("pagesize", pagesize);
		
		List<Popup> popupPageList = popupService.getPagePopupList(map);
		List<Popup> allPopupList = popupService.getAllPopupList();
		
		int paginationSize = (int) Math.ceil((double) allPopupList.size() / pagesize);
		
		model.addAttribute("popupPageList", popupPageList);
		model.addAttribute("page", page);
		model.addAttribute("paginationSize", paginationSize);
		
		return "tiles/popup/popup";
	}
	
	/**
	* Method : popup
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param page
	* @param pagesize
	* @param model
	* @return
	* Method 설명 : pagination List 조회
	*/
	@GetMapping("popupPagiList")
	public String popupPagiList(@RequestParam(name = "page", defaultValue = "1") Integer page, @RequestParam(name = "pagesize", defaultValue = "10") Integer pagesize, Model model) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("pagesize", pagesize);
		
		List<Popup> popupPageList = popupService.getPagePopupList(map);
		List<Popup> allPopupList = popupService.getAllPopupList();
		
		int paginationSize = (int) Math.ceil((double) allPopupList.size() / pagesize);
		
		model.addAttribute("popupPageList", popupPageList);
		model.addAttribute("page", page);
		model.addAttribute("paginationSize", paginationSize);
		
		return "jsonView";
	}
	
	/**
	* Method : popup
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param page
	* @param pagesize
	* @param model
	* @return
	* Method 설명 : pagination List 조회
	*/
	@PostMapping("insertPopupView")
	public String insertPopupView(Popup popup, @RequestPart("file") MultipartFile file, HttpSession session) {
		
		logger.debug("{}", popup);
		
		return "jsonView";
	}
	
}
