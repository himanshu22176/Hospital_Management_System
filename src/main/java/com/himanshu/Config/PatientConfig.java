package com.himanshu.Config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@ComponentScan(basePackages = {"com.himanshu.Controller", "com.himanshu.Entity" , "com.himanshu.Util", "com.himanshu.Repo"})
public class PatientConfig {

	
	
}
