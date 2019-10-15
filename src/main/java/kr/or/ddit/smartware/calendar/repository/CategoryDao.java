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
	
}
