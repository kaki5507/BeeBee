package com.sh.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoomDownDTO {

	private int replyBoomDown;
	private String recommender;
	private Date boomDate;
	
	private Long rno;
}
