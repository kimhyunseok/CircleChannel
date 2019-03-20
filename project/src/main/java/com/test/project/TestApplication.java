package com.test.project;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TestApplication {
	private static Logger logger = LogManager.getLogger(TestApplication.class);

	public static void main(String[] args) {
		logger.info("Starting Spring Boot application..");
		SpringApplication app = new SpringApplication(TestApplication.class);
		app.run(args);
	}
	
}
