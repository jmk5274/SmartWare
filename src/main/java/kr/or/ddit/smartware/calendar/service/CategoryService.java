package kr.or.ddit.smartware.calendar.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.calendar.model.Category;
import kr.or.ddit.smartware.calendar.repository.ICalendarDao;
import kr.or.ddit.smartware.calendar.repository.ICategoryDao;

@Service
public class CategoryService implements ICategoryService {

	@Resource(name = "categoryDao")
	private ICategoryDao categoryDao;
	
	@Resource(name = "calendarDao")
	private ICalendarDao calendarDao;
	
	/**
	* Method : getEmpCategoryList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 개인 일정을 가져온다.
	*/
	@Override
	public List<Category> getEmpCategoryList(String emp_id) {
		return categoryDao.getEmpCategoryList(emp_id);
	}

	/**
	* Method : getDepCategoryList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 부서 일정을 가져온다.
	*/
	@Override
	public List<Category> getDepCategoryList(String emp_id) {
		return categoryDao.getDepCategoryList(emp_id);
	}
	
	/**
	* Method : getCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @return
	* Method 설명 : 카테고리를 가져온다.
	*/
	@Override
	public Category getCategory(String category_id) {
		return categoryDao.getCategory(category_id);
	}

	/**
	* Method : insertCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category
	* @return category_id
	* Method 설명 : 카테고리 생성
	*/
	@Override
	public String insertCategory(Category category) {
		categoryDao.insertCategory(category);
		return category.getCategory_id();
	}

	/**
	 * Method : updateCategory
	 * 작성자 : JO MIN SOO
	 * 변경이력 :
	 * @param category
	 * @return
	 * Method 설명 : 카테고리 수정
	 */
	@Override
	public int updateCategory(Category category) {
		return categoryDao.updateCategory(category);
	}
	
	/**
	* Method : deleteCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @return
	* Method 설명 : 카테고리 삭제(일정 삭제 후 카테고리 삭제)
	*/
	@Override
	public int deleteCategory(String category_id) {
		calendarDao.deleteCateCalendar(category_id);
		return categoryDao.deleteCategory(category_id);
	}
	
}
