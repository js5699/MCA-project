package com.books.mapper;

import java.util.List;

import com.books.domain.CidVO;
import com.books.domain.Criteria;
import com.books.domain.ProductVO;

public interface ProductMapper {

	public ProductVO read(String productId);
	
	public void insertSelectKey(ProductVO PVO);
	
	public int update(ProductVO PVO);
	
	public List<CidVO> getCid();
	
	public int delete(String productId);
	
	public List<ProductVO> getList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
