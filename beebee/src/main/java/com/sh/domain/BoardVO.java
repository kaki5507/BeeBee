package com.sh.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno; //게시 번호
	private String title; //제목
	private String content; //내용
	private String writer; //작성자
	private Date regdate; //작성일
	private Date updateDate; //수정일
	private int hit; // 조회수
	private String category; // 게시판 종류
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
}
