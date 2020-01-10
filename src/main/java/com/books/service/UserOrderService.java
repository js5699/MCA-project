package com.books.service;

import java.util.List;

import com.books.domain.CartVO;
import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;

public interface UserOrderService {
	
	public List<OrderVO> getList(String userid, Criteria cri);//주문목록+?��?���?
	
	public void insertorder(OrderVO order);//?��?��주문
	
	public void insertorderDetail(OrderDetailVO orderDetail);//?��?��주문-?��?��
	
	public OrderVO get(String orderid);//주문?��?��조회-?��?��?��?���?
	
	public List<OrderDetailVO> orderView(String orderid);//주문?��?��조회-책목�?
	
	public boolean modify(OrderVO order);//주문?��?��
	
	public int getTotal(Criteria cri);//?��체데?��?�� 개수
	
	//dy
	public List<CartVO> getCheckedCartList(String[] cartIdx); //주문?��?���??�� 카트목록�??��?���?
}
