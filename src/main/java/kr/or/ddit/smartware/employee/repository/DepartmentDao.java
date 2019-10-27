package kr.or.ddit.smartware.employee.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.employee.model.Department;
import kr.or.ddit.smartware.employee.model.Employee;

@Repository
public class DepartmentDao implements IDepartmentDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	* Method : getDepartNm
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param depart_id
	* @return
	* Method 설명 : 부서 아이디에 해당하는 부서 이름을 반환
	*/
	@Override
	public String getDepartNm(String depart_id) {
		return sqlSession.selectOne("department.getDepartNm", depart_id);
	}

	@Override
	public List<Department> getAllDepartment() {
		return sqlSession.selectList("department.getAllDepartment");
	}

	/**
	* Method : getDepartEmpList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param depart_id
	* @return
	* Method 설명 : 부서에 속한 사원의 리스트를 반환 
	*/
	@Override
	public List<Employee> getDepartEmpList(String depart_id) {
		return sqlSession.selectList("department.getDepartEmpList", depart_id);
	}
	
	
	
}
