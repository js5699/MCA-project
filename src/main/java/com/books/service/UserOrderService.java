package com.books.service;

import java.util.List;

import com.books.domain.CartVO;
import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;

public interface UserOrderService {
	
	public List<OrderVO> getList(String userid, Criteria cri);//ì£¼ë¬¸ëª©ë¡+?˜?´ì§?
	
	public void insertorder(OrderVO order);//?šŒ?›ì£¼ë¬¸
	
	public void insertorderDetail(OrderDetailVO orderDetail);//?šŒ?›ì£¼ë¬¸-?ƒ?„¸
	
	public OrderVO get(String orderid);//ì£¼ë¬¸?ƒ?„¸ì¡°íšŒ-?ˆ˜? ¹?? •ë³?
	
	public List<OrderDetailVO> orderView(String orderid);//ì£¼ë¬¸?ƒ?„¸ì¡°íšŒ-ì±…ëª©ë¡?
	
	public boolean modify(OrderVO order);//ì£¼ë¬¸?ˆ˜? •
	
	public int getTotal(Criteria cri);//? „ì²´ë°?´?„° ê°œìˆ˜
	
	//dy
	public List<CartVO> getCheckedCartList(String[] cartIdx); //ì£¼ë¬¸?˜?´ì§??— ì¹´íŠ¸ëª©ë¡ê°?? ¸?˜¤ê¸?
}
