package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.Criteria;
import com.books.domain.UserVO;
import com.books.mapper.AccountMapper;
import com.books.mapper.AdminOrderMapper;
import com.books.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminUserServiceImpl implements AdminUserService {
	
	private UserMapper userMapper;
	
	private AccountMapper accountMapper;
	
	private AdminOrderMapper AdminOrderMapper;
	
	@Override
	public void register(UserVO user) {
		log.info("admin-user-register"  + user);
		accountMapper.insert(user);
		accountMapper.insertAuth(user.getUserid());
	}

	@Override
	public UserVO get(String userid) {
		log.info("admin-user-get-" + userid);
		return accountMapper.read(userid);
	}

	@Override
	public boolean modify(UserVO user) {
		log.info("admin-user-mod-" + user.getUserid());
		return userMapper.update(user) == 1;
	}

	@Override
	public boolean remove(String userid) {
		log.info("admin-user-del-" + userid);
		return userMapper.delete(userid) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("admin-user-getTotal");
		return userMapper.getTotalCount(cri);
	}

	@Override
	public List<UserVO> getList(Criteria cri) {
		log.info("admin-user-getList " + cri);
		return userMapper.getList(cri);
	}

}
