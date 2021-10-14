package com.sh.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage; // ���������� �������� ���� ��ȣ
	private int endPage; // ���������� �������� �� ��ȣ
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		// ������ �������� cri���� �������� �����ͼ� ceil �ø��� ���ش�
		// 73�� �������� 80�� ������ ���� ������� �ϱ� ����
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		// ��¥ �� �������� ���ص� �� ��ȣ ���� ������
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev= this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
}
