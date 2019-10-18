package kr.or.ddit.smartware.popup.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.popup.model.Popup;

@Repository
public class PopupDao implements IPopupDao{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	* Method : getAllPopupList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 전체 팝업리스트 조회
	*/
	@Override
	public List<Popup> getAllPopupList() {
		return sqlSession.selectList("popup.getAllPopupList");
	}

}
