package com.sh.service;

import java.util.List;

import com.sh.domain.BoardAttachVO;
import com.sh.domain.BoardVO;
import com.sh.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
//	public List<BoardVO> getList();
	
	// 페이지 기준 값을 매개 변수로 받음
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public int getFreeTotal(Criteria cri); // 자유 게시판 총 갯수
	
	public int getStudyTotal(Criteria cri); // 공부 게시판 총 갯수
	
	public int getQnATotal(Criteria cri); // 질문 게시판 총 갯수
	
	public int getCertiTotal(Criteria cri); // 자격증 게시판 총 갯수
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
}
