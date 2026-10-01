package com.himanshu.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class OtpService {
	
	@Autowired
	private JavaMailSender jms;
	
	public void sentOtpEmail(String email, String otp) {
		SimpleMailMessage mes= new SimpleMailMessage();
		mes.setTo(email);
		mes.setSubject("Your OTP is Code For Signing in HMS");
		mes.setText("Your OTP is "+otp);
		jms.send(mes);
		
	}
	
	public void sendAcceptanceMail(String email) {
		SimpleMailMessage mes= new SimpleMailMessage();
		mes.setTo(email);
		mes.setSubject("Status on your Request At HMS");
		mes.setText("Congratulations. You have been selected as a Doctor in our Hospital. Welcome On board.");
		jms.send(mes);
	}
	
	public void sendRejectionMail(String email) {
		SimpleMailMessage mes= new SimpleMailMessage();
		mes.setTo(email);
		mes.setSubject("Status on your Request At HMS");
		mes.setText("We are sorry to inform that you dont meet our Hospital Criteria. Thank You.");
		jms.send(mes);
	}
	
	public void sendTerminationMail(String email) {
		SimpleMailMessage mes= new SimpleMailMessage();
		mes.setTo(email);
		mes.setSubject("Important Update");
		mes.setText("We no long require your services. We have to let you go. Thank You.");
		jms.send(mes);
	}
	
}
