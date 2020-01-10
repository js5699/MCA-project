package com.books.mapper;

import java.util.List;

import com.books.domain.CidVO;
import com.books.domain.Criteria;
import com.books.domain.ProductVO;

public interface ProductMapper {

	//신영
	public ProductVO read(String productId);
	
	public void insertSelectKey(ProductVO PVO);
	
	public int update(ProductVO PVO);
	
	public List<CidVO> getCid();
	
	public int delete(String productId);
	
	public List<ProductVO> getAdminList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	//상우
	public List<ProductVO> allList()throws Exception;//전체 목록
	
	public ProductVO getProduct(String productid) throws Exception; //상세페이지 
	
	public List<ProductVO> cidList(String cid)throws Exception; //카테고리별 리스트 
	
	/* public List<CidVO> cid()throws Exception; */
}