package com.books.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;
 
@Controller
@Log4j
public class CommonController {
	
	// 로그인 화면에 메세지 처리
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("Access Denied: " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
	}
	
	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model) {
		
		log.warn("error: " + error);
		log.info("logout:" + logout);
		
		if (error != null ) {
			model.addAttribute("error", "아이디와 비밀번호를 확인하세요.");
		}
		
		if (logout != null) { 
			model.addAttribute("logout", "Logout,");
		}
	}
	
	// 로그아웃 post 요청
	@PostMapping("/logout")
	public void logoutPost() {
		log.info("post custom logout");
	}
}
