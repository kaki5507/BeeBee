package com.sh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sh.domain.BoardVO;
import com.sh.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public BoardVO readCategory(Long bno,String category);
	
	public int delete(Long bno);
	
	public int deleteForeignKey(Long bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public int getStudyTotalCount(Criteria cri); // °øºÎ ÀÎÁõ °Ô½ÃÆÇ ÃÑ °¹¼ö
	
	public int getFreeTotalCount(Criteria cri); // ÀÚÀ¯ °Ô½ÃÆÇ ÃÑ °¹¼ö
	
	public int getQnATotalCount(Criteria cri); // Áú¹® °Ô½ÃÆÇ ÃÑ °¹¼ö
	
	public int getCertiTotalCount(Criteria cri); // ÀÚ°ÝÁõ °Ô½ÃÆÇ ÃÑ °¹¼ö
	
	public void updateReplyCnt(@Param("bno") Long bno,@Param("amount") int amount);
	
	public void updateBoardHit(long bno);
	
}
