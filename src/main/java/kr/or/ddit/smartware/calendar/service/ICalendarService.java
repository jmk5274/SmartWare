package kr.or.ddit.smartware.calendar.service;

import java.util.List;

import kr.or.ddit.smartware.calendar.model.Calendar;

public interface ICalendarService {

	/**
	* Method : getAllCalendarList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 사원의 모든 일정을 가져온다.
	*/
	List<Calendar> getAllCalendarList(String emp_id);

	/**
	* Method : getCategoryColor
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @return
	* Method 설명 : 카테고리의 색상을 가져온다.
	*/
	String getCategoryColor(String category_id);

}
