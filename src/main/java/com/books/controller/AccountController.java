package com.books.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.PhoneDTO;
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
	
	@GetMapping("/test") 
	public void testPage() {
		
	}
	
	//회원탈퇴 페이지
	@Secured({"ROLE_USER"})
	@GetMapping("/withdraw")
	public void withdraw() {
		log.info("회원탈퇴 페이지");
	}
	
	//회원가입 폼
	@GetMapping("/join")
	public void register() {
		log.info("회원가입 페이지");
	}
	
	@GetMapping(value="/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("newUserid") String newUserid) {
		log.warn("dub check id : " + newUserid);
		return service.idDupCheck(newUserid);
	}
	
	//회원가입 처리
	@PostMapping("/join")
	public String register(UserVO user, RedirectAttributes rttr) {
		
		log.info("회원가입 : " + user);
		
		//패스워드암호화
		BCryptPasswordEncoder BCPEncoder = new BCryptPasswordEncoder();
		user.setUserpw(BCPEncoder.encode(user.getUserpw()));
		
		//전화번호 처리
		PhoneDTO phone = new PhoneDTO();
		phone.phoneAppend(user);
		
		//insert
		service.register(user);
		rttr.addFlashAttribute("result", "success");
		
		return  "redirect:/";	//가입완료 처리 추가
	}
	
	
	// 마이페이지 초기화면, 내 정보 수정 폼
	@Secured({"ROLE_USER"})
	@GetMapping("/myPage")
	public void myPage(Model model) {
		
		log.info("/myPage");
		
		// 인증 객체에서 로그인 정보 가져옴
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal(); //유저정보
		
		// user에서 username획득하여 get처리
		model.addAttribute("user", service.get(user.getUsername()));
		
	}
	
	
	//비밀번호 폼
	@Secured({"ROLE_USER"})
	@GetMapping("/pwConfirm")
	public void passwordConfirm() {
		
		log.info("회원정보 변경을 위한 비밀번호 요청 폼");
	
	}
	
	
	//비밀번호 확인 처리
	@Secured({"ROLE_USER"})
	@PostMapping("/pwConfirm")
	public String passwordConfirm(@RequestParam("userpwcf") String userpwcf, RedirectAttributes rttr) {
		
		log.warn(userpwcf);
		String redirectUrl = "pwConfirm";
		
		BCryptPasswordEncoder BCPEncoder = new BCryptPasswordEncoder();
		
		// 시큐리티 - 회원id, pw 정보
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal(); //유저정보
		
		// 로그인 아이디
		String userid = user.getUsername(); // userid
		
		// id로 DB의 pw겟, matches()로 입력한 데이터와 DB값 비교
		if ( BCPEncoder.matches(userpwcf, service.getUserpw(userid)) ) {
			redirectUrl = "myInfoMod";
			log.info("비밀번호 일치함");
			rttr.addAttribute("result","currect");
		} else {
			log.info("비밀번호 일치하지 않음");
			rttr.addAttribute("result","error");
		}
		
		return "redirect:/account/" + redirectUrl;
	}
	
	
	@Secured({"ROLE_USER"})
	@GetMapping("/myInfoMod")
	public void myInfoMod(Model model) {
		
		log.info("/myInfoMod");
		
		// 인증 객체에서 로그인 정보 가져옴
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal(); //유저정보
		
		// user에서 username획득하여 get처리
		UserVO myInfo = service.get(user.getUsername());
		
		PhoneDTO phone = new PhoneDTO();
		phone.phoneSplit(myInfo);

		model.addAttribute("user", myInfo);
	}
	
	
	@PostMapping("/myInfoMod/{mod}")
	public String myInformationUpdate(@PathVariable("mod") String modType, UserVO user, RedirectAttributes rttr) {
		
		log.warn("modType : " +  modType);
		BCryptPasswordEncoder BCPEncoder = new BCryptPasswordEncoder();
		
		String result = "";
		
		//비밀번호 변경시
		if( modType.equals("pw") ) {
			
			log.warn("바꾸려는 비밀번호 : " + user.getNewUserPw1());
			
			String userid   = user.getUserid();
			String inputUserRawPw = user.getUserpw();
			String DBUserPw = service.getUserpw(userid);
			
			//비밀번호 비교
			if ( BCPEncoder.matches(inputUserRawPw, DBUserPw) ) {
				
				user.setNewUserPw1(BCPEncoder.encode(user.getNewUserPw1()));
				
				if (service.modPw(user)) 
					result = "pwModSuccess";
				else
					result = "pwModFail";
				
			} else {
				result = "pwModFail";
			}
			
		//정보만 변경시	
		} else if ( modType.equals("info") ){	
			
			//전화번호 세팅
			PhoneDTO phone = new PhoneDTO();
			phone.phoneAppend(user);
			
			//정보 변경 
			if( service.modifyInfo(user) )
				result = "infoModsuccess";
			else
				result = "infoModFail";
			
		} else {
			result = "error";
		}
		
		rttr.addFlashAttribute("result", result);
		
		return "redirect:/account/myPage";
		
	}
	
	
}
