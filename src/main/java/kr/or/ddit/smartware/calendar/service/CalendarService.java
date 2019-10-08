package kr.or.ddit.smartware.calendar.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.calendar.model.DepCalendar;
import kr.or.ddit.smartware.calendar.model.EmpCalendar;
import kr.or.ddit.smartware.calendar.repository.ICalendarDao;

@Service
public class CalendarService implements ICalendarService{

	@Resource(name = "calendarDao")
	private ICalendarDao calendarDao;
	
	@Override
	public List<EmpCalendar> getEmpCalendarList(String emp_id) {
		return calendarDao.getEmpCalendarList(emp_id);
	}

	@Override
	public List<DepCalendar> getDepCalendarList(String emp_id) {
		return calendarDao.getDepCalendarList(emp_id);
	}

}
