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
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import kr.or.ddit.smartware.util.file.FileUtil;
import kr.or.ddit.smartware.util.file.model.FileInfo;

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
		
		List<Employee> pageList = employeeService.getEmployeeList(map);

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
		
		return "tiles.employeeList";
	}
	
	@RequestMapping(path = "updateEmployee", method = RequestMethod.POST)
	public String updateEmployee(String emp_id, String able, String rank, Employee employee, String updateBtn, String updateBtn2, Model model, HttpServletRequest request) {
		
		employee = new Employee();
		employee.setEmp_id(emp_id);
		
		if(updateBtn.equals("modify")) {
		
			if(able.equals("활성화")) {
				employee.setAble("T");
			}else {
				employee.setAble("F");
			}
		
			int cnt = employeeService.updateEmployeeAble(employee);
			
		} else if(updateBtn2.equals("modifyRank")) {
		
			if(rank.equals("사장")) {
				employee.setRank("사장");
			}else if(rank.equals("관리자")){
				employee.setRank("관리자");
			}else {
				employee.setRank("사원");
			}
			
			int cnt = employeeService.updateEmployeeRank(employee);
			
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
		return "tiles.insertEmployee";
	}
	
	// 사용자 등록 요청
//	@RequestMapping(path = "insertEmployee", method = RequestMethod.POST)
//	public String insertEmployee(Employee employee, BindingResult result,
//							@RequestPart("picture") MultipartFile picture) {
////		new EmployeeValidator().validate(user, result);
//		if(result.hasErrors()) // 잘못 되면 사용자 등록 화면으로 이동
//			return "tiles.insertEmployee";
//		else {
//			FileInfo fileInfo = FileUtil.getFileInfo(picture.getOriginalFilename());
//			
//		// 첨부된 파일이 있을 경우만 업로드 처리
//		if(picture.getSize() > 0) {
//			try {
//				picture.transferTo(fileInfo.getFile());
//				employee.setFilename(fileInfo.getOriginalFileName());		// originalFilename
//				employee.setRealfilename(fileInfo.getFile().getPath());
//				
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		int insertCnt = employeeService.insertEmployee(employee);
//				
//		if(insertCnt == 1)
//			return "redirect:/employee/insertEmployee?emp_id=" + employee.getEmp_id();
//		else
//			return "tiles.insertEmployee";
//				
//		}
//	}
	
	@RequestMapping("useForm")
	public String getEmployeeList() {
		
		return "tiles.useForm";
	}
	
}
