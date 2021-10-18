package com.sh.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { // �˻��� ���� Ŭ����

	private int pageNum;
	private int amount;
	
	// �˻��� ���� type(�ۼ���,�� ����,����)�� keyword�߰�
	private String type;
	private String keyword;
	
	// �����ڸ� �̿��ؼ� 1~10�� ó��
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// �˻� ���� �迭
	public String[] getTypeArr(){
		return type == null? new String[] {}: type.split("");
	}
	
}
