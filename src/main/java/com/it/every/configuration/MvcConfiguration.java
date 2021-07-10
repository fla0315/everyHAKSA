package com.it.every.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		/*
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/shop/cart/*", "/shop/order/*","/member/memberEdit","/member/memberOut");
		*/
		
		/*
		registry.addInterceptor(new AdminLoginInterceptor())
		.excludePathPatterns("/admin/login/adminLogin") //�����Ҳ� �̰� �ȳ����� ��� ��海��
		.addPathPatterns("/admin/**"); //�߰��� ���� **�� ���ؼ� �� �ִ´�
		*/
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
			= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // ���� ���ڵ� ����
		multipartResolver.setMaxUploadSizePerFile(2 * 1024 * 1024); // ���ϴ� ���ε� ũ�� ���� (5MB)
		
		
		return multipartResolver;
	}
	
}
