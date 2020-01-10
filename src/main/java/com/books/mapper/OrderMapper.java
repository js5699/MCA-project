package com.books.mapper;

import java.util.List;

import com.books.domain.CartVO;
import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;

public interface OrderMapper {
	public List<OrderVO> getList(String userid);//ì£¼ë¬¸ëª©ë¡
	
	public List<OrderVO> getListWithPaging(Criteria cri);//?˜?´ì§•ì²˜ë¦?
	
	public int getTotalCount(Criteria cri);//? „ì²? ?°?´?„° ê°œìˆ˜ì²˜ë¦¬
	
	public void insertOrder(OrderVO order);//?šŒ?›ì£¼ë¬¸
	
	public void insertOrderDetail(OrderDetailVO orderDetail);//?šŒ?›ì£¼ë¬¸-?ƒ?„¸

	public OrderVO dNameInfo(String orderid);//ì£¼ë¬¸?ƒ?„¸ì¡°íšŒ-?ˆ˜? ¹?? •ë³?
	
	public List<OrderDetailVO> orderDetailList(String orderid);//ì£¼ë¬¸?ƒ?„¸ì¡°íšŒ-ì±…ëª©ë¡?
	
	public int update(OrderVO order);//ì£¼ë¬¸?ˆ˜? •
	
	// @admin Oder
	public int getUserOderTotalCount(String userid, Criteria cri);

	public List<OrderVO> getUserOderList(Criteria cri);
	
	
	//dy
	public List<CartVO> getCheckedCartItems(String[] cartIdx);

}