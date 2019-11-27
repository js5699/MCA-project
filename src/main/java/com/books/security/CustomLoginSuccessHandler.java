package com.books.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
 
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("Login success");
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES:" + roleNames);
		
		//관리자 로그인시 이동페이지
		if( roleNames.contains("ROLE_ADMIN") ) {
			response.sendRedirect("/");
			return;
		}
		
		//일반 유저 로그인시 이동페이지
		if( roleNames.contains("ROLE_USER") ) {
			response.sendRedirect("/");
			return;
		}
		
		response.sendRedirect("/");
	}

}
