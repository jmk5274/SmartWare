package kr.or.ddit.smartware.email.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.email.repository.IEmailDao;

@Service
public class EmailService implements IEmailService{
	@Resource(name = "emailDao")
	private IEmailDao emailDao;
	
	@Override
	public List<Map> getAddressbookList(String depart_id) {
		return emailDao.getAddressbookList(depart_id);
	}


	@Override
	public List<Map> getEmpSearchList(String keyword) {
		
		return emailDao.getEmpSearchList(keyword);
	}

	@Override
	public List<Map> getDepSearchList(String keyword) {
		return emailDao.getDepSearchList(keyword);
	}


}
