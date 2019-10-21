package kr.or.ddit.smartware.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.smartware.employee.model.Employee;

public class SessionCheckInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(SessionCheckInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		logger.debug("이곳은 sessioncheck");
		// session에 user가 없으면 login화면으로 이동
		if(employee == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		// session에 user가 있으면 존재하면 통과
		return true;
	}
}
