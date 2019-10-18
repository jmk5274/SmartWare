package kr.or.ddit.smartware.approval.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public class BatchDao implements IBatchDao {
    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSession;

    @Override
    public int delApprMem() {
        return sqlSession.delete("batch.delApprMem");
    }

    @Override
    public int delErdAppr() {
        return sqlSession.delete("batch.delErdAppr");
    }

    @Override
    public int setErdAppr() {
        return sqlSession.insert("batch.setErdAppr");
    }

    @Override
    public int setApprMem(String emp_id) {
        return sqlSession.insert("batch.setApprMem", emp_id);
    }
}
