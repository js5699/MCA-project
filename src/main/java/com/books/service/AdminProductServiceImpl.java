package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.CidVO;
import com.books.domain.Criteria;
import com.books.domain.ProductVO;
import com.books.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminProductServiceImpl implements AdminProductService{

	private ProductMapper Pmapper;
	
	@Override
	public ProductVO get(String productId) {
		return Pmapper.read(productId);
	}

	@Override
	public void register(ProductVO PVO) {
		Pmapper.insertSelectKey(PVO);
	}

	@Override
	public boolean modify(ProductVO PVO) {
		
		return Pmapper.update(PVO) == 1;
	}

	@Override
	public boolean remove(String productId) {
		return Pmapper.delete(productId) == 1;
	}

	@Override
	public List<CidVO> getCid() {
		return Pmapper.getCid();
	}

	@Override
	public List<ProductVO> list(Criteria cri) {
		return Pmapper.getList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return Pmapper.getTotalCount(cri);
	}
}
