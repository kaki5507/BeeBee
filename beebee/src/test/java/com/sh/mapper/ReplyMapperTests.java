package com.sh.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sh.domain.Criteria;
import com.sh.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	
	// 매퍼 테스트
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	private Long[] bnoArr = {512L,511L,510L,509L,507L};
	
	/*
	// 댓글 만들어지는지 테스트
	@Test
	public void testCreate() {
		// 10개의 반복문을 돌림
		IntStream.rangeClosed(1, 10).forEach(i -> {
			
			ReplyVO reply = new ReplyVO();
			
			reply.setBno(bnoArr[i % 5]);
			reply.setReply("댓글 테스트 " + i);
			reply.setReplyer("replyer " + i);
			
			mapper.insert(reply);
		});
	}
	
	
	@Test
	public void testRead() {
		
		ReplyVO reply = mapper.read(1L);
		
		log.info(reply);
		
	}
	
	
	@Test
	public void testDelete() {
		mapper.delete(3L);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO reply = mapper.read(2L);
		
		reply.setReply("Update Reply");
		
		int count = mapper.update(reply);
		
		log.info("UPDATE COUNT : " + count);
	}
	
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 512L);
		
		replies.forEach(reply -> log.info(reply));
	}
	*/
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2, 10);
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 512L);
		
		replies.forEach(reply -> log.info(reply));
	}
}
