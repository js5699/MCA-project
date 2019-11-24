package com.books.service;

import java.util.List;

import com.books.domain.NoticeBoardVO;

public interface NoticeBoardService {

	public List<NoticeBoardVO> getList();
	
	public NoticeBoardVO get(Long bno);
}
