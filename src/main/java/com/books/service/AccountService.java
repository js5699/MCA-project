package com.books.service;

import com.books.domain.UserVO;
 
public interface AccountService {
	
	public void register(UserVO user);
	
	public UserVO get(String userid);
	
	public boolean modify(UserVO user);
	
	public boolean remove(String userid);
	
	public String getUserpw(String userid);
	
	public void userAuth(String userid);
	
}
