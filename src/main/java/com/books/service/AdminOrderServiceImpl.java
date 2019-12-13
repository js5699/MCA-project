package com.books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderPageDTO;
import com.books.domain.OrderVO;
import com.books.mapper.OrderManageMapper;
import com.books.mapper.AdminOrderMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Setter(onMethod_ = @Autowired) 
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
	public OrderVO getUserOrderDetail(String orderid) {
		log.warn("주문 정보 service : " + orderid);
		return mapper.getUserOrderDetail(orderid);
	}

	@Override
	public boolean modUserOrder(OrderDetailVO orderDetail) {
		
		return mapper.modifyUserOrder(orderDetail) == 1;
	}

}
