package kr.or.ddit.smartware.approval.service;

import kr.or.ddit.smartware.approval.model.ApplAppr;
import kr.or.ddit.smartware.approval.model.Application;
import kr.or.ddit.smartware.approval.model.ApprMember;

import java.util.List;
import java.util.Map;

public interface IApprovalService {
    /**
     * Method : getApprMember
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 사원 아이디와 양식 아이디를 받아 해당 결재멤버 출력
     */
    List<ApprMember> getApprMember(Map data);

    /**
     * Method : insertAppl
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 전자결재 문서 전송
     */
    int insertAppl(Map data);

    /**
     * Method : insertAppr
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 신청서 결재선 등록
     */
    int setAppr(Map data);

    /**
     * Method : confirmAppl
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 신청서 승인 여부 업데이트
     */
    int confirmAppl(ApplAppr applAppr);

    /**
     * Method : sendApplList
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 본인이 송신한 신청서 목록
     */
    List<Application> sendApplList(String emp_id);

    /**
     * Method : confirmStatus
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 송신한 신청서의 승인 여부
     */
    List<ApplAppr> confirmStatus(String appl_id);
}
