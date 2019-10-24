package kr.or.ddit.smartware.bus.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BusController {
	
//	@ResponseBody
//	@RequestMapping(value = "/busMap", method = RequestMethod.GET, produces = "application/text; charset=utf-8" )
//	public String busMap(Locale locale, Model model) throws UnsupportedEncodingException, IOException {
//		StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/buspos/getLowBusPosByRtid");
//		
//		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=f1diildqfi");
//		urlBuilder.append("&" + URLEncoder.encode("busRouteId", "UTF-8") + "=" + URLEncoder.encode("100100118", "UTF-8"));
//		URL url = new URL(urlBuilder.toString());
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		conn.setRequestMethod("GET");
//		conn.setRequestProperty("Content-type", "apploi");
//		
		

		
		
//		return "tiles/bus/bus";
//	}
	
}
