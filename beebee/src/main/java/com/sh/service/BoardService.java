package com.sh.service;

import java.util.List;

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
}
