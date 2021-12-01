package com.sh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sh.domain.BoomDownDTO;
import com.sh.domain.BoomUpDTO;
import com.sh.domain.Criteria;
import com.sh.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO reply);

	public ReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") long bno);
	
	public int getCountByBno(Long bno);
	
	public int boomUp(Long rno);
	
	public int boomUpInsert(BoomUpDTO boomUp);
	
	public BoomUpDTO readBoomUp(Long rno);
	
	public int boomDown(Long rno);
	
	public int boomDownInsert(BoomDownDTO boomDown);
	
	public BoomDownDTO readBoomDown(Long rno);
	
}
