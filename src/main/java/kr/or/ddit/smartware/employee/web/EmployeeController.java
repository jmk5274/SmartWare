package kr.or.ddit.smartware.employee.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.IEmployeeService;

@Controller
public class EmployeeController {

	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
		
	@RequestMapping("employeeList")
	public String getEmployeeList(Model model) {
		
		List<Employee> employeeList = employeeService.getEmployeeList();
		
		model.addAttribute("employeeList", employeeList);
		
		return "tiles.employeeList";
	}
	
	@RequestMapping("useForm")
	public String getEmployeeList() {
		
		return "tiles.useForm";
	}
	
}
