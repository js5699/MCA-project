package com.books.mapper;

import java.util.List;


import com.books.domain.OrderVO;

public interface OrderMapper {
	public List<OrderVO> getList(String userid);//주문목록
	
	public void insertSelectKey(OrderVO order);//회원주문

	public OrderVO read(String orderid);//주문상세조회
	
	public int update(OrderVO order);//주문수정
	
}
