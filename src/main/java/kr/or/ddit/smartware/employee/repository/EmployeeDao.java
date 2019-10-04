package kr.or.ddit.smartware.employee.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.employee.model.Employee;

@Repository
public class EmployeeDao implements IEmployeeDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 
	* Method : getEmployee
	* 작성자 : PC-04
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id를 갖는 사원 정보 조회
	 */
	public Employee getEmployee(String emp_id) {
		return sqlSession.selectOne("employee.getEmployee", emp_id);
	}
	
	@Override
	public List<Employee> getEmployeeList() {
		return sqlSession.selectList("employee.getEmployeeList");
	}

}
