package com.books.service;

import org.springframework.stereotype.Service;

import com.books.domain.CartVO;
import com.books.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MyCartServiceImpl implements MyCartService {
	
	private CartMapper mapper;
	
	@Override
	public int addCart(CartVO cart) { 
		return mapper.add(cart);
	}

}
