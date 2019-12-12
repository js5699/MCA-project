package com.books.service;

import java.util.List;

import com.books.domain.CidVO;
import com.books.domain.ProductVO;

public interface AdminProductService {
	
	public ProductVO get(String productId);
	
	public void register(ProductVO PVO);
	
	public boolean modify(ProductVO PVO);
	
	public boolean remove(String productId);
	
	public List<CidVO> getCid();
}
