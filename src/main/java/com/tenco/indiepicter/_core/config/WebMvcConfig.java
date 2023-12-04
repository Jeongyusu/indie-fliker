package com.tenco.indiepicter._core.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
//	@Autowired
//	private AuthInterceptor authInterceptor;
//
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		// TODO Auto-generated method stub
//		registry.addInterceptor(authInterceptor)
//				.addPathPatterns("/account/**")
//				.addPathPatterns("/auth/**");
//	}
	
	//리소스 등록처리
	//서버 컴퓨터에 위치한 Resource를 활용하는 방법(프로젝트 외부 폴더 접근)
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/uploads/**")
		.addResourceLocations("file:///C:\\spring_upload\\indiepictor\\upload/");
	}
	
	@Bean // IOC 관리대상 처리 - 싱글톤
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
}