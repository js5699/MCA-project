package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/account/*")
public class AccountController {
	
	@GetMapping("/join")
	public void register() {
		log.info("회원가입 페이지");
	}
}
