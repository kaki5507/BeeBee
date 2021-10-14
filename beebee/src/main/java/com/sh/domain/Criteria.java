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
	
	// �����ڸ� �̿��ؼ� 1~10�� ó��
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}
