package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailPageDTO;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;
import com.books.mapper.AdminOrderMapper;
import com.books.mapper.AdminUserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminOrderServiceImpl implements AdminOrderService {

	private AdminOrderMapper mapper;
	
	@Override
	public int getHasOrderCount(Criteria cri) {

		return mapper.getHasOrderCount(cri);
		
	}

	@Override
	public List<OrderVO> getLatestOrderListWithPaging(Criteria cri) {
		
		return mapper.getLatestOrderListWithPaging(cri);
		
	}

	@Override
	public OrderVO getUserOrderDetail(String orderid) {
		log.info("주문 정보 service : " + orderid);
		return mapper.getUserOrderDetail(orderid);
	}

	@Override
	public boolean modUserOrder(OrderVO order) {
		return mapper.modifyUserOrder(order) == 1;
	}
	
	@Override
	public OrderDetailPageDTO getUserOrderItemsListPage(String orderid, Criteria cri) {
		
		return new OrderDetailPageDTO(mapper.getUserOrderItemsCount(orderid),
				  					  mapper.getUserOrderItemsListWithPaging(orderid, cri));
	}

}
