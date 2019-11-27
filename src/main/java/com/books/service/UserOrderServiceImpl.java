package com.books.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.books.domain.OrderVO;
import com.books.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class UserOrderServiceImpl implements UserOrderService{
	
	private OrderMapper mapper;
	
	@Override//회원주문
	public void insertorder(OrderVO order) {
		log.info("insert order..........................."+order);
		
		mapper.insertSelectKey(order);
	}
	
	@Override//주문목록
	public List<OrderVO> getList(String userid){
		log.info("getList..............");
		
		return mapper.getList(userid);
	}
	
	@Override//주문상세조회
	public OrderVO get(String orderid) {
		log.info("get.............."+orderid);
		
		return mapper.read(orderid);
	}
	
	@Override//주문수정
	public boolean modify(OrderVO order) {
		log.info("modify................"+order);
		
		return mapper.update(order) == 1;
	}
}
