package com.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.books.domain.UserVO;

public interface AccountMapper {
	
	//@Select("select * from tbl_user")
	public List<UserVO> getList();
	
	public void insert(UserVO user);
	
	public int update(UserVO user);
	
	public int delete(String userid);
	
	public UserVO read(String userid);
	
	public String getUserpw(String userid);
	
	public void insertAuth(String userid);
	
}
