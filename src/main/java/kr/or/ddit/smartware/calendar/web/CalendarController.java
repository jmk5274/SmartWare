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

import kr.or.ddit.smartware.calendar.model.DepCalendar;
import kr.or.ddit.smartware.calendar.model.EmpCalendar;
import kr.or.ddit.smartware.calendar.service.ICalendarService;
import kr.or.ddit.smartware.employee.model.Employee;

@Controller
public class CalendarController {

	@Resource(name="calendarService")
	private ICalendarService calendarService;
	
	@Resource(name="jsonView")
	private View jsonView;
	
	@RequestMapping("calendar")
	public String calendar() {
		return "tiles.calendar";
	}
	
	@RequestMapping("getEmpCalendarList")
	public View getEmpCalendarList(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String emp_id = employee.getEmp_id();
		
		List<EmpCalendar> empCalendarList = calendarService.getEmpCalendarList(emp_id);
		
		model.addAttribute("empCalendarList", empCalendarList);

		return jsonView;
	}
	
	@RequestMapping("getDepCalendarList")
	public View getDepCalendarList(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String emp_id = employee.getEmp_id();
		
//		List<DepCalendar> depCalendarList = calendarService.getDepCalendarList(emp_id);
		
		List<Map<String, Object>> depCalendarList = new ArrayList<Map<String, Object>>();
		
		for(DepCalendar depCalendar : calendarService.getDepCalendarList(emp_id)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", depCalendar.getCal_id());
			map.put("title", depCalendar.getCal_title());
			map.put("description", depCalendar.getCal_cont());
			
			map.put("start", depCalendar.getSt_dt());
			map.put("end", depCalendar.getEnd_dt());
			
			map.put("backgroundColor", "yellow");
			map.put("textColor", "black");
			
			depCalendarList.add(map);
		}
		model.addAttribute(depCalendarList);
		
		return jsonView;
	}
}
