package com.skilldistillery.upstream;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("com.skilldistillery.upstream.entities")
public class UpStreamApplication {

	public static void main(String[] args) {
		SpringApplication.run(UpStreamApplication.class, args);
	}

}
