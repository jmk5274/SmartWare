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
import kr.or.ddit.smartware.pms.model.ProTask;
import kr.or.ddit.smartware.pms.model.Task;
import kr.or.ddit.smartware.pms.repository.TaskDao;
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
	* Method : getAllTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 전체 TASK를 반환 
	*/
	@PostMapping("getAllTask")
	public View getAllTask(Model model, String pro_id) {
		model.addAttribute("taskList", taskService.getAllTask(pro_id));
		
		return jsonView;
	}
	
	/**
	* Method : getAllGantt
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param pro_id
	* @return
	* Method 설명 : TASK 반환
	*/
	@PostMapping("getTask")
	public View getTask(Model model, String task_id) {
		model.addAttribute("task", taskService.getTask(task_id).get(0));
		
		return jsonView;
	}
	
	/**
	* Method : insertTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param map
	* @return
	* Method 설명 : 일감 추가, 담당자 추가
	*/
	@PostMapping("insertTask")
	public View insertTask(Model model, @RequestParam Map<String, Object> map) {
		// 일감 추가
		Task task = new Task();
		if(map.get("pa_task_id").equals("0")) 
			task.setPa_task_id(null);
		else 
			task.setPa_task_id(map.get("pa_task_id") + "");
		task.setPro_id(map.get("pro_id") + "");
		task.setTask_cont(map.get("task_cont") + "");
		task.setPer(Integer.parseInt(map.get("per") + ""));
		task.setSt_dt(new Date(Long.parseLong(map.get("start") + "")));
		task.setEnd_dt(new Date(Long.parseLong(map.get("end") + "")));
		
		String task_id = taskService.insertTask(task, map.get("emp_id") + "");

		model.addAttribute("task_id", task_id);
		
		return jsonView;
	}
	
	/**
	* Method : updateTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param map
	* @return
	* Method 설명 : 일정 수정, 일정 담당자 수정
	*/
	@PostMapping("updateTask")
	public View updateTask(Model model, @RequestParam Map<String, Object> map) {
		// 일감 수정
		Task task = new Task();
		if(map.get("pa_task_id").equals("0")) 
			task.setPa_task_id(null);
		else 
			task.setPa_task_id(map.get("pa_task_id") + "");
		task.setTask_id(map.get("task_id") + "");
		task.setPro_id(map.get("pro_id") + "");
		task.setTask_cont(map.get("task_cont") + "");
		task.setPer(Integer.parseInt(map.get("per") + ""));
		task.setSt_dt(new Date(Long.parseLong(map.get("start") + "")));
		task.setEnd_dt(new Date(Long.parseLong(map.get("end") + "")));
		
		taskService.updateTask(task, map.get("emp_id") + "");

		model.addAttribute("task_id", task.getTask_id());
		
		return jsonView;
	}
	
	/**
	* Method : deleteTask
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param task_id
	* @return
	* Method 설명 : 일감 삭제, 일감담당자 삭제, 일감히스토리 삭제  
	*/
	@PostMapping("deleteTask")
	public View deleteTask(Model model, String task_id) {
		model.addAttribute("deleteCnt", taskService.deleteTask(task_id));
		
		return jsonView;
	}
	
}
