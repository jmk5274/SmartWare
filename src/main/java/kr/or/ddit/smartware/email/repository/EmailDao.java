package kr.or.ddit.smartware.email.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDao implements IEmailDao{
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map> getAddressbookList(String depart_id) {
		return sqlSession.selectList("email.getAddressbookList", depart_id);
	}

	@Override
	public List<Map> getDepartMentList() {
		return sqlSession.selectList("email.getDepartMentList");
	}

	@Override
	public List<Map> getEmpSearchList(String keyword) {
		return sqlSession.selectList("email.getEmpSearchList", keyword);
	}

	@Override
	public List<Map> getDepSearchList(String keyword) {
		return sqlSession.selectList("email.getDepSearchList", keyword);
	}

	@Override
	public List<Map> getPositionList() {
		return sqlSession.selectList("email.getPositionList");
	}
}
