package com.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;
import com.books.domain.UserVO;

public interface AdminOrderMapper {

	// 주문이 있는 회원의 총 수
	public int getHasOrderCount(Criteria cri);
	
	// 최근 주문이 있는 회원의 리스트+페이징
	public List<OrderVO> getLatestOrderListWithPaging(Criteria cri);
	
	// 회원 개인 주문내역 
	public OrderVO getUserOrderDetail(String orderid);
	
	// 회원 정보
	public UserVO getUserInformation(String userid);
	
	// 회원 개인 주문 상세내역 수정
	public int modifyUserOrder(OrderVO order);
	
}
