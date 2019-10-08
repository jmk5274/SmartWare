package kr.or.ddit.smartware.calendar.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.calendar.model.Calendar;
import kr.or.ddit.smartware.calendar.service.ICalendarService;
import kr.or.ddit.smartware.employee.model.Employee;

@Controller
public class CalendarController {
private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	@Resource(name="calendarService")
	private ICalendarService calendarService;
	
	@Resource(name="jsonView")
	private View jsonView;
	
	@RequestMapping("calendar")
	public String calendar() {
		return "tiles.calendar";
	}
	
	/**
	* Method : getAllCalendarList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param session
	* @return
	* Method 설명 : 현재 로그인한 사원의 부서 일정을 JSON형태로 반환한다.
	*/
	@RequestMapping("getAllCalendarList")
	public View getAllCalendarList(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String emp_id = employee.getEmp_id();
		
		List<Map<String, Object>> calendarList = new ArrayList<Map<String, Object>>();
		
		for(Calendar calendar : calendarService.getAllCalendarList(emp_id)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", calendar.getCal_id());
			map.put("title", calendar.getCal_title());
			map.put("description", calendar.getCal_cont());
			
			map.put("start", calendar.getSt_dt());
			map.put("end", calendar.getEnd_dt());
			
			map.put("backgroundColor", "#" + calendarService.getCategoryColor(calendar.getCategory_id()));
			map.put("textColor", "white");
			map.put("borderColor", "white");
			
			map.put("allDay", calendar.getAllday().equals("T") ? true : false);
			
			calendarList.add(map);
		}
		model.addAttribute(calendarList);
		
		return jsonView;
	}
}
