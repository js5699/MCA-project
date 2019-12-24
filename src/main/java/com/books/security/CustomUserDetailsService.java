package com.books.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.books.domain.UserVO;
import com.books.mapper.MemberMapper;
import com.books.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
 
@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + username);
		
		//username means userid
		UserVO vo = memberMapper.read(username);
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null? null : new CustomUser(vo);
	}
}
