package com.sh.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage; // 페이지에서 보여지는 시작 번호
	private int endPage; // 페이지에서 보여지는 끝 번호
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		// 마지막 페이지는 cri에서 페이지를 가져와서 ceil 올림을 해준다
		// 73을 가져오면 80의 페이지 까지 보여줘야 하기 때문
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		// 진짜 끝 페이지가 구해둔 끝 번호 보다 작으면
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev= this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
}
