package kr.or.ddit.smartware.calendar.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.calendar.model.DepCalendar;
import kr.or.ddit.smartware.calendar.model.EmpCalendar;

@Repository
public class CalendarDao implements ICalendarDao{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<EmpCalendar> getEmpCalendarList(String emp_id) {
		return sqlSession.selectList("calendar.getEmpCalendarList", emp_id);
	}

	@Override
	public List<DepCalendar> getDepCalendarList(String emp_id) {
		return sqlSession.selectList("calendar.getDepCalendarList", emp_id);
	}

}
