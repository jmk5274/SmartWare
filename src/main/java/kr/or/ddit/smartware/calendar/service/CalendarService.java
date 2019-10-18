package kr.or.ddit.smartware.calendar.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.calendar.model.Calendar;
import kr.or.ddit.smartware.calendar.repository.ICalendarDao;

@Service
public class CalendarService implements ICalendarService{

	@Resource(name = "calendarDao")
	private ICalendarDao calendarDao;
	
	/**
	 * Method : getCalendar
	 * 작성자 : JO MIN SOO
	 * 변경이력 :
	 * @param cal_id
	 * @return
	 * Method 설명 : cal_id에 해당하는 일정 불러오기
	 */
	@Override
	public Calendar getCalendar(String cal_id) {
		return calendarDao.getCalendar(cal_id);
	}
	
	/**
	* Method : getAllCalendarList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 모든 일정을 가져온다.
	*/
	@Override
	public List<Calendar> getAllCalendarList(String emp_id) {
		return calendarDao.getAllCalendarList(emp_id);
	}

	/**
	* Method : insertCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param calendar
	* @return
	* Method 설명 : 일정 추가
	*/
	@Override
	public String insertCalendar(Calendar calendar) {
		calendarDao.insertCalendar(calendar);
		return calendar.getCal_id();
	}

	/**
	* Method : updateCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param calendar
	* @return
	* Method 설명 : 일정 수정
	*/
	@Override
	public int updateCalendar(Calendar calendar) {
		return calendarDao.updateCalendar(calendar);
	}
	
	/**
	* Method : deleteCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param cal_id
	* @return
	* Method 설명 : 일정 삭제
	*/
	@Override
	public int deleteCalendar(String cal_id) {
		return calendarDao.deleteCalendar(cal_id);
	}

}
