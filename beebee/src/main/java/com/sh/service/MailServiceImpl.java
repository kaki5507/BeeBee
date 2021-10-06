package com.sh.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;


public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender; 
	}

	@Override
	public boolean send(String subject, String text, String from, String to) {
		
		MimeMessage message = javaMailSender.createMimeMessage();

		 try {
		
			 MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8"); 
			 helper.setSubject(subject); 
			 helper.setText(text, true); 
			 helper.setFrom(from); 
			 helper.setTo(to);
			
			 javaMailSender.send(message); 
			 return true;
		 } catch (MessagingException e) {
			 e.printStackTrace();
		 }

		return false;
	}
	
}
