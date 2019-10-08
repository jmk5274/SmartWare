package kr.or.ddit.smartware.calendar.repository;

import java.util.List;

import kr.or.ddit.smartware.calendar.model.DepCalendar;
import kr.or.ddit.smartware.calendar.model.EmpCalendar;

public interface ICalendarDao {

	List<EmpCalendar> getEmpCalendarList(String emp_id);

	List<DepCalendar> getDepCalendarList(String emp_id);

}
