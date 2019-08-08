package com.cafe24.config.web;

import java.util.Properties;

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CDNConfig {
	
	private final String CDN_URL= "http://localhost:8090/shoppingmall-cdn";
	
	@Bean
	public PropertiesFactoryBean propertyConfigurer() {
		PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
		
		Properties properties = new Properties();
		properties.setProperty("cdnUrl", CDN_URL);
		propertiesFactoryBean.setProperties(properties);
		
		return propertiesFactoryBean;
	}

}
