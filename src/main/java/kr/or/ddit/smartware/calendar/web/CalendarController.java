package kr.or.ddit.smartware.calendar.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("calendar")
	public String calendar(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String depart_id = employee.getDepart_id();
		String posi_id = employee.getPosi_id();
		
		model.addAttribute("depart_nm", departmentService.getDepartNm(depart_id));
		model.addAttribute("posi_nm", positionService.getPosiNm(posi_id));
		
		return "tiles/calendar/calendar";
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
			
			map.put("allDay", calendar.getAllday().equals("T") ? true : false); // 일정 allDay 여부
			
			calendarList.add(map);
		}
		
		model.addAttribute("calendarList", calendarList);
		
		return jsonView;
	}
	
	
	
}
