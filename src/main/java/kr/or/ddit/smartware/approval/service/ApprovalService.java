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
    public List<Map> sendApplList(String emp_id) {
        return approvalDao.sendApplList(emp_id);
    }

    @Override
    public List<Map> sendApplCompleList(String emp_id) {
        return approvalDao.sendApplCompleList(emp_id);
    }

    @Override
    public List<Map> sendApplReferList(String emp_id) {
        return approvalDao.sendApplReferList(emp_id);
    }

    @Override
    public List<ApplAppr> confirmStatus(String appl_id) {
        return approvalDao.confirmStatus(appl_id);
    }

    @Override
    public List<Map> confirmApplList(String emp_id) {
        return approvalDao.confirmApplList(emp_id);
    }

    @Override
    public List<Map> confirmApplCompleList(String emp_id) {
        return approvalDao.confirmApplCompleList(emp_id);
    }

    @Override
    public List<Map> confirmApplReferList(String emp_id) {
        return approvalDao.confirmApplReferList(emp_id);
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
}
