package kr.or.ddit.smartware.approval.repository;

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
        return sqlSession.selectList("apprMem.getApprMem", data);
    }
}
