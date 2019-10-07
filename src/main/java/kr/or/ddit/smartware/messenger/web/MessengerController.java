package kr.or.ddit.smartware.messenger.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.smartware.messenger.service.IMessengerService;

@Controller
public class MessengerController {

	@Resource(name = "messengerService")
	private IMessengerService messengerService;
	
}
