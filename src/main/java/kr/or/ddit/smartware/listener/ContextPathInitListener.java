package kr.or.ddit.smartware.listener;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.smartware.employee.model.Employee;

public class ContextPathInitListener implements ServletContextListener{

	private static final Logger logger = LoggerFactory.getLogger(ContextPathInitListener.class);
	
	// application객체가 생성될 때 호출
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("cp", sc.getContextPath());
		
		sc.setAttribute("S_EMPLOYEE_LIST", new ArrayList<Employee>());
		
//		logger.debug("contextPathInitListener ==> cp: {}", sc.getAttribute("cp"));
	}

	// application객체가 소멸될 때 호출
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
