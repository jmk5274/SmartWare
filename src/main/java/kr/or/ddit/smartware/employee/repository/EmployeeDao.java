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
	
	@Override
	public List<Employee> getEmployeeList() {
		return sqlSession.selectList("employee.getEmployeeList");
	}

}
