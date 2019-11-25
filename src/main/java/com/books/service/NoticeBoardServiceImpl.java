package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.NoticeBoardVO;
import com.books.mapper.NoticeBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService{

	private NoticeBoardMapper NBmapper;
	
	@Override
	public List<NoticeBoardVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeBoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

}
