package com.silver.hallofart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class HallOfArtApplication {

	public static void main(String[] args) {
		SpringApplication.run(HallOfArtApplication.class, args);
	}

}
