package com.books.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.books.domain.UserVO;
import com.books.mapper.AccountMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
 
@Log4j
@Service
@AllArgsConstructor
public class AccountServiceImpl implements AccountService {
	
	private AccountMapper mapper;
	
	@Override
	public void register(UserVO user) {
		
		log.info("Register......" + user);
		mapper.insert(user);
		mapper.insertAuth(user.getUserid());
		
	}

	@Override
	public UserVO get(String userid) {
		
		log.info("get......" + userid);
		
		return mapper.read(userid);
	}

	@Override
	public boolean remove(String userid) {
		
		log.info("service - remove 회원 정보 삭제 : " + userid);
		return mapper.delete(userid) == 1;
	}

	@Override
	public String getUserpw(String userid) {
		log.info("service - getUserpw 회원 정보 수정의 비밀번호 확인 요청 : + userid");
		
		return mapper.getUserpw(userid).toString();
	}

	@Override
	public boolean modPw(UserVO user) {
		log.info(" service - 회원 정보 비밀번호 수정 id : " + user.getUserid());
		
		return mapper.updatePw(user) == 1;
	}

	@Override
	public boolean modifyInfo(UserVO user) {
		log.info(" service - 회원 정보 수정 id : " + user);
		
		return mapper.updateInfo(user) == 1;
	}

	@Override
	public boolean idDupCheck(String newUserid) {
		log.info(" service - 아이디 중복 체크 : " + newUserid);
		return mapper.readId(newUserid) == 1;
	}

}
