package com.books.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailPageDTO;
import com.books.domain.OrderPageDTO;
import com.books.mapper.OrderManageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class OrderManageServiceImpl implements OrderManageService {
	
	@Setter(onMethod_ = @Autowired) 
	private OrderManageMapper mapper;

	@Override
	public OrderPageDTO getUserOrderListPage(String userid, Criteria cri) {

		return new OrderPageDTO(mapper.getUserOrderCount(userid),
								mapper.getUserOrderListWithPaging(userid, cri));
	}

	@Override
	public OrderDetailPageDTO getUserOrderItemsListPage(String orderid, Criteria cri) {
		
		return new OrderDetailPageDTO(mapper.getUserOrderItemsCount(orderid),
				  					  mapper.getUserOrderItemsListWithPaging(orderid, cri));
	}

}
