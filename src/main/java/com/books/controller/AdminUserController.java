package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.Criteria;
import com.books.domain.NoticePageDTO;
import com.books.domain.PhoneDTO;
import com.books.domain.UserVO;
import com.books.service.AccountService;
import com.books.service.AdminUserService;
import com.books.service.UserOrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminUser/*")
@AllArgsConstructor
public class AdminUserController { // 관리자 권한 추가

	private AccountService acService;

	private AdminUserService auService;

	private UserOrderService odService;

	// odermapper에 따른 수정필요
	@GetMapping("/list")
	public void userList(Criteria cri, Model model) {

		model.addAttribute("list", auService.getList(cri));

		/*
		 * int total = odService.get
		 * 
		 * model.addAttribute("total", total); model.addAttribute("paging", new
		 * NoticePageDTO(cri, total));
		 */

	}

	// odermapper에 따른 수정필요
	@GetMapping("/info")
	public void userInfomation(@RequestParam("userid") String userid, Criteria cri, Model model) {

		log.info("controller - get user information - " + userid);

		model.addAttribute("user", acService.get(userid));

		int total = odService.getTotal(cri);
		model.addAttribute("orderList", odService.getList(userid, cri));
		model.addAttribute("total", total);
		model.addAttribute("paging", new NoticePageDTO(cri, total));

	}

	@GetMapping("/mod")
	public void userModify(@RequestParam("userid") String userid, PhoneDTO phone, Model model) {

		UserVO user = acService.get(userid);

		phone.phoneSplit(user);

		model.addAttribute("user", user);

	}

	@PostMapping("/mod")
	public String userModifyPost(@RequestParam("userid") String userid, UserVO user, PhoneDTO phone,
			RedirectAttributes rttr) {

		user.setPhone(phone.phoneAppend(user));

		auService.modify(user);

		rttr.addFlashAttribute("result", "userModSuccess");

		return "redirect:/adminUser/mod?userid=" + userid;

	}

}
