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
	
	public List<ProductVO> getAdminList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<ProductVO> getList()throws Exception;//책 목록
	
	public ProductVO getProduct(String productid) throws Exception; //상세페이지
}
