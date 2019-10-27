package kr.or.ddit.smartware.employee.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.employee.model.Department;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.repository.IDepartmentDao;

@Service
public class DepartmentService implements IDepartmentService {

	@Resource(name = "departmentDao")
	private IDepartmentDao departmentDao; 
	
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
		return departmentDao.getDepartNm(depart_id);
	}

	@Override
	public List<Department> getAllDepartment() {
		return departmentDao.getAllDepartment();
	}

	/**
	* Method : getAllDepartEmpList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return Map(key: emp_id, value: List<Employee>)
	* Method 설명 : 모든 부서의 사원리스트를 반환
	*/
	@Override
	public Map<String, List<Employee>> getAllDepartEmpList() {
		List<Department> departmentList = departmentDao.getAllDepartment();
		Map<String, List<Employee>> rtnMap = new HashMap<String, List<Employee>>();
		
		for(Department department : departmentList) {
			String depart_id = department.getDepart_id();
			List<Employee> employeeList = departmentDao.getDepartEmpList(depart_id);
			
			rtnMap.put(depart_id, employeeList);
		}
		
		return rtnMap;
	}

}
