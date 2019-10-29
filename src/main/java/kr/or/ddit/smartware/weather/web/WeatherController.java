package kr.or.ddit.smartware.weather.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WeatherController {

	private static final Logger logger = LoggerFactory.getLogger(WeatherController.class);
	
	@GetMapping("weather")
	public String weather() {
		return "weather/weather2";
	}
	
}
