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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.smartware.employee.model.Department;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.model.Position;
import kr.or.ddit.smartware.employee.service.IDepartmentService;
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import kr.or.ddit.smartware.employee.service.IPositionService;

@Controller
public class EmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	@Resource(name = "positionService")
	private IPositionService positionService;
	
	@Resource(name = "departmentService")
	private IDepartmentService departmentService;
		
	@RequestMapping(path = "employeeList", method = RequestMethod.GET)
	public String getEmployeeList(Employee employee, @RequestParam(name = "page", defaultValue = "1") Integer page,
													 @RequestParam(name = "pagesize", defaultValue = "30") Integer pagesize, HttpSession session, Model model) {
		
		employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("emp_id", employee.getEmp_id());
		map.put("page", page);
		map.put("pagesize", pagesize);

		List<Employee> employeeList = employeeService.getEmployeeList(map);
//		logger.debug("employeeList : {}", employeeList);
		logger.debug("employeeListSize : {}", employeeList.size());
		
		List<Employee> pageList = employeeService.allEmployeeList();
		int paginationSize = (int) Math.ceil((double) pageList.size() / pagesize);
		logger.debug("paginationSize {}", paginationSize);
		
		// 직책 전체 리스트
		List<Position> positionList = positionService.getAllPosition();
		
		// 부서 전체 리스트
		List<Department> departmentList = departmentService.getAllDepartment();
		
		model.addAttribute("positionList", positionList);
		model.addAttribute("emp_id", employee.getEmp_id());
		model.addAttribute("emp_nm", employee.getEmp_nm());
		model.addAttribute("employee", map.get("employee"));
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("page", page);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("departmentList", departmentList);

		return "tiles/employee/employeeList";
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
	@PostMapping("deleteEmployee")
	public String deletePost(Model model, Employee employee, String emp_id) {
		
		int c = employeeService.deleteEmployee(emp_id);
		
		model.addAttribute("emp_id", emp_id);

		return "redirect:/employeeList?emp_id=" + employee.getEmp_id();
		
	}
	
	/**
	 * 
	* Method : updateEmployeeView
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param model
	* @param emp_id
	* @return
	* Method 설명 : 사원 수정
	 */
	@RequestMapping(path = "updateEmployee", method = RequestMethod.GET )
	public String updateEmployeeView(Model model, int emp_id) {
		model.addAttribute("employeeList", employeeService.allEmployeeList());
		
		return "tiles/employee/employeeList";
	}
	
	@RequestMapping(path = "updateEmployee", method = RequestMethod.POST)
	public String updateEmployee(String emp_id, String able, String posi_id, Employee employee, String updateBtn, String updateBtn2, String updateBtn3, Model model, HttpServletRequest request, Position position, Department department, String depart_id) {
		
		employee = new Employee();
		employee.setEmp_id(emp_id);
		
		// 활성화 / 비활성화 수정
		if(updateBtn.equals("modify")) {
		
			if(able.equals("활성화")) {
				employee.setAble("T");
			}else {
				employee.setAble("F");
			}
		
			int cnt = employeeService.updateEmployeeAble(employee);
			
		// 직책 변경
		} else if(updateBtn2.equals("modifyPosition")) {
		
			if(posi_id.equals(posi_id)) {
				employee.setPosi_id(posi_id);
			}
			
			int cnt = employeeService.updateEmployeePosition(employee);
			
		// 부서 변경
		} else if(updateBtn3.equals("modifyDepartment")) {
			
			if(depart_id.equals(depart_id)) {
				employee.setDepart_id(depart_id);
			}
			
			int cnt = employeeService.updateEmployeeDepartment(employee);
		}
		
		request.getServletContext().setAttribute("A_EMPLOYEELIST", employeeService.allEmployeeList()); 
		
		return "redirect:/employeeList";
	}
	
	/**
	 * 
	* Method : userFormView
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @return
	* Method 설명 : 사원 등록 화면 요청
	 */
	@RequestMapping(path = "insertEmployee", method = RequestMethod.GET)
	public String userFormView() {
		return "tiles/employee/insertEmployee";
	}
	
	// 사용자 등록 요청
	@RequestMapping(path = "insertEmployee", method = RequestMethod.POST)
	public String insertEmployee(Employee employee, BindingResult result, String insertBtn, String able2, String posi_id2, String depart_id2) {
		
		
		int insertCnt = employeeService.insertEmployee(employee);
		
		if(insertCnt == 1)
			return "redirect:/employeeList?emp_id=" + employee.getEmp_id();
		else
			return "tiles/employee/employeeList";
				
	}
	
	/**
	 * 
	* Method : mypageView
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @return
	* Method 설명 : 마이페이지 화면 요청
	 */
	@RequestMapping(path = "mypage", method = RequestMethod.GET)
	public String mypageView() {
		return "tiles/employee/mypage";
	}
	
	/**
	 * 
	* Method : mypageList
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @return
	* Method 설명 : 마이페이지 리스트 출력
	 */
	@RequestMapping(path = "mypage", method = RequestMethod.POST)
	public String mypageList() {
		
		return "tiles/employee/mypage";
	}
	
	@RequestMapping("useForm")
	public String getEmployeeList() {
		
		return "tiles/form/useForm";
	}
	
}
