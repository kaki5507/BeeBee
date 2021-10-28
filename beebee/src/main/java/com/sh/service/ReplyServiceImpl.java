package com.sh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.domain.Criteria;
import com.sh.domain.ReplyPageDTO;
import com.sh.domain.ReplyVO;
import com.sh.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO reply) {
		log.info("reply register....");
		
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

	@Override
	public int remove(Long rno) {
		log.info("reply remove...");
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

}
