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
    public Application getAppl(String appl_id) {
        return sqlSession.selectOne("appl.getAppl", appl_id);
    }

    @Override
    public List<ApprMember> getApprMember(Map data) {
        return sqlSession.selectList("appl.getApprMem", data);
    }

    @Override
    public int insertAppl(Map data) {
        return sqlSession.insert("appl.insertAppl", data);
    }

    @Override
    public int setAppr(Map data) {
        return sqlSession.insert("appl.setAppr", data);
    }

    @Override
    public int confirmAppl(ApplAppr applAppr) {
        return sqlSession.update("appl.confirmAppl", applAppr);
    }

    @Override
    public List<Map> sendApplList(String emp_id) {
        return sqlSession.selectList("appl.sendApplList", emp_id);
    }

    @Override
    public List<Map> sendApplCompleList(String emp_id) {
        return sqlSession.selectList("appl.sendApplCompleList", emp_id);
    }

    @Override
    public List<Map> sendApplReferList(String emp_id) {
        return sqlSession.selectList("appl.sendApplReferList", emp_id);
    }

    @Override
    public List<ApplAppr> confirmStatus(String appl_id) {
        return sqlSession.selectList("appl.confirmStatus", appl_id);
    }

    @Override
    public List<Map> confirmApplList(String emp_id) {
        return sqlSession.selectList("appl.confirmApplList", emp_id);
    }

    @Override
    public List<Map> confirmApplCompleList(String emp_id) {
        return sqlSession.selectList("appl.confirmApplCompleList", emp_id);
    }

    @Override
    public List<Map> confirmApplReferList(String emp_id) {
        return sqlSession.selectList("appl.confirmApplReferList", emp_id);
    }

    @Override
    public int checkAppl(Map data) {
        return sqlSession.update("appl.checkAppl", data);
    }

    @Override
    public int referAppl(Map data) {
        return sqlSession.update("appl.referAppl", data);
    }

    @Override
    public int checkAble(ApplAppr applAppr) {
        return sqlSession.update("appl.checkAble", applAppr);
    }
}
