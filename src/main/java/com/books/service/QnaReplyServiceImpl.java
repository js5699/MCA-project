package com.books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.books.service.QnaReplyServiceImpl;

import com.books.domain.Criteria;
import com.books.domain.QnaReplyPageDTO;
import com.books.domain.QnaReplyVO;
import com.books.mapper.QnaBoardMapper;
import com.books.mapper.QnaReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnaReplyServiceImpl implements QnaReplyService{
	@Setter(onMethod_ =@Autowired)
	private QnaReplyMapper mapper;
	
	@Setter(onMethod_ =@Autowired)
	private QnaBoardMapper boardMapper;

	@Override
	public int register(QnaReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("Qnaregister....." + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public QnaReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		
		log.info("get......" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(QnaReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify....." + vo);
		return mapper.update(vo);
	}
	@Transactional
	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		
		log.info("remove....." + rno);
		
		QnaReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<QnaReplyVO> getList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		
		log.info("get Reply List of a Board" + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public QnaReplyPageDTO getListPage(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		
		return new QnaReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}
	

}
