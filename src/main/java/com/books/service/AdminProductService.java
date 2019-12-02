package com.books.service;

import com.books.domain.ProductVO;

public interface AdminProductService {
	
	public ProductVO get(String productId);
	
	public void register(ProductVO PVO);
	
	public boolean modify(ProductVO PVO);
	
	public boolean remove(String productId);
}
