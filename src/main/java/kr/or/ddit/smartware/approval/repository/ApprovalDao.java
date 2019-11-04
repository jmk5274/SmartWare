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
    public int applCnt() {
        return sqlSession.selectOne("appl.applCnt");
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
    public List<Map> sendApplList(Map data) {
        return sqlSession.selectList("appl.sendApplList", data);
    }

    @Override
    public int sendApplListCnt(String emp_id) {
        return sqlSession.selectOne("appl.sendApplListCnt", emp_id);
    }

    @Override
    public List<Map> sendApplCompleList(Map data) {
        return sqlSession.selectList("appl.sendApplCompleList", data);
    }

    @Override
    public int sendApplCompleListCnt(String emp_id) {
        return sqlSession.selectOne("appl.sendApplCompleListCnt", emp_id);
    }

    @Override
    public List<Map> sendApplReferList(Map data) {
        return sqlSession.selectList("appl.sendApplReferList", data);
    }

    @Override
    public int sendApplReferListCnt(String emp_id) {
        return sqlSession.selectOne("appl.sendApplReferListCnt", emp_id);
    }

    @Override
    public List<ApplAppr> confirmStatus(String appl_id) {
        return sqlSession.selectList("appl.confirmStatus", appl_id);
    }

    @Override
    public List<Map> confirmApplList(Map data) {
        return sqlSession.selectList("appl.confirmApplList", data);
    }

    @Override
    public int confirmApplListCnt(String emp_id) {
        return sqlSession.selectOne("appl.confirmApplListCnt", emp_id);
    }

    @Override
    public List<Map> confirmApplCompleList(Map data) {
        return sqlSession.selectList("appl.confirmApplCompleList", data);
    }

    @Override
    public int confirmApplCompleListCnt(String emp_id) {
        return sqlSession.selectOne("appl.confirmApplCompleListCnt", emp_id);
    }

    @Override
    public List<Map> confirmApplReferList(Map data) {
        return sqlSession.selectList("appl.confirmApplReferList", data);
    }

    @Override
    public int confirmApplReferListCnt(String emp_id) {
        return sqlSession.selectOne("appl.confirmApplReferListCnt", emp_id);
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

    @Override
    public String sendApplMember(String appl_id) {
        return sqlSession.selectOne("appl.sendApplMember", appl_id);
    }

    @Override
    public String sendToNextMember(ApplAppr applAppr) {
        return sqlSession.selectOne("appl.sendToNextMember", applAppr);
    }

    @Override
    public String referAlarm(ApplAppr applAppr) {
        return sqlSession.selectOne("appl.referAlarm", applAppr);
    }
}
