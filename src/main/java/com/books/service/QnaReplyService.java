package com.books.service;

import java.util.List;

import com.books.domain.Criteria;
import com.books.domain.QnaReplyPageDTO;
import com.books.domain.QnaReplyVO;

public interface QnaReplyService {
	public int register(QnaReplyVO vo);
	
	public QnaReplyVO get(Long rno);
	
	public int modify(QnaReplyVO vo);
	
	public int remove(Long rno);
	
	public List<QnaReplyVO> getList(Criteria cri, Long bno);
	
	public QnaReplyPageDTO getListPage(Criteria cri, Long bno);
}
