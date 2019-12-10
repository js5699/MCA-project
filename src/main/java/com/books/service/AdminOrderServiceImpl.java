package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;
import com.books.domain.UserVO;
import com.books.mapper.AdminOrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminOrderServiceImpl implements AdminOrderService {
	
	private AdminOrderMapper mapper;
	
	@Override
	public int getHasOrderCount(Criteria cri) {
		int count = mapper.getHasOrderCount(cri);
		log.info("주문이 있는 회원 수 " + count);
		return count;
	}

	@Override
	public List<OrderVO> getLatestOrderListWithPaging(Criteria cri) {
		List<OrderVO> list = mapper.getLatestOrderListWithPaging(cri);
		log.info("주문 리스트 " + list);
		return list;
	}

	@Override
	public int getUserOrderCount(String userid) {

		return mapper.getUserOrderCount(userid);
	}

	@Override
	public List<OrderVO> getUserOrderListWithPaging(String userid, Criteria cri) {

		return mapper.getUserOrderListWithPaging(userid, cri);
	}
	
	@Override
	public OrderVO getUserOrderDetail(String orderid) {

		return mapper.getUserOrderDetail(orderid);
	}

	@Override
	public int getUserOrderItemsCount(String orderid, Criteria cri) {
		
		return mapper.getUserOrderItemsCount(orderid, cri);
	}
	
	@Override
	public List<OrderDetailVO> getUserOrderItemsListWithPaging(String orderid, Criteria cri) {

		return mapper.getUserOrderItemsListWithPaging(orderid, cri);
	}

	@Override
	public boolean modUserOrder(OrderDetailVO orderDetail) {
		
		return mapper.modifyUserOrder(orderDetail) == 1;
	}

	@Override
	public UserVO getUserInformation(String userid) {
		return mapper.getUserInformation(userid);
	}

	



}
