package com.books.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.UserVO;
import com.books.service.AccountService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
 
@Controller
@Log4j
@RequestMapping("/account/*")
@AllArgsConstructor
public class AccountController {
	
	private AccountService service;
	
	//회원가입 폼
	@GetMapping("/join")
	public void register() {
		log.warn("회원가입 페이지");
	}
	
	//회원가입 처리
	@PostMapping("/join")
	public String register(UserVO user, RedirectAttributes rttr) {
		
		log.info("회원가입 : " + user);
		
		//패스워드암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		user.setUserpw(passwordEncoder.encode(user.getUserpw()));
		
		//insert
		service.register(user);
		service.userAuth(user.getUserid());
		
		rttr.addFlashAttribute("result", user.getUserid());
		
		return  "redirect:/";
	}
	
	// 마이페이지 초기화면, 내 정보 수정 폼
	@GetMapping({"/myPage", "/myInfoMod"})
	public void myPage(@RequestParam("userid") String userid, Model model) {
		
		log.info("/myPage");
		model.addAttribute("user", service.get(userid));
		
	}
	
	//비밀번호 폼
	@GetMapping("/pwConfirm")
	public void passwordConfirm(@RequestParam("userid") String userid) {
		
		log.info("아이디 : " + userid);
	
	}
	
	//스프링 시큐리티 처리 필요
	//비밀번호 확인 처리
	@PostMapping("/pwConfirm")
	public String passwordConfirm(String userid, String userpw,
			Model model,
			RedirectAttributes rttr) {
		
		String redirectUrl = "redirect:/account/pwConfirm";
		
		log.info("userid : " + userid + "//userpw : " + userpw);
		
		String getPw = service.getUserpw(userpw);
		
		if ( userpw.equals(getPw) ) {
			redirectUrl = "redirect:/myInfoMod";
			log.info("비밀번호 일치함");
		} else {
			log.info("비밀번호 일치하지 않음");
			model.addAttribute("msg", "비밀번호가 틀립니다.");
		}
		
		return redirectUrl;
	}
	
	@PostMapping("/myInfoMod")
	public String myInformationUpdate(UserVO user, RedirectAttributes rttr) {
		
		return "";
	}
}
