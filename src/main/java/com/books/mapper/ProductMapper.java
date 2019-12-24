package com.books.mapper;

import java.util.List;

import com.books.domain.CartListVO;
import com.books.domain.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> getList()throws Exception;//책 목록
	
	public ProductVO getProduct(String productid) throws Exception; //상세페이지 
	
	
	
}
