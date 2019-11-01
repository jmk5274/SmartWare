package kr.or.ddit.smartware.calendar.repository;

import java.util.List;

import kr.or.ddit.smartware.calendar.model.Calendar;

public interface ICalendarDao {

	/**
	 * Method : getCalendar
	 * 작성자 : JO MIN SOO
	 * 변경이력 :
	 * @param cal_id
	 * @return
	 * Method 설명 : cal_id에 해당하는 일정 불러오기
	 */
	Calendar getCalendar(String cal_id);
	
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
	* Method : getTodayCalendar
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 사원 일간 일정 내용 조회 
	*/
	List<Calendar> getTodayCalendar(String emp_id);
	
	/**
	* Method : getWeekCalendar
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : emp_id에 해당하는 사원 주간 일정 내용 조회
	*/
	List<Calendar> getWeekCalendar(String emp_id);
	
	/**
	* Method : insertCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param calendar
	* @return
	* Method 설명 : 일정 추가
	*/
	int insertCalendar(Calendar calendar);
	
	/**
	* Method : updateCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param calendar
	* @return
	* Method 설명 : 일정 수정 
	*/
	int updateCalendar(Calendar calendar);
	
	/**
	* Method : deleteCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param cal_id
	* @return
	* Method 설명 : 일정 삭제
	*/
	int deleteCalendar(String cal_id);
	
	/**
	* Method : deleteCateCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @return
	* Method 설명 : 카테고리의 모든 일정 삭제
	*/
	int deleteCateCalendar(String category_id);

}
