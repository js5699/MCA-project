package com.books.mapper;

import java.util.List;

import com.books.domain.Criteria;
import com.books.domain.NoticeBoardVO;

public interface NoticeBoardMapper {

	public List<NoticeBoardVO> getList();
	
	public List<NoticeBoardVO> getListWithPaging(Criteria cri);
	
	public NoticeBoardVO read(Long bno);
	
	public void insert(NoticeBoardVO NBVO);
	
	public void insertSelectKey(NoticeBoardVO NBVO);
	
	public void delete(Long bno);
	
	public void update(NoticeBoardVO NBVO);
	
	public int getTotalCount(Criteria cri);
}
