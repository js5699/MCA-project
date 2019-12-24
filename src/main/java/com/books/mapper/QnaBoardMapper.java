package com.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.books.domain.QnaBoardVO;
import com.books.domain.Criteria;

public interface QnaBoardMapper {
public List<QnaBoardVO> getList();
	
	public List<QnaBoardVO> getListWithPaging(Criteria cri);
	
	public void insert(QnaBoardVO board);
	
	public void insertSelectKey(QnaBoardVO board);
	
	public QnaBoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(QnaBoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

}
