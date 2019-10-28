package kr.or.ddit.smartware.pms.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.pms.service.ITaskService;

@Controller
public class TaskController {

	@Resource(name="taskService")
	private ITaskService taskService;
	
	@Resource(name="jsonView")
	private View jsonView;
	
	@RequestMapping("getAllGantt")
	public View getAllGantt(Model model, String pro_id) {
		model.addAttribute("taskList", taskService.getAllGantt(pro_id));
		
		return jsonView;
	}
	
	@RequestMapping("getEmpGantt")
	public View getEmpGantt(Model model, String pro_id, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		model.addAttribute("taskList", taskService.getEmpGantt(pro_id, employee.getEmp_id()));
		
		return jsonView;
	}
	
}
