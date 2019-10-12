package kr.or.ddit.smartware.employee.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.IEmployeeService;

@Controller
public class EmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
		
	@RequestMapping(path = "employeeList", method = RequestMethod.GET)
	public String getEmployeeList(Employee employee, Integer page, Integer pagesize, HttpSession session, Model model) {
		
		employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		Map<String, Object> map = new HashMap<String, Object>();

		if (page == null)
			page = 1;
		if (pagesize == null)
			pagesize = 30;

		map.put("emp_id", employee.getEmp_id());
		map.put("page", page);
		map.put("pagesize", pagesize);

		List<Employee> employeeList = employeeService.getEmployeeList(map);
		logger.debug("employeeList : {}", employeeList);
		
		List<Employee> pageList = employeeService.allEmployeeList(employee.getEmp_id());

		int paginationSize = (int) Math.ceil((double) pageList.size() / pagesize);

		model.addAttribute("emp_id", employee.getEmp_id());
		model.addAttribute("emp_nm", employee.getEmp_nm());
		model.addAttribute("employee", map.get("employee"));
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("page", page);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("paginationSize", paginationSize);

		return "tiles.employeeList";
	}
	
	/**
	 * 
	* Method : deletePost
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param model
	* @param employee
	* @param emp_id
	* @return
	* Method 설명 : 사원 삭제
	 */
	@RequestMapping(path = "deleteEmployee")
	public String deletePost(Model model, Employee employee, String emp_id) {
		
		employeeService.deleteEmployee(emp_id);
		
		model.addAttribute("emp_id", emp_id);

		return "redirect:/employeeList";
	}
	
	
	@RequestMapping(path = "updateEmployee")
	public String updateEmployee(Map map, String btnValue, Model model, Employee employee, String emp_id, HttpServletRequest request) {
		
	employee.setEmp_id(employee.getEmp_id());
	
	if(employee.getAble().equals("활성화")) {
		employee.setAble("Y");
	}else {
		employee.setAble("N");
	}
	
	if(btnValue.equals("비활성화")) {
		
		int cnt = employeeService.updateEmployee(employee);
		
	}else if(btnValue.equals("활성화")) {
			
		int cnt = employeeService.updateEmployee(employee);
		
	}
	
	request.getServletContext().setAttribute("employeeList", employeeService.getEmployeeList(map)); 
	
	return "tiles.employeeList";
}
	
	@RequestMapping("useForm")
	public String getEmployeeList() {
		
		return "tiles.useForm";
	}
	
}
