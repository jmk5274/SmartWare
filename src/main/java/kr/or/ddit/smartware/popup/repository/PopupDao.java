package kr.or.ddit.smartware.popup.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.popup.model.Popup;

@Repository
public class PopupDao implements IPopupDao{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	* Method : getPagePopupList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 팝업 페이징 리스트 조회
	*/
	@Override
	public List<Popup> getPagePopupList(Map<String, Integer> map) {
		return sqlSession.selectList("popup.getPagePopupList", map);
	}

	@Override
	public List<Popup> getAllPopupList() {
		return sqlSession.selectList("popup.getAllPopupList");
	}

}
