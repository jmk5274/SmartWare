package kr.or.ddit.smartware.employee.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.employee.model.Employee;

@Repository
public class EmployeeDao implements IEmployeeDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Employee> allEmployeeList() {
		return sqlSession.selectList("employee.allEmployeeList");
	}

	@Override
	public List<Map> getDetailEmpList() {
		return sqlSession.selectList("employee.detailEmpList");
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
	public Map getEmployeeDetail(String emp_id) {
		return sqlSession.selectOne("employee.getEmployeeDetail", emp_id);
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
	
	@Override
	public int updateEmployeeAble(Employee employee) {
		return sqlSession.update("employee.updateEmployeeAble", employee);
	}
	
	@Override
	public int updateEmployeeRank(Employee employee) {
		return sqlSession.update("employee.updateEmployeeRank", employee);
	}
	
	@Override
	public int updateEmployeePosition(Employee employee) {
		return sqlSession.update("employee.updateEmployeePosition", employee);
	}
	
	@Override
	public int updateEmployeeDepartment(Employee employee) {
		return sqlSession.update("employee.updateEmployeeDepartment", employee);
	}
	
	@Override
	public int updateEmployeeJob(Employee employee) {
		return sqlSession.update("employee.updateEmployeeJob", employee);
	}

	@Override
	public List<Map> getDepartEmpDetail(String depart_id) {
		return sqlSession.selectList("employee.getDepartEmpDetail", depart_id);
	}

	@Override
	public List<Map> searchEmp(String keyword) {
		return sqlSession.selectList("employee.searchEmp", keyword);
	}

	@Override
	public Map getEmployeeDetail2(String emp_id) {
		return sqlSession.selectOne("employee.getEmployeeDetail2", emp_id);
	}

	@Override
	public List<Map> getDetailPagingList(Map map) {
		return sqlSession.selectList("employee.getDetailPagingList", map);
	}

	@Override
	public int idCheck(String emp_id) {
		return sqlSession.selectOne("employee.idCheck", emp_id);
	}

	@Override
	public List<Map> videoEmpList(Employee employee) {
		return sqlSession.selectList("employee.videoEmpList", employee);
	}

}
