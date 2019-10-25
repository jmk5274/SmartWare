package kr.or.ddit.smartware.bus.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
	
	
	@RequestMapping(path = "bus", method = RequestMethod.GET)
	public String bus() {
		return "tiles/bus/bus";
	}
	
	@ResponseBody
	@RequestMapping(value = "/busMap", method = RequestMethod.GET, produces = "application/text; charset=utf-8" )
	public String busMap(Locale locale, Model model) throws UnsupportedEncodingException, IOException {
//		StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/buspos/getLowBusPosByRtid");
//		http://openapitraffic.daejeon.go.kr/api/rest/busposinfo/getBusPosByRtid?busRouteId=30300001&serviceKey=서비스키
		StringBuilder urlBuilder = new StringBuilder("http://openapitraffic.daejeon.go.kr/api/rest/busposinfo/getBusPosByRtid");
		
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=ZjBD%2Bw2HZJAOqnauf1qUuUGWeaoBN7ECeyy%2BsLFAHWgd8b1CJFsf92ib%2FMIFqfkKehWA0Tg9B3%2FVFIDNY0fKQA%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("busRouteId", "UTF-8") + "=" + URLEncoder.encode("30300050", "UTF-8"));
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json;charset=UTF-8");
		
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		
		rd.close();
		conn.disconnect();
		
		return sb.toString();
	}
	
}
