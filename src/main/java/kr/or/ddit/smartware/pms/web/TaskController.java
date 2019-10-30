package kr.or.ddit.smartware.pms.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.pms.service.IProjectService;
import kr.or.ddit.smartware.pms.service.ITaskService;

@Controller
public class TaskController {

	@Resource(name="taskService")
	private ITaskService taskService;
	
	@Resource(name="projectService")
	private IProjectService projectService;
	
	@Resource(name="jsonView")
	private View jsonView;
	
	/**
	* Method : proView
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 프로젝트 화면
	*/
	@PostMapping("pro")
	public String proView(Model model, String pro_id, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		model.addAttribute("pro_id", pro_id);
		model.addAttribute("employeeList", projectService.getProjectEmployee(pro_id));
		
		return "tiles2/pms/project";
	}
	
	@RequestMapping("getAllGantt")
	public View getAllGantt(Model model, String pro_id) {
		model.addAttribute("taskList", taskService.getAllGantt(pro_id));
		
		return jsonView;
	}
	
}
