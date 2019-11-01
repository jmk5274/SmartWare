package kr.or.ddit.smartware.approval.service;

import kr.or.ddit.smartware.approval.model.ApplAppr;
import kr.or.ddit.smartware.approval.model.Application;
import kr.or.ddit.smartware.approval.model.ApprMember;
import kr.or.ddit.smartware.approval.repository.IApprovalDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ApprovalService implements IApprovalService{
    @Resource(name = "approvalDao")
    private IApprovalDao approvalDao;

    @Override
    public Application getAppl(String appl_id) {
        return approvalDao.getAppl(appl_id);
    }

    @Override
    public List<ApprMember> getApprMember(Map data) {
        return approvalDao.getApprMember(data);
    }

    @Override
    public int insertAppl(Map data) {
        return approvalDao.insertAppl(data);
    }

    @Override
    public int setAppr(Map data) {
        return approvalDao.setAppr(data);
    }

    @Override
    public int confirmAppl(ApplAppr applAppr) {
        return approvalDao.confirmAppl(applAppr);
    }

    @Override
    public List<Map> sendApplList(Map data) {
        return approvalDao.sendApplList(data);
    }

    @Override
    public int sendApplListCnt(String emp_id) {
        return approvalDao.sendApplListCnt(emp_id);
    }

    @Override
    public List<Map> sendApplCompleList(Map data) {
        return approvalDao.sendApplCompleList(data);
    }

    @Override
    public int sendApplCompleListCnt(String emp_id) {
        return approvalDao.sendApplCompleListCnt(emp_id);
    }

    @Override
    public List<Map> sendApplReferList(Map data) {
        return approvalDao.sendApplReferList(data);
    }

    @Override
    public int sendApplReferListCnt(String emp_id) {
        return approvalDao.sendApplReferListCnt(emp_id);
    }

    @Override
    public List<ApplAppr> confirmStatus(String appl_id) {
        return approvalDao.confirmStatus(appl_id);
    }

    @Override
    public List<Map> confirmApplList(Map data) {
        return approvalDao.confirmApplList(data);
    }

    @Override
    public int confirmApplListCnt(String emp_id) {
        return approvalDao.confirmApplListCnt(emp_id);
    }

    @Override
    public List<Map> confirmApplCompleList(Map data) {
        return approvalDao.confirmApplCompleList(data);
    }

    @Override
    public int confirmApplCompleListCnt(String emp_id) {
        return approvalDao.confirmApplCompleListCnt(emp_id);
    }

    @Override
    public List<Map> confirmApplReferList(Map data) {
        return approvalDao.confirmApplReferList(data);
    }

    @Override
    public int confirmApplReferListCnt(String emp_id) {
        return approvalDao.confirmApplReferListCnt(emp_id);
    }

    @Override
    public int checkAppl(Map data) {
        return approvalDao.checkAppl(data);
    }

    @Override
    public int referAppl(Map data) {
        return approvalDao.referAppl(data);
    }

    @Override
    public int checkAble(ApplAppr applAppr) {
        return approvalDao.checkAble(applAppr);
    }

    @Override
    public String sendApplMember(String appl_id) {
        return approvalDao.sendApplMember(appl_id);
    }

    @Override
    public String sendToNextMember(ApplAppr applAppr) {
        return approvalDao.sendToNextMember(applAppr);
    }

    @Override
    public String referAlarm(ApplAppr applAppr) {
        return approvalDao.referAlarm(applAppr);
    }
}
