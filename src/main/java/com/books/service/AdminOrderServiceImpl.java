package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.Criteria;
import com.books.domain.OrderVO;
import com.books.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminOrderServiceImpl implements AdminOrderService {

	private OrderMapper mapper;

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<OrderVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getUserOrderTotal(String userid, Criteria cri) {
		return mapper.getUserOderTotalCount(userid, cri);
	}

	@Override
	public List<OrderVO> getUserOrderList(Criteria cri, String userid) {
		return mapper.getUserOderList(cri);
	}

	@Override
	public OrderVO get(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(OrderVO order) {
		// TODO Auto-generated method stub
		return false;
	}

}
