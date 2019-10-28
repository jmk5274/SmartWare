package kr.or.ddit.smartware.approval.service;

public interface IBatchService {
    /**
     * Method : delApprMem
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : Appr_Member 테이블 데이터 삭제
     */
    int delApprMem();

    /**
     * Method :  delErdAppr
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : Erd_Appr 테이블 데이터 삭제
     */
    int delErdAppr();

    /**
     * Method :  setErdAppr
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : Erd_Appr에 사원들에 맞춰 데이터 입력
     */
    int setErdAppr();

    /**
     * Method : setApprMem
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : Appr_Member 테이블에 해당 사원 결재선 멤버 입력
     */
    int setApprMem(String emp_id);

    /**
     * Method :  setCommute
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return
     * Method 설명 : 사원 미출근 시 미출근 배치프로그램
     */
    int setCommute();
}
