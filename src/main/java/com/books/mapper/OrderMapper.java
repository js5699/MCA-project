package com.books.mapper;

import java.util.List;

import com.books.domain.CartVO;
import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;

public interface OrderMapper {
	public List<OrderVO> getList(String userid);//주문목록
	
	public List<OrderVO> getListWithPaging(Criteria cri);//페이징처리
	
	public int getTotalCount(Criteria cri);//전체 데이터 개수처리
	
	public void insertOrder(OrderVO order);//회원주문
	
	public void insertOrderDetail(OrderDetailVO orderDetail);//회원주문-상세

	public OrderVO dNameInfo(String orderid);//주문상세조회-수령자정보
	
	public List<OrderDetailVO> orderDetailList(String orderid);//주문상세조회-책목록
	
	public int update(OrderVO order);//주문수정
	
	// @admin Oder
	public int getUserOderTotalCount(String userid, Criteria cri);

	public List<OrderVO> getUserOderList(Criteria cri);
	
	
	//dy
	public List<CartVO> getCheckedCartItems(String[] cartIdx);

}