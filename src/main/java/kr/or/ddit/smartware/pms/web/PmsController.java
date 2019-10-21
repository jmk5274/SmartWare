package kr.or.ddit.smartware.pms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PmsController {

	@RequestMapping("pms")
	public String pmsView() {
		
		return "tiles2/pms/main";
	}
}
