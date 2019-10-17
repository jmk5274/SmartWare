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
