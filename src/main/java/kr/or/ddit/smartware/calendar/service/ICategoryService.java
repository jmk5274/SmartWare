package kr.or.ddit.smartware.calendar.service;

import java.util.List;

import kr.or.ddit.smartware.calendar.model.Category;

public interface ICategoryService {

	/**
	* Method : getEmpCategoryList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 개인 일정을 가져온다.
	*/
	List<Category> getEmpCategoryList(String emp_id);

	/**
	* Method : getDepCategoryList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 부서 일정을 가져온다.
	*/
	List<Category> getDepCategoryList(String emp_id);

	/**
	* Method : getProCategoryList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 프로젝트 일정을 가져온다.
	*/
	List<Category> getProCategoryList(String emp_id);
	
	/**
	* Method : getCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @return
	* Method 설명 : 카테고리를 가져온다.
	*/
	Category getCategory(String category_id);

	/**
	* Method : insertCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category
	* @return category_id
	* Method 설명 : 카테고리 생성 
	*/
	String insertCategory(Category category);

	/**
	* Method : updateCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category
	* @return
	* Method 설명 : 카테고리 수정 
	*/
	int updateCategory(Category category);
	
	/**
	* Method : deleteCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @return
	* Method 설명 : 카테고리 삭제(일정 삭제 후 카테고리 삭제)
	*/
	int deleteCategory(String category_id);

}
