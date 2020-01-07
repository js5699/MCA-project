package com.books.service;

import com.books.domain.UserVO;
 
public interface AccountService {
	
	public void register(UserVO user);
	
	public UserVO get(String userid);
	
	public boolean modifyInfo(UserVO user);
	
	public boolean remove(String userid);
	
	public boolean removeAuth(String userid);
	
	public String getUserpw(String userid);

	public boolean modPw(UserVO user);
	
	public int idDupCheck(String newUserid);
}
