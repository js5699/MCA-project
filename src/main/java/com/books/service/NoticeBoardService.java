package com.books.service;

import java.util.List;

import com.books.domain.Criteria;
import com.books.domain.NoticeBoardVO;

public interface NoticeBoardService {

	public List<NoticeBoardVO> getList(Criteria cri);
	
	public NoticeBoardVO get(Long bno);
	
	public void register(NoticeBoardVO NBVO);
	
	public boolean modify(NoticeBoardVO NBVO);
	
	public boolean remove(Long bno);
	
	public int getTotal(Criteria cri);

}
