package com.books.service;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailPageDTO;
import com.books.domain.OrderPageDTO;

public interface OrderManageService {

	// 회원 개인 주문내역 리스트+페이징
	public OrderPageDTO getUserOrderListPage(String userid, Criteria cri);
	
	// 회원 개인 주문 상세내역 리스트+페이지
	public OrderDetailPageDTO getUserOrderItemsListPage(String orderid, Criteria cri);
	
}
