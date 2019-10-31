package kr.or.ddit.smartware.pms.web;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.pms.model.Task;
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
	
	/**
	* Method : getAllGantt
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 전체 TASK를 반환 
	*/
	@RequestMapping("getAllGantt")
	public View getAllGantt(Model model, String pro_id) {
		model.addAttribute("taskList", taskService.getAllGantt(pro_id));
		
		return jsonView;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(TaskController.class);
	@PostMapping("insertTask")
	public View insertTask(Model model, @RequestParam Map<String, Object> map) {
		logger.debug("map: {}", map);
		Task task = new Task();
		task.setPro_id(map.get("pro_id") + "");
		task.setTask_cont(map.get("text") + "");
		task.setPa_task_id(map.get("parent") + "");
		task.setPer(Integer.parseInt(map.get("progress") + "") * 100);
		task.setSt_dt(new Date(Long.parseLong(map.get("start_date") + "")));
		task.setEnd_dt(new Date(Long.parseLong(map.get("end_date") + "")));
		logger.debug("task: {}", task);
		taskService.insertTask(task);
		
		return jsonView;
	}
	
}
