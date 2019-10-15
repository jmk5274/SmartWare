package kr.or.ddit.smartware.employee.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import kr.or.ddit.smartware.employee.model.Department;
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
	
	@Override
	public List<Map> getDepartMentList() {
		return departmentDao.getDepartMentList();
	}

}
