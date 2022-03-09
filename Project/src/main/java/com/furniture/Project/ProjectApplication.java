package com.furniture.Project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

import utilites.HibernateUtil;
//import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class ProjectApplication {

	public static void main(String[] args) {
//		ConfigurableApplicationContext context= 
				SpringApplication.run(ProjectApplication.class, args);
		HibernateUtil.getSessionFactory();
	}
}
