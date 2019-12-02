package com.books.mapper;

import java.util.List;

import com.books.domain.UserVO;

public interface AccountMapper {
	
	public List<UserVO> getList();
	
	public void insert(UserVO user);
	
	public int updateInfo(UserVO user);

	public int delete(String userid);
	
	public UserVO read(String userid);
	
	public String getUserpw(String userid);
	
	public void insertAuth(String userid);

	public int updatePw(UserVO user);
	
}
