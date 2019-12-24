package com.books.service;

import java.util.List;


import com.books.domain.ProductVO;


public interface ProductService {
	
	public List<ProductVO> getList()throws Exception;//책 목록
	
	public ProductVO getProduct(String productid) throws Exception; //상세 페이지 
	
	
}
