package kr.or.ddit.smartware.employee.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.employee.model.Position;
import kr.or.ddit.smartware.employee.repository.IPositionDao;

@Service
public class PositionService implements IPositionService {

	@Resource(name = "positionDao")
	private IPositionDao positionDao; 
	
	/**
	* Method : getPosiNm
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param posi_id
	* @return
	* Method 설명 : 직책 아이디에 해당하는 직책 이름을 반환
	*/
	@Override
	public String getPosiNm(String posi_id) {
		return positionDao.getPosiNm(posi_id);
	}

	@Override
	public List<Position> getAllPosition() {
		return positionDao.getAllPosition();
	}
}
