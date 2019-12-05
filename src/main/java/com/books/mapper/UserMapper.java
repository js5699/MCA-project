package com.books.mapper;

import java.util.List;

import com.books.domain.Criteria;
import com.books.domain.UserVO;

public interface UserMapper {

	public List<UserVO> getList(Criteria cri);
	
	public void insert(UserVO user);
	
	public int update(UserVO user);//
	
	public int delete(String userid);//
	
	public UserVO read(String userid);
	
	public int getTotalCount(Criteria cri);
}
