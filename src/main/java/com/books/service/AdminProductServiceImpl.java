package com.books.service;

import org.springframework.stereotype.Service;

import com.books.domain.ProductVO;
import com.books.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminProductServiceImpl implements AdminProductService{

	private ProductMapper Pmapper;
	
	@Override
	public ProductVO get(String productId) {
		return Pmapper.read(productId);
	}

	@Override
	public void register(ProductVO PVO) {
		Pmapper.insertSelectKey(PVO);
	}

	@Override
	public boolean modify(ProductVO PVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String productId) {
		// TODO Auto-generated method stub
		return false;
	}

}
