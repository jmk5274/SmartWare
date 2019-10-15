package kr.or.ddit.smartware.calendar.repository;

import java.util.List;

import kr.or.ddit.smartware.calendar.model.Calendar;

public interface ICalendarDao {

	/**
	* Method : getAllCalendarList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 모든 일정을 가져온다.
	*/
	List<Calendar> getAllCalendarList(String emp_id);

}
