package com.sh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.domain.BoomUpDTO;
import com.sh.domain.Criteria;
import com.sh.domain.ReplyPageDTO;
import com.sh.domain.ReplyVO;
import com.sh.mapper.BoardMapper;
import com.sh.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO reply) {
		log.info("reply register....");
		
		boardMapper.updateReplyCnt(reply.getBno(), 1);
		
		return mapper.insert(reply);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("reply get .....");
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		log.info("reply modify .....");
		return mapper.update(reply);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		
		log.info("reply remove..." + rno);
		
		ReplyVO vo = mapper.read(rno);
		// 댓글 삭제하면 그값 bno찾아서 -1 시켜줘야함
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		
		log.info("get Reply List board cri : " + cri + " bno : " + bno );
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}
	
	
	@Override
	public int boomUpRegister(BoomUpDTO boomUp) {
		log.info("boom Service register....");
		
		return mapper.boomUpInsert(boomUp);
	}
	
	@Override
	public int boomUp(Long rno) {
		log.info("boomUp........." + rno);
		return mapper.boomUp(rno);
	}


}
