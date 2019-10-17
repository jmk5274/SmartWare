package kr.or.ddit.smartware.approval.repository;

import kr.or.ddit.smartware.approval.model.Form;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class FormDao implements IFormDao {
    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSession;

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
        return sqlSession.selectList("form.getFormList");
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
        return sqlSession.selectOne("form.getFormInfo", form_id);
    }
}
