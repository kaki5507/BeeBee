package com.sh.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { // 검색의 기준 클래스

	private int pageNum;
	private int amount;
	
	// 검색을 위한 type(작성자,글 내용,제목)과 keyword추가
	private String type;
	private String keyword;
	
	// 생성자를 이용해서 1~10개 처리
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// 검색 조건 배열
	public String[] getTypeArr(){
		return type == null? new String[] {}: type.split("");
	}
	
}
