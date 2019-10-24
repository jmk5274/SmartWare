package kr.or.ddit.smartware.pms.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.pms.service.IProjectService;

@Controller
public class ProjectController {
	
	@Resource(name="projectService")
	private IProjectService projectService;
	
	@Resource(name="jsonView")
	private View jsonView;
	
	@RequestMapping("pms")
	public String pmsView() {
		
		return "tiles2/pms/main";
	}
	
	@PostMapping("getAllPastProject")
	public View getAllPastProject(Model model, String emp_id) {
		model.addAttribute(projectService.getAllPastProject(emp_id));
		
		return jsonView;
	}
	
	@PostMapping("getAllRunningProject")
	public View getAllRunningProject(Model model, String emp_id) {
		model.addAttribute(projectService.getAllRunningProject(emp_id));
		
		return jsonView;
	}
}
