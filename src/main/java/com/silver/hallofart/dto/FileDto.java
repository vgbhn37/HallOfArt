package com.silver.hallofart.dto;

import java.util.UUID;

import lombok.Data;

@Data
public class FileDto {
	private String fileName;
	private String contentType;
	
	public FileDto(String fileName, String contentType) {
		this.fileName = UUID.randomUUID()+"_"+fileName;
		this.contentType = contentType;
	}
}
