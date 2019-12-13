package com.books.service;

import java.util.List;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderPageDTO;
import com.books.domain.OrderVO;

public interface AdminOrderService {

	// 주문이 있는 회원의 총 수
	public int getHasOrderCount(Criteria cri);
	
	// 최근 주문이 있는 회원의 리스트+페이징
	public List<OrderVO> getLatestOrderListWithPaging(Criteria cri);
	
	// 회원 개인 주문내역 
	public OrderVO getUserOrderDetail(String orderid);
	
	// 회원 개인 주문 상세내역 수정
	public boolean modUserOrder(OrderDetailVO orderDetail);
	
}
