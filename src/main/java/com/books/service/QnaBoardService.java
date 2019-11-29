package com.books.service;

import java.util.List;

import com.books.domain.QnaBoardVO;
import com.books.domain.Criteria;

public interface QnaBoardService {
public void register(QnaBoardVO board);
	
	public QnaBoardVO get(Long bno);
	
	public boolean modify(QnaBoardVO board);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList();
	
	public List<QnaBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

}
