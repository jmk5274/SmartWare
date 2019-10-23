package kr.or.ddit.smartware.popup.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	public String insertPopupView(Popup popup, String X, String Y, String startPicker, String endPicker, Model model, @RequestPart("file") MultipartFile file, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(file.getBytes() != null || file.getSize()!=0 || file.getBytes().length != 0) {
				byte[] pop_cont = file.getBytes();
				popup.setPop_cont(pop_cont);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String[] XArray = X.split(":");
		String[] YArray = Y.split(":");
		
		popup.setPop_left(Integer.parseInt(XArray[1].trim()));
		popup.setPop_top(Integer.parseInt(YArray[1].trim()));
		
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
	
	@GetMapping("popupImgView")
	public String popupImgView(String pop_id, Model model) {	
		
		model.addAttribute("pop_id", pop_id);
		
		return "popup/popupImgView";
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
	
	@GetMapping("modifyPopup")
	public String modifyPopupView() {
		return "popup/modifyPopup";
	}
	
	@PostMapping("getOnePopup")
	public String getOnePopup(String pop_id, Model model) {
		
		Popup popup = popupService.getPopup(pop_id);
		
		model.addAttribute("popup", popup);
		
		return "jsonView";
	}
	
	@PostMapping("getAllPopupList")
	public String getAllPopupList(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		List<Popup> popupList = popupService.getAllPopupList();
		List<Map> popupNolookList = popupService.getPopupNoLook(employee.getEmp_id());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		model.addAttribute("popupList", popupList);
		model.addAttribute("popupNolookList", popupNolookList);
		
		return "jsonView";
	}
	
	@PostMapping("modifyPopup")
	public String modifyPopup(Popup popup, String X, String Y, String startPicker, String endPicker, Model model, @RequestPart("file2") MultipartFile file, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(file.getSize()>0) {
				byte[] pop_cont = file.getBytes();
				popup.setPop_cont(pop_cont);
			}else {
				Popup popupVo = popupService.getPopup(popup.getPop_id());
				popup.setPop_cont(popupVo.getPop_cont());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String[] XArray = X.split(":");
		String[] YArray = Y.split(":");
		
		popup.setPop_left(Integer.parseInt(XArray[1].trim()));
		popup.setPop_top(Integer.parseInt(YArray[1].trim()));
		
		try {
			popup.setPop_st_dt(sdf.parse(startPicker));
			popup.setPop_end_dt(sdf.parse(endPicker));
			popup.setEmp_id(employee.getEmp_id());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int cnt = popupService.updatePopup(popup);
		
		model.addAttribute(cnt);
		
		return "jsonView";
	}
	
	@PostMapping("insertPopupNoLook")
	public String insertPopupNoLook(String pop_id, Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		String emp_id = employee.getEmp_id();
		
		Popup popup1 = popupService.getPopup(pop_id);
		Date pop_st_dt = popup1.getPop_st_dt();
		Date nl_dt = new Date(pop_st_dt.getTime () + (long)( 1000 * 60 * 60 * 24 ));
		
		logger.debug("nl_dt : {}", nl_dt);

		Map map = new HashMap<>();
		
		map.put("emp_id", emp_id);
		map.put("pop_id", pop_id);
		map.put("nl_dt", nl_dt);
		
		int c = popupService.insertPopupNoLook(map);
		
		return "jsonView";
	}
}
