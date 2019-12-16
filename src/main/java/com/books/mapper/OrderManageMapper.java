package com.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;

public interface OrderManageMapper {
	
	// 회원 개인 주문내역 카운트
	public int getUserOrderCount(String userid);
	
	// 회원 개인 주문내역 리스트+페이징
	public List<OrderVO> getUserOrderListWithPaging(@Param("userid") String userid, @Param("cri") Criteria cri);

	
	// 회원 개인 주문내역 상세 - 상품 수 카운트
	public int getUserOrderItemsCount(String orderid);
	
	// 회원 개인 주문 상세내역 리스트+페이지
	public List<OrderDetailVO> getUserOrderItemsListWithPaging(@Param("orderid") String orderid, @Param("cri") Criteria cri);
	
}
