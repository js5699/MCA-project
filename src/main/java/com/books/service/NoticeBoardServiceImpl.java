package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.books.domain.Criteria;
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
	public List<NoticeBoardVO> getList(Criteria cri) {
		log.info("get List with criteria : " + cri);
		return NBmapper.getListWithPaging(cri);
	}

	@Override
	public NoticeBoardVO get(Long bno) {
		log.info("get : " + bno);
		return NBmapper.read(bno);
	}

	@Override
	public void register(NoticeBoardVO NBVO) {
		log.info("register : " + NBVO);
		NBmapper.insertSelectKey(NBVO);
	}

	@Override
	public boolean modify(NoticeBoardVO NBVO) {
		log.info("modify : " + NBVO);
		return NBmapper.update(NBVO) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove : " + bno);
		return NBmapper.delete(bno) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return NBmapper.getTotalCount(cri);

	}

}
