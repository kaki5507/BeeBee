package com.sh.service;

public interface MailService {
	
	public boolean send(String subject, String text, String from, String to);
}
