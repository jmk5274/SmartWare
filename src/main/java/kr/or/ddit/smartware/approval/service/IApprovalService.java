package kr.or.ddit.smartware.approval.service;

import kr.or.ddit.smartware.approval.model.ApplAppr;
import kr.or.ddit.smartware.approval.model.Application;
import kr.or.ddit.smartware.approval.model.ApprMember;

import java.util.List;
import java.util.Map;

public interface IApprovalService {

    /**
     * Method : getAppl
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 신청서 상세 조회
     */
    Application getAppl(String appl_id);

    int applCnt();

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
    List<Map> sendApplList(Map data);
    int sendApplListCnt(String emp_id);

    /**
     * Method : sendApplCompleList
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 본인이 송신한 신청서 완료 목록
     */
    List<Map> sendApplCompleList(Map data);
    int sendApplCompleListCnt(String emp_id);

    /**
     * Method : sendApplReferList
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 본인이 송신한 결재 반려 목록
     */
    List<Map> sendApplReferList(Map data);
    int sendApplReferListCnt(String emp_id);

    /**
     * Method : confirmStatus
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 송신한 신청서의 승인 여부
     */
    List<ApplAppr> confirmStatus(String appl_id);

    /**
     * Method : confirmApplList
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 결재해줘야하는 결재목록
     */
    List<Map> confirmApplList(Map data);
    int confirmApplListCnt(String emp_id);

    /**
     * Method : confirmApplCompleList
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 결재한 문서 목록
     */
    List<Map> confirmApplCompleList(Map data);
    int confirmApplCompleListCnt(String emp_id);

    /**
     * Method : confirmApplReferList
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 결재해줫던 목록 중 반려된 목록
     */
    List<Map> confirmApplReferList(Map data);
    int confirmApplReferListCnt(String emp_id);

    /**
     * Method : checkAppl
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 결재문서 승인
     */
    int checkAppl(Map data);

    /**
     * Method : referAppl
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 결재문서 반려
     */
    int referAppl(Map data);

    /**
     * Method : checkAble
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 결재상태 Ture변경
     */
    int checkAble(ApplAppr applAppr);

    /**
     * @param appl_id
     * @return
     * 결재문서 송신 시 처음 결재해줄 멤버에게 알람 (해당 결재문서 결재멤버중 우선순의가 가장 낮은자)
     */
    String sendApplMember(String appl_id);

    /**
     * @param applAppr
     * @return
     * 결재멤버가 결재 후 자신보다 우선순위가 1단계 높은 사람에게 알림
     */
    String sendToNextMember(ApplAppr applAppr);

    /**
     * @param applAppr
     * @return
     * 반려 시 알람 받을 멤버들 모두 출력
     */
    String referAlarm(ApplAppr applAppr);
}
