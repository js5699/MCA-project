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
		
		log.info("error: " + error);
		log.info("logout:" + logout);
		
		if (error != null ) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if (logout != null) { 
			model.addAttribute("logout", "Logout,");
		}
	}
	
	// 로그아웃페이지
	@GetMapping("/customLogout")
	public void logoutGET() {
		
		log.info("custom logout");
		
	}
	
	// 로그아웃 post 요청
	@PostMapping("/customLogout")
	public void logoutPost() {
		log.info("post custom logout");
	}
}
