package kr.or.ddit.smartware.employee.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.post.model.Post;

@Repository
public class EmployeeDao implements IEmployeeDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Employee> allEmployeeList(String emp_id) {
		return sqlSession.selectList("employee.allEmployeeList", emp_id);
	}
	
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
	public List<Employee> getEmployeeList(Map map) {
		return sqlSession.selectList("employee.getEmployeeList", map);
	}

	@Override
	public int insertEmployee(Employee employee) {
		return sqlSession.insert("employee.insertEmployee", employee);
	}

	@Override
	public int deleteEmployee(String emp_id) {
		return sqlSession.delete("employee.deleteEmployee", emp_id);
	}

	@Override
	public int updateEmployee(Employee employee) {
		return sqlSession.update("employee.updateEmployee", employee);
	}
	
	

}
