package kr.or.ddit.smartware.pms.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.View;

@Controller
public class TaskController {

	@Resource(name="jsonView")
	private View jsonView;
	
}
