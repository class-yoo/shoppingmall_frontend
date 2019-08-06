package com.cafe24.shoppingmall.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import com.cafe24.config.app.AppSecurityConfig;
import com.cafe24.config.app.RestTemplateConfig;

@Configuration
@EnableAspectJAutoProxy
@ComponentScan({ "com.cafe24.shoppingmall.security", "com.cafe24.shoppingmall.service",
		"com.cafe24.shoppingmall.repository"})
@Import({ AppSecurityConfig.class, RestTemplateConfig.class })
public class AppConfig {
}