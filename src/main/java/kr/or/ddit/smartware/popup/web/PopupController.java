package kr.or.ddit.smartware.popup.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
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

import kr.or.ddit.smartware.employee.model.Employee;
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
	public String insertPopupView(Popup popup, String startPicker, String endPicker, Model model, @RequestPart("file") MultipartFile file, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		logger.debug("popup : {}", popup);
			try {
				if(file.getBytes() != null || file.getSize()!=0 || file.getBytes().length != 0) {
					byte[] pop_cont = file.getBytes();
					popup.setPop_cont(pop_cont);
				}else {
					byte[] pop_cont = {};
					popup.setPop_cont(pop_cont);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		try {
			popup.setPop_st_dt(sdf.parse(startPicker));
			popup.setPop_end_dt(sdf.parse(endPicker));
			popup.setEmp_id(employee.getEmp_id());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int cnt = popupService.insertPopup(popup);
		
		model.addAttribute("cnt", cnt);
		
		return "jsonView";
	}
	
	@PostMapping("deletePopup")
	public String deletePopup(String pop_id, Model model) {
		
		int cnt = popupService.deletePopup(pop_id);
		
		return "jsonView";
	}
	
	@GetMapping("popupView")
	public String popupView(String pop_id, Model model) {	
		
		model.addAttribute("pop_id", pop_id);
		
	return "popup/popupView";
	}
	
	@GetMapping("getPopup")
	public void getPopup(String pop_id, HttpServletResponse response) throws IOException {
		Popup popup = popupService.getPopup(pop_id);
		
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] pop_cont = popup.getPop_cont();
		
		sos.write(pop_cont);
		
		sos.close();
	}
	
	@PostMapping("getPopupView")
	public String getPopupView(@RequestPart("file") MultipartFile file, Model model, HttpServletResponse response) throws IOException {
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] pop_cont = file.getBytes();
		
		sos.write(pop_cont);
		
		sos.close();
		
		model.addAttribute("img", pop_cont);
		
		return "jsonView";
	}
	
	@GetMapping("tempPopup")
	public String tempPopup() {
		return "popup/tempPopup";
	}
	
	@PostMapping("getOnePopup")
	public String getOnePopup(String pop_id, Model model) {
		
		Popup popup = popupService.getPopup(pop_id);
		
		model.addAttribute("popup", popup);
		
		return "jsonView";
	}
}
