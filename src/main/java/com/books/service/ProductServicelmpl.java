package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.CidVO;
import com.books.domain.ProductVO;
import com.books.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServicelmpl implements ProductService {
	
	private ProductMapper mapper;	
	
	@Override
	public List<ProductVO> allList()throws Exception{
			
		log.info("getList..............");
		
		return mapper.allList();
		
	}
	
	public ProductVO getProduct(String productid)throws Exception {
			
		log.info("getProduct.........");
		
		return mapper.getProduct(productid);		
	}
	
	
	public List<ProductVO> cidList(String cid)throws Exception{
		
		log.info("getcidList.........");
		
		return mapper.cidList(cid);
	
	}
	/*
	 * public List<CidVO> cid()throws Exception{
	 * 
	 * log.info("cidList.........");
	 * 
	 * return mapper.cid(); }
	 */

}
