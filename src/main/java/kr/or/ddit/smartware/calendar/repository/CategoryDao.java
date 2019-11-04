package kr.or.ddit.smartware.calendar.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.calendar.model.Category;

@Repository
public class CategoryDao implements ICategoryDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
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
		return sqlSession.selectList("category.getEmpCategoryList", emp_id);
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
		return sqlSession.selectList("category.getDepCategoryList", emp_id);
	}
	
	/**
	* Method : getProCategoryList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 프로젝트 일정을 가져온다.
	*/
	@Override
	public List<Category> getProCategoryList(String emp_id) {
		return sqlSession.selectList("category.getProCategoryList", emp_id);
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
		return sqlSession.selectOne("category.getCategory", category_id);
	}
	
	/**
	* Method : getProCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param pro_id
	* @return
	* Method 설명 : 프로젝트의 카테고리를 가져온다.
	*/
	@Override
	public Category getProCategory(String pro_id) {
		return sqlSession.selectOne("category.getProCategory", pro_id);
	}

	/**
	* Method : insertCategory
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category
	* @return
	* Method 설명 : 카테고리 생성
	*/
	@Override
	public int insertCategory(Category category) {
		return sqlSession.insert("category.insertCategory", category);
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
		return sqlSession.update("category.updateCategory", category);
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
		return sqlSession.delete("category.deleteCategory", category_id);
	}

}
