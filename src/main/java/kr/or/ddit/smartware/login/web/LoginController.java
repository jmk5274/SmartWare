package kr.or.ddit.smartware.login.web;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.IEmployeeService;

@Controller
public class LoginController {
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	/**
	 * 
	* Method : view
	* 작성자 : PC-04
	* 변경이력 :
	* @return
	* Method 설명 : 로그인 화면 요청 처리(forward)
	 */
	// get방식으로 왔을 때만 view라는 메서드로 처리
	@RequestMapping(path = "login", method = RequestMethod.GET)
	public String view() {
		// cookie 처리는 생략
		return "login/login";
	}
	
	
	/**
	 * 
	* Method : loginProcess
	* 작성자 : PC-04
	* 변경이력 :
	* @param emp_id
	* @param pass
	* @param rememberMe
	* @param response
	* @param session
	* @return
	* Method 설명 : 로그인 요청 처리 (post일 때만 이 메서드를 실행하도록 설정)
	 */
	@RequestMapping(path = "login", method = RequestMethod.POST)
	public String loginProcess(String emp_id, String pass, String rememberMe,
								HttpServletResponse response, HttpSession session) {
		
		manageEmp_IdCookie(response, emp_id, rememberMe);
		
		Employee employee = employeeService.getEmployee(emp_id);
		
		if(employee == null) {
			return "login/login";	// view();
			
		}else if(employee.checkLoginValidate(emp_id, pass)) {
				session.setAttribute("S_USERVO", employee);
				return "redirect:/index";
		}
		else {
			return "login/login";
		}
	}
		
	private void manageEmp_IdCookie(HttpServletResponse response, String emp_id, String rememberMe) {
		//remeberMe 파라미터가 존재할 경우 emp_id를 emp_id로 생성
		Cookie cookie = new Cookie("emp_id", emp_id);
		
		if(rememberMe != null) {
			cookie.setMaxAge(60*60*24*30);	//30일
		}
		else {	
			cookie.setMaxAge(0);	//삭제
		}
		
		response.addCookie(cookie);
	}
	
	/**
	 * 
	* Method : logout
	* 작성자 : PC-04
	* 변경이력 :
	* @param response
	* @param session
	* Method 설명 : 로그아웃
	 */
	@RequestMapping(path = "logout", method = RequestMethod.GET)
	private String logout(HttpServletResponse response, HttpSession session) {
		
		session.invalidate();	// 세션에 저장된 모든 속성을 제거
		
		// 로그인 화면으로 이동
		return "redirect:/index";
	}
	
	/**
	 * 
	* Method : Index
	* 작성자 : PC-04
	* 변경이력 :
	* @return
	* Method 설명 : 메인창
	 */
	@RequestMapping(path = "index")
	private String Index() {
		return "index";
	}
	
}
