package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

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
	public List<ProductVO> getList()throws Exception{
			
		log.info("getList..............");
		
		return mapper.getList();
		
	}
	
	public ProductVO getProduct(String productid)throws Exception {
			
		log.info("getProduct.........");
		
		return mapper.getProduct(productid);		
	}
	
	
}
