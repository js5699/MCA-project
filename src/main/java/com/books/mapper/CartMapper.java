package com.books.mapper;

import java.util.List;

import com.books.domain.CartListVO;
import com.books.domain.CartVO;
import com.books.domain.ProductVO;

public interface CartMapper {
	

	//카트 담기
	public void addCart(CartVO cart) throws Exception; 

	//카트 리스트
	public List<CartListVO> cartList()throws Exception;
	
	//카트에 수량 수정
	public void modifyCart(CartVO cart) throws Exception;
		
	//카트 삭제
	public void delectCart(CartVO cart) throws Exception;
}
