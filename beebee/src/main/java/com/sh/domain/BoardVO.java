package com.sh.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno; //�Խ� ��ȣ
	private String title; //����
	private String content; //����
	private String writer; //�ۼ���
	private Date regdate; //�ۼ���
	private Date updateDate; //������
	private int hit; // ��ȸ��
	private String category; // �Խ��� ����
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
}
