package kr.or.ddit.smartware.calendar.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.calendar.model.Category;
import kr.or.ddit.smartware.calendar.repository.ICategoryDao;

@Service
public class CategoryService implements ICategoryService {

	@Resource(name = "categoryDao")
	private ICategoryDao categoryDao;
	
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
	
}
