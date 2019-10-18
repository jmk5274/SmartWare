package kr.or.ddit.smartware.calendar.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.calendar.model.Calendar;

@Repository
public class CalendarDao implements ICalendarDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

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
		return sqlSession.selectOne("calendar.getCalendar", cal_id);
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
		return sqlSession.selectList("calendar.getAllCalendarList", emp_id);
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
	public int insertCalendar(Calendar calendar) {
		return sqlSession.insert("calendar.insertCalendar", calendar);
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
		return sqlSession.update("calendar.updateCalendar", calendar);
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
		return sqlSession.delete("calendar.deleteCalendar", cal_id);
	}

	/**
	* Method : deleteCateCalendar
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param category_id
	* @return
	* Method 설명 : 카테고리의 모든 일정 삭제
	*/
	@Override
	public int deleteCateCalendar(String category_id) {
		return sqlSession.delete("calendar.deleteCateCalendar", category_id);
	}

}