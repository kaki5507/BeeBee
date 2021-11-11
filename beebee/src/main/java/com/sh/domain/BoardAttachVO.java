package com.sh.domain;

import lombok.Data;

@Data
public class BoardAttachVO {
	
	private String uuid;
	private String fileName;
	private String uploadPath;
	private boolean image;
	
	private long bno;
	
}
