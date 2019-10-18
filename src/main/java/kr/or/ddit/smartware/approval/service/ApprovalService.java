package kr.or.ddit.smartware.approval.service;

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
}
