package com.books.service;

import java.util.List;

import com.books.domain.Criteria;
import com.books.domain.UserVO;

public interface AdminUserService {
	
	public List<UserVO> getList(Criteria cri);
	
	public void register(UserVO user);
	
	public UserVO get(String userid);
	
	public boolean modify(UserVO user);
	
	public boolean remove(String userid);
	
	public int getTotal(Criteria cri);
}
