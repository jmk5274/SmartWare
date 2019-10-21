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
    public List<Application> sendApplList(String emp_id) {
        return approvalDao.sendApplList(emp_id);
    }

    @Override
    public List<ApplAppr> confirmStatus(String appl_id) {
        return approvalDao.confirmStatus(appl_id);
    }
}
