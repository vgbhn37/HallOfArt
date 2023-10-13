package com.silver.hallofart.service;

import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class SmsService {
final DefaultMessageService messageService;
    
	// 생성자 (  API KEY 세팅  )
    public SmsService() {    	
    	this.messageService = NurigoApp.INSTANCE.initialize("NCSU9REBQATNWXUZ", "S1XHDZDMLFWVTA1F2IYDHVWSDMACNXJY", "https://api.coolsms.co.kr");
    }
	
    // 단일 문자 발송 
    public int send(String to) {
    	int certificationNumber = (int) (Math.random() * 99999) + 10000; // ==> 인증번호
        Message message = new Message();
        message.setFrom("010-4061-8333");
        
        message.setTo( to.replace("-", "") );
        message.setText("[예술의 전당 테스트] 본인 인증 번호를 입력해주시기 바랍니다 :  "+ certificationNumber );
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        
        return certificationNumber;
    }
    
    public String sendTempPassword(String to) {
    	String certificationNumber = String.valueOf((int) (Math.random() * 99999) + 10000); // ==> 인증번호
        Message message = new Message();
        message.setFrom("010-4061-8333");
        
        message.setTo( to.replace("-", "") );
        message.setText("[예술의 전당 테스트] 회원님의 임시 비밀번호를 보내드립니다. :  "+ certificationNumber );
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        
        return certificationNumber;
    }
}
