package kr.or.ddit.smartware.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import kr.or.ddit.smartware.interceptor.PerformanceCheckInterceptor;
import kr.or.ddit.smartware.interceptor.SessionCheckInterceptor;

@Configuration
@EnableWebMvc
public class InterceptorConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 세션 사원 체크 interceptor
		registry.addInterceptor(new SessionCheckInterceptor()).addPathPatterns("/**")
															  .excludePathPatterns("/login")
															  .excludePathPatterns("/css/**")
															  .excludePathPatterns("/js/**")
															  .excludePathPatterns("/bootstrap/**")
															  .excludePathPatterns("/error/**");
		
		// 작동시간 interceptor
		registry.addInterceptor(new PerformanceCheckInterceptor()).addPathPatterns("/**");
		
		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		localeChangeInterceptor.setParamName("language");
		registry.addInterceptor(localeChangeInterceptor)
				.addPathPatterns("/**")
				.excludePathPatterns("/login")
				.excludePathPatterns("/css/**")
				.excludePathPatterns("/js/**")
				.excludePathPatterns("/bootstrap/**")
				.excludePathPatterns("/error/**");
	}
}
