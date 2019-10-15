package kr.or.ddit.smartware.calendar.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.calendar.service.ICategoryService;
import kr.or.ddit.smartware.employee.model.Employee;

@Controller
public class CategoryController {

	@Resource(name="categoryService")
	private ICategoryService categoryService;
	
	@Resource(name="jsonView")
	private View jsonView;
	
	/**
	* Method : getEmpCalendarList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param session
	* @return
	* Method 설명 : 현재 로그인한 사원의 개인 일정 카테고리를 JSON형태로 반환한다.
	*/
	@RequestMapping("getEmpCategoryList")
	public View getEmpCalendarList(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String emp_id = employee.getEmp_id();
		
		model.addAttribute(categoryService.getEmpCategoryList(emp_id));
		
		return jsonView;
	}
	
	/**
	* Method : getDepCalendarList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param session
	* @return
	* Method 설명 : 현재 로그인한 사원의 부서 일정 카테고리를 JSON형태로 반환한다.
	*/
	@RequestMapping("getDepCategoryList")
	public View getDepCalendarList(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String emp_id = employee.getEmp_id();
		
		model.addAttribute(categoryService.getDepCategoryList(emp_id));
		
		return jsonView;
	}
}
