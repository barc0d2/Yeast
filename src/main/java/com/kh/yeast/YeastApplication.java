package com.kh.yeast;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.kh.yeast.mappers")
public class YeastApplication {

	public static void main(String[] args) {

		SpringApplication.run(YeastApplication.class, args);
	}

}
