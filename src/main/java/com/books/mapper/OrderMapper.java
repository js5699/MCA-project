package com.books.mapper;

import java.util.List;

import com.books.domain.CartVO;
import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;

public interface OrderMapper {
	public List<OrderVO> getList(String userid);//주문목록
	
	public List<OrderVO> getListWithPaging(Criteria cri);//?��?��징처�?
	
	public int getTotalCount(Criteria cri);//?���? ?��?��?�� 개수처리
	
	public void insertOrder(OrderVO order);//?��?��주문
	
	public void insertOrderDetail(OrderDetailVO orderDetail);//?��?��주문-?��?��

	public OrderVO dNameInfo(String orderid);//주문?��?��조회-?��?��?��?���?
	
	public List<OrderDetailVO> orderDetailList(String orderid);//주문?��?��조회-책목�?
	
	public int update(OrderVO order);//주문?��?��
	
	// @admin Oder
	public int getUserOderTotalCount(String userid, Criteria cri);

	public List<OrderVO> getUserOderList(Criteria cri);
	
	
	//dy
	public List<CartVO> getCheckedCartItems(String[] cartIdx);

}