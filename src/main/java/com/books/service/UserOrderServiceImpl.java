package com.books.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.books.domain.CartVO;
import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;
import com.books.domain.ProductVO;
import com.books.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class UserOrderServiceImpl implements UserOrderService{
	
	private OrderMapper mapper;
	
	@Override//?šŒ?›ì£¼ë¬¸
	public void insertorder(OrderVO order) {
		log.info("insert order..........................."+order);
		
		mapper.insertOrder(order);
	}
	
	@Override//?šŒ?›ì£¼ë¬¸-?ƒ?„¸
	public void insertorderDetail(OrderDetailVO orderDetail) {
		log.info("insert orderDetail............."+orderDetail);
		
		mapper.insertOrderDetail(orderDetail);
	}

	@Override//ì£¼ë¬¸ëª©ë¡+?˜?´ì§?
	public List<OrderVO> getList(String userid, Criteria cri){
		log.info("getList with criteria:" + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override//ì£¼ë¬¸?ƒ?„¸ì¡°íšŒ-?ˆ˜? ¹?? •ë³?
	public OrderVO get(String orderid) {
		log.info("get.............."+orderid);
		
		return mapper.dNameInfo(orderid);
	}
	
	@Override//ì£¼ë¬¸?ƒ?„¸ì¡°íšŒ-ì±…ëª©ë¡?
	public List<OrderDetailVO> orderView(String orderid){
		log.info("orderview.............."+orderid);
		
		return mapper.orderDetailList(orderid);
	}
	
	@Override//ì£¼ë¬¸?ˆ˜? •
	public boolean modify(OrderVO order) {
		log.info("modify................"+order);
		
		return mapper.update(order) == 1;
	}
	
	@Override//? „ì²? ?°?´?„° ê°œìˆ˜
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);

	}

	
	//dy
	@Override //ì¹´íŠ¸ëª©ë¡ ê°?? ¸?˜¤ê¸? 
	public List<CartVO> getCheckedCartList(String[] cartIdx) {
		return mapper.getCheckedCartItems(cartIdx);
	}
}