package kr.or.ddit.smartware.config;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.smartware.employee.model.Employee;

public class test {

	public static void main(String[] args) {
		Map<String, Employee> map = new HashMap<String, Employee>();
		
		Employee employee1 = new Employee();
		Employee employee2 = new Employee();
		Employee employee3 = new Employee();
		
		employee1.setEmp_id("1");
		employee2.setEmp_id("2");
		employee3.setEmp_id("3");
		
		map.put("employee1", employee1);
		map.put("employee1", employee2);
		map.put("employee2", employee2);
		map.put("employee3", employee3);
		
		System.out.println(map);
	}

}
