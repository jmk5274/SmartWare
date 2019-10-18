package kr.or.ddit.smartware.approval.service;

import kr.or.ddit.smartware.approval.repository.IBatchDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class BatchService implements IBatchService{
    @Resource(name = "batchDao")
    private IBatchDao batchDao;

    @Override
    public int delApprMem() {
        return batchDao.delApprMem();
    }

    @Override
    public int delErdAppr() {
        return batchDao.delErdAppr();
    }

    @Override
    public int setErdAppr() {
        return batchDao.setErdAppr();
    }

    @Override
    public int setApprMem(String emp_id) {
        return batchDao.setApprMem(emp_id);
    }
}
