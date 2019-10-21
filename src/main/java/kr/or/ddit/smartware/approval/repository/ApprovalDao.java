package kr.or.ddit.smartware.approval.repository;

import kr.or.ddit.smartware.approval.model.ApplAppr;
import kr.or.ddit.smartware.approval.model.Application;
import kr.or.ddit.smartware.approval.model.ApprMember;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Repository
public class ApprovalDao implements IApprovalDao{
    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSession;

    @Override
    public List<ApprMember> getApprMember(Map data) {
        return sqlSession.selectList("appr.getApprMem", data);
    }

    @Override
    public int insertAppl(Map data) {
        return sqlSession.insert("appr.insertAppl", data);
    }

    @Override
    public int setAppr(Map data) {
        return sqlSession.insert("appr.setAppr", data);
    }

    @Override
    public int confirmAppl(ApplAppr applAppr) {
        return sqlSession.update("appr.confirmAppl", applAppr);
    }

    @Override
    public List<Application> sendApplList(String emp_id) {
        return sqlSession.selectList("appr.sendApplList", emp_id);
    }

    @Override
    public List<ApplAppr> confirmStatus(String appl_id) {
        return sqlSession.selectList("appr.confirmStatus", appl_id);
    }
}
