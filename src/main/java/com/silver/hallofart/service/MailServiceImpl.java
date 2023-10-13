package com.silver.hallofart.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface MailServiceImpl {

	// 메일 내용 작성
	MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException;
	
	// 임시 비밀번호 발송 내용 작성
	MimeMessage createTempPassMessage(String to) throws MessagingException, UnsupportedEncodingException;

	// 랜덤 인증 코드 전송
	String createKey();

	// 메일 발송
	String sendSimpleMessage(String to) throws Exception;

	// 임시 비밀번호 발송
	String sendTempPassword(String to) throws Exception;


	
	
	
}