package com.books.mapper;

import com.books.domain.ProductVO;

public interface ProductMapper {

	public ProductVO read(String productId);
	
	public void insertSelectKey(ProductVO PVO);
}
