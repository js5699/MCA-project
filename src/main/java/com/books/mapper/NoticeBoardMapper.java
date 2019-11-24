package com.books.mapper;

import java.util.List;

import com.books.domain.NoticeBoardVO;

public interface NoticeBoardMapper {

	public List<NoticeBoardVO> getList();
	
	public List<NoticeBoardVO> getListWithPaging();
}
