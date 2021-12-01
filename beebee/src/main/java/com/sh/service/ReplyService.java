package com.sh.service;

import java.util.List;

import com.sh.domain.BoomUpDTO;
import com.sh.domain.Criteria;
import com.sh.domain.ReplyPageDTO;
import com.sh.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO reply);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO reply);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	
	public int boomUp(Long rno);
	
	public int boomUpRegister(BoomUpDTO boomUp);
}
