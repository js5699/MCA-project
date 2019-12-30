package com.books.service;

import java.util.List;

import com.books.domain.AuthVO;
import com.books.domain.Criteria;
import com.books.domain.OrderPageDTO;
import com.books.domain.UserVO;

public interface AdminUserService {
	
	public int getTotal(Criteria cri);
	
	public List<UserVO> getList(Criteria cri);
	
	public UserVO getUserWithAuth(String userid);
	
	public boolean modify(UserVO user);
	
	public boolean remove(String userid);	
	
	// 회원 개인 주문내역 리스트+페이징
	public OrderPageDTO getUserOrderListPage(String userid, Criteria cri);
		
	public int addAuth(AuthVO auth);
	
	public int removeAuth(AuthVO auth);
}
