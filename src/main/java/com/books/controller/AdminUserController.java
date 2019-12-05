package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.books.domain.Criteria;
import com.books.domain.NoticePageDTO;
import com.books.service.AccountService;
import com.books.service.AdminUserService;
import com.books.service.UserOrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminUser/*")
@AllArgsConstructor
public class AdminUserController { //관리자 권한 추가

	private AccountService acService;
	
	private AdminUserService auService;
	
	private UserOrderService odService;
	
	
	@GetMapping("/list")
	public void userList(Criteria cri, Model model) {
		
		model.addAttribute("list", auService.getList(cri));
		
		int total = auService.getTotal(cri);
		
		model.addAttribute("total", total);
		model.addAttribute("paging", new NoticePageDTO(cri, total));
		
	}
	
	
	@GetMapping("/info")
	public void userInfomation(@RequestParam("userid") String userid, Model model) {
		
		log.info("controller - get user information - " + userid);
		
		model.addAttribute("user", acService.get(userid));
		model.addAttribute("order", odService.getList(userid));
		
	}
	
	
	
}
