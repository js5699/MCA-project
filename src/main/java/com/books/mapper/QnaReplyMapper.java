package com.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.books.domain.Criteria;
import com.books.domain.QnaReplyVO;

public interface QnaReplyMapper {
public int insert(QnaReplyVO vo);
	
	public QnaReplyVO read(Long bno);
	
	public int delete(Long rno);
	
	public int update(QnaReplyVO reply);
	
	public List<QnaReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	public int getCountByBno(Long bno);
}
