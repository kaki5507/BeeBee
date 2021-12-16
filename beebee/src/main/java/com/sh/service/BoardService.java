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
	
	// ������ ���� ���� �Ű� ������ ����
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public int getFreeTotal(Criteria cri); // ���� �Խ��� �� ����
	
	public int getStudyTotal(Criteria cri); // ���� �Խ��� �� ����
	
	public int getQnATotal(Criteria cri); // ���� �Խ��� �� ����
	
	public int getCertiTotal(Criteria cri); // �ڰ��� �Խ��� �� ����
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
}
