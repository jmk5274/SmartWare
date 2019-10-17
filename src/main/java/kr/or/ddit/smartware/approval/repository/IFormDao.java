package kr.or.ddit.smartware.approval.repository;

import kr.or.ddit.smartware.approval.model.Form;

import java.util.List;

public interface IFormDao {

    /**
     * Method : getFormList
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return java.util.List<kr.or.ddit.smartware.approval.model.Form>
     * Method 설명 : 결제 양식 리스트 출력
     */
    List<Form> getFormList();

    /**
     * Method : getFormInfo
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param form_id
     * @return kr.or.ddit.smartware.approval.model.Form
     * Method 설명 : 결제양식 상세 정보
     */
    Form getFormInfo(String form_id);
}
