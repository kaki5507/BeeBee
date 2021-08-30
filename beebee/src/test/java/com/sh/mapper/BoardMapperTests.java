package com.sh.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sh.domain.BoardVO;
import com.sh.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.net.ano.Service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	/*
	@Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("���� �ۼ��ϴ� ��");
		board.setContent("���� �ۼ��ϴ� ����");
		board.setWriter("newbie");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		
		BoardVO board = new BoardVO();
		board.setTitle("���� �ۼ��ϴ� �� select key");
		board.setContent("���� �ۼ��ϴ� ���� select key");
		board.setWriter("newbie");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(1L);
		
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT :" + mapper.delete(2L));
	}
	*/
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(2L);
		board.setTitle("������ ����");
		board.setContent("������ ����");
		board.setWriter("user000");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT : " + count);
	}
	
}
