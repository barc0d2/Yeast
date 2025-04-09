package com.kh.yeast;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class YeastApplication {

	public static void main(String[] args) {
		SpringApplication.run(YeastApplication.class, args);
	}

}
