package com.books.service;

import java.util.List;

import com.books.domain.Criteria;
import com.books.domain.OrderVO;

public interface AdminOrderService {

	// 회원 전체 주문내역 카운트 for 페이징
	public int getTotal(Criteria cri);

	// 회원 전체 주문내역
	public List<OrderVO> getList(Criteria cri);

	// 회원A 주문내역 카운트 for 페이징
	public int getUserOrderTotal(String userid, Criteria cri);

	// 회원A 주문내역
	public List<OrderVO> getUserOrderList(Criteria cri, String userid);

	// 회원A 주문 상세내역
	public OrderVO get(String userid);

	// 주문 상태 처리
	public boolean modify(OrderVO order);

}
