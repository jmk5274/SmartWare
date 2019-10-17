package kr.or.ddit.smartware.approval.service;

import kr.or.ddit.smartware.approval.model.Form;
import kr.or.ddit.smartware.approval.repository.IFormDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FormService implements IFormService {
    @Resource(name = "formDao")
    private IFormDao formDao;

    /**
     * Method : getFormList
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param
     * @return java.util.List<kr.or.ddit.smartware.approval.model.Form>
     * Method 설명 : 결제 양식 리스트 출력
     */
    @Override
    public List<Form> getFormList() {
        return formDao.getFormList();
    }

    /**
     * Method : getFormInfo
     * 작성자 : Bae Sang Hyun
     * 변경이력 :
     * @param form_id
     * @return kr.or.ddit.smartware.approval.model.Form
     * Method 설명 : 결제양식 상세 정보
     */
    @Override
    public Form getFormInfo(String form_id) {
        return formDao.getFormInfo(form_id);
    }
}
