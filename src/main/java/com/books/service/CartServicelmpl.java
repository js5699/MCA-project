package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.CartListVO;
import com.books.domain.CartVO;
import com.books.mapper.CartMapper;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CartServicelmpl implements CartService {
	
	private CartMapper mapper;	
	
	// 카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception{
			
		 	mapper.addCart(cart);			
	}
	
	//카트 리스트
	@Override
	public List<CartListVO> cartList()throws Exception{
		
			return mapper.cartList();
	}	
	
	
	//카트에 수량 수정
	@Override
	public void modifyCart(CartVO cart) throws Exception{
		
			mapper.modifyCart(cart);
	}
	
	//카트 삭제
	@Override
	public void delectCart(CartVO cart) throws Exception{
			mapper.delectCart(cart);
	}
	
	
}
