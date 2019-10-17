package kr.or.ddit.smartware.calendar.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.smartware.calendar.model.Category;
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
	
	/**
	* Method : insertCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category
	* @param model
	* @return
	* Method 설명 : 카테고리 생성
	*/
	@PostMapping("insertCategory")
	public View insertCategory(Category category, Model model) {
		String category_id = categoryService.insertCategory(category);
		
		model.addAttribute("category_id", category_id);
		
		return jsonView;
	}
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	/**
	* Method : updateCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @param category_nm
	* @param color
	* @param model
	* @return
	* Method 설명 : 카테고리 수정
	*/
	@PostMapping("updateCategory")
	public View updateCategory(Category category, Model model) {
		model.addAttribute("updateCnt", categoryService.updateCategory(category));
		return jsonView;
	}
	
	/**
	* Method : deleteCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @param model
	* @return
	* Method 설명 : 카테고리 삭제(일정 삭제 후 카테고리 삭제)
	*/
	@PostMapping("deleteCategory")
	public View deleteCategory(String category_id, Model model) {
		model.addAttribute("deleteCnt", categoryService.deleteCategory(category_id));
		
		return jsonView;
	}
}
