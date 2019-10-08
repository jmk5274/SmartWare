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
	* Method : getCategoryColor
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @return
	* Method 설명 : 카테고리의 색상을 가져온다.
	*/
	@Override
	public String getCategoryColor(String category_id) {
		return calendarDao.getCategoryColor(category_id);
	}

}
