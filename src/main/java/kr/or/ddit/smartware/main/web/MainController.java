package kr.or.ddit.smartware.main.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import kr.or.ddit.smartware.approval.service.IApprovalService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.calendar.service.ICalendarService;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.pms.service.ITaskService;

@Controller
public class MainController {
	
	@Resource(name = "taskService")
	private ITaskService taskService;
	
	@Resource(name = "calendarService")
	private ICalendarService calendarService;
	
	@Resource(name="jsonView")
	private View jsonView;
	
	/**
	* Method : getMainTask
	* 작성자 : Jeon Min Gyu
	* 변경이력 :
	* @param model
	* @param 
	* @return
	* Method 설명 : 일감 삭제, 일감담당자 삭제, 일감히스토리 삭제  
	*/
	@PostMapping("getMainTask")
	public View getMainTask(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");

		model.addAttribute("todayDelayList", taskService.getAllDelayTask(employee.getEmp_id()));
		model.addAttribute("todayList", taskService.getAllTodayTask(employee.getEmp_id()));
		model.addAttribute("weekDelayList", taskService.getAllWeekDlayTask(employee.getEmp_id()));
		model.addAttribute("weekList", taskService.getAllWeekTask(employee.getEmp_id()));
		model.addAttribute("weekCalList", calendarService.getWeekCalendar(employee.getEmp_id()));

		return jsonView;
	}
	
}
