package com.books.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.books.domain.CartVO;
import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;
import com.books.domain.ProductVO;
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
		
		mapper.insertOrder(order);
	}
	
	@Override//회원주문-상세
	public void insertorderDetail(OrderDetailVO orderDetail) {
		log.info("insert orderDetail............."+orderDetail);
		
		mapper.insertOrderDetail(orderDetail);
	}

	@Override//주문목록+페이징
	public List<OrderVO> getList(String userid, Criteria cri){
		log.info("getList with criteria:" + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override//주문상세조회-수령자정보
	public OrderVO get(String orderid) {
		log.info("get.............."+orderid);
		
		return mapper.dNameInfo(orderid);
	}
	
	@Override//주문상세조회-책목록
	public List<OrderDetailVO> orderView(String orderid){
		log.info("orderview.............."+orderid);
		
		return mapper.orderDetailList(orderid);
	}
	
	@Override//주문수정
	public boolean modify(OrderVO order) {
		log.info("modify................"+order);
		
		return mapper.update(order) == 1;
	}
	
	@Override//전체 데이터 개수
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);

	}

	
	//dy
	@Override //카트목록 가져오기 
	public List<CartVO> getCheckedCartList(String[] cartIdx) {
		return mapper.getCheckedCartItems(cartIdx);
	}
}