package kr.or.ddit.smartware.approval.repository;

import kr.or.ddit.smartware.approval.model.ApprMember;

import java.util.List;
import java.util.Map;

public interface IApprovalDao {
    /**
     * Method : getApprMember
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 사원 아이디와 양식 아이디를 받아 해당 결재멤버 출력
     */
    List<ApprMember> getApprMember(Map data);
}
