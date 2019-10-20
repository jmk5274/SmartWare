package kr.or.ddit.smartware.calendar.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.calendar.model.Calendar;
import kr.or.ddit.smartware.calendar.model.Category;
import kr.or.ddit.smartware.calendar.service.ICalendarService;
import kr.or.ddit.smartware.calendar.service.ICategoryService;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.IDepartmentService;
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import kr.or.ddit.smartware.employee.service.IPositionService;

@Controller
public class CalendarController {
	
	@Resource(name="calendarService")
	private ICalendarService calendarService;
	
	@Resource(name="categoryService")
	private ICategoryService categoryService;
	
	@Resource(name="employeeService")
	private IEmployeeService employeeService;

	@Resource(name="departmentService")
	private IDepartmentService departmentService;

	@Resource(name="positionService")
	private IPositionService positionService;
	
	@Resource(name="jsonView")
	private View jsonView;
	
	/**
	* Method : calendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param session
	* @return
	* Method 설명 : 캘린더 페이지 요청
	*/
	@RequestMapping("calendar")
	public String calendar(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String depart_id = employee.getDepart_id();
		String posi_id = employee.getPosi_id();
		
		model.addAttribute("depart_nm", departmentService.getDepartNm(depart_id));
		model.addAttribute("posi_nm", positionService.getPosiNm(posi_id));
		
		return "tiles2/calendar/calendar";
	}
	
	/**
	* Method : getAllCalendarList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param session
	* @return
	* Method 설명 : 현재 로그인한 사원의 모든 일정을 JSON형태로 반환한다.
	*/
	@RequestMapping("getAllCalendarList")
	public View getAllCalendarList(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String emp_id = employee.getEmp_id();
		
		List<Map<String, Object>> calendarList = new ArrayList<Map<String, Object>>();
		
		for(Calendar calendar : calendarService.getAllCalendarList(emp_id)) {
			calendarList.add(calendarJson(calendar));
		}
		
		model.addAttribute("calendarList", calendarList);
		
		return jsonView;
	}
	
	/**
	* Method : insertCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param calendar
	* @param start
	* @param end
	* @return
	* Method 설명 : 일정 추가
	*/
	@PostMapping("insertCalendar")
	public View insertCalendar(Model model, Calendar calendar, long start, long end) {
		// allDay 체크유무에 따라 T, F로 변경
		if(calendar.getAllDay() == null) calendar.setAllDay("F"); 
		else calendar.setAllDay("T");

		// 시간 설정(long타입 숫자로 생성된 시간 -> date로)
		calendar.setSt_dt(new Date(start));
		calendar.setEnd_dt(new Date(end));
		
		calendarService.insertCalendar(calendar);
		
		return jsonView;
	}
	
	/**
	* Method : insertCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param cal_id
	* @return
	* Method 설명 : 일정 수정 
	*/
	@PostMapping("updateCalendar")
	public View updateCalendar(Model model, Calendar calendar, long start, long end) {
		// allDay 체크유무에 따라 T, F로 변경
		if(calendar.getAllDay() == null) calendar.setAllDay("F"); 
		else calendar.setAllDay("T");

		// 시간 설정(long타입 숫자로 생성된 시간 -> date로)
		calendar.setSt_dt(new Date(start));
		calendar.setEnd_dt(new Date(end));
		logger.debug("calendar: {}", calendar);
		
		calendarService.updateCalendar(calendar);
		
		
		return jsonView;
	}
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	/**
	* Method : insertCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param cal_id
	* @return
	* Method 설명 : 일정 삭제
	*/
	@PostMapping("deleteCalendar")
	public View deleteCalendar(Model model, String cal_id) {
		calendarService.deleteCalendar(cal_id);
		
		return jsonView;
	}
	
	/**
	* Method : calendarJson
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param calendar
	* @return
	* Method 설명 : CalendarVO를 json형태로 변환
	*/
	private Map<String, Object> calendarJson(Calendar calendar) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("id", calendar.getCal_id());			// 일정 id(고유키)
		map.put("title", calendar.getCal_title());		// 일정 제목
		map.put("description", calendar.getCal_cont());	// 일정 설명
		
		map.put("start", calendar.getSt_dt());			// 일정 시작 시간
		map.put("end", calendar.getEnd_dt());			// 일정 종료 시간
		
		String emp_nm = employeeService.getEmployee(calendar.getEmp_id()).getEmp_nm();
		map.put("emp_nm", emp_nm);						// 일정 등록자 이름
		
		Category category = categoryService.getCategory(calendar.getCategory_id());
		map.put("backgroundColor", category.getColor()); // 일정 카테고리 배경색
		map.put("category_nm", category.getCategory_nm()); // 카테고리 이름
		map.put("category_id", category.getCategory_id()); // 카테고리 아이디
		
		map.put("textColor", "white");		// 기본값 셋팅					
		map.put("borderColor", "white");	// 기본값 셋팅
		
		map.put("allDay", calendar.getAllDay().equals("T") ? true : false); // 일정 allDay 여부
		
		return map;
	}
}
