package com.books.service;

import java.util.List;

import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;

public interface UserOrderService {
	
	public List<OrderVO> getList(String userid);//주문목록
	
	public void insertorder(OrderVO order);//회원주문
	
	public OrderVO get(String orderid);//주문상세조회-수령자정보
	
	public List<OrderDetailVO> orderView(String orderid);//주문상세조회-책목록
	
	public boolean modify(OrderVO order);//주문수정
}
