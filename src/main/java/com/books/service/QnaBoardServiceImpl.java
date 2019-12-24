package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.books.domain.QnaBoardVO;
import com.books.domain.Criteria;
import com.books.mapper.QnaBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaBoardServiceImpl implements QnaBoardService{
	private QnaBoardMapper mapper;

	@Override
	public void register(QnaBoardVO board) {
		// TODO Auto-generated method stub
		log.info("register........." + board);
		
		mapper.insertSelectKey(board);
	}

	@Override
	public QnaBoardVO get(Long bno) {
		// TODO Auto-generated method stub
		log.info("get........." + bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(QnaBoardVO board) {
		// TODO Auto-generated method stub
		log.info("modify.........." + board);
		
		return mapper.update(board) ==1 ;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		log.info("remove.........." + bno);
		return mapper.delete(bno)==1;
	}

	@Override
	public List<QnaBoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("get List with citeria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {		
		// TODO Auto-generated method stub
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
}
