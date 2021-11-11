package com.sh.mapper;

import java.util.List;

import com.sh.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachMapper vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Long bno);
}
