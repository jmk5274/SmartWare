package kr.or.ddit.smartware.employee.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.repository.IEmployeeDao;
import kr.or.ddit.smartware.post.model.Post;

@Service
public class EmployeeService implements IEmployeeService{

	@Resource(name = "employeeDao")
	private IEmployeeDao employeeDao; 
	
	public Employee getEmployee(String emp_id) {
		return employeeDao.getEmployee(emp_id);
	}

	@Override
	public Map getEmployeeDetail(String emp_id) {
		return employeeDao.getEmployeeDetail(emp_id);
	}

	@Override
	public List<Employee> allEmployeeList() {
		List<Employee> list = employeeDao.allEmployeeList();
		return list;
	}

	@Override
	public List<Map> getDetailEmpList() {
		return employeeDao.getDetailEmpList();
	}

	@Override
	public List<Employee> getEmployeeList(Map map) {
		return employeeDao.getEmployeeList(map);
	}

	@Override
	public int insertEmployee(Employee employee) {
		return employeeDao.insertEmployee(employee);
	}

	@Override
	public int deleteEmployee(String emp_id) {
		return employeeDao.deleteEmployee(emp_id);
	}

	@Override
	public int updateEmployee(Employee employee) {
		return employeeDao.updateEmployee(employee);
	}
	
	@Override
	public int updateEmployeeAble(Employee employee) {
		return employeeDao.updateEmployeeAble(employee);
	}
	
	@Override
	public int updateEmployeeRank(Employee employee) {
		return employeeDao.updateEmployeeRank(employee);
	}
	
	@Override
	public int updateEmployeePosition(Employee employee) {
		return employeeDao.updateEmployeePosition(employee);
	}
	
	@Override
	public int updateEmployeeDepartment(Employee employee) {
		return employeeDao.updateEmployeeDepartment(employee);
	}
	
	@Override
	public int updateEmployeeJob(Employee employee) {
		return employeeDao.updateEmployeeJob(employee);
	}

	@Override
	public List<Map> getDepartEmpDetail(String depart_id) {
		return employeeDao.getDepartEmpDetail(depart_id);
	}

	@Override
	public List<Map> searchEmp(String keyword) {
		return employeeDao.searchEmp(keyword);
	}

	@Override
	public Map getEmployeeDetail2(String emp_id) {
		return employeeDao.getEmployeeDetail2(emp_id);
	}

	@Override
	public List<Map> getDetailPagingList(Map map) {
		return employeeDao.getDetailPagingList(map);
	}

	@Override
	public int idCheck(String emp_id) {
		return employeeDao.idCheck(emp_id);
	}	

}
