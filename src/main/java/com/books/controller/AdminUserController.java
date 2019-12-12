package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.Criteria;
import com.books.domain.NoticePageDTO;
import com.books.domain.PhoneDTO;
import com.books.domain.UserVO;
import com.books.service.AccountService;
import com.books.service.AdminOrderService;
import com.books.service.AdminUserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminUser/*")
@AllArgsConstructor
public class AdminUserController { // 관리자 권한 추가

	private AccountService accountSVC;

	private AdminUserService adminUserSVC;
	
	private AdminOrderService adminOrderSVC;


	@GetMapping("/list")
	public void userList(Criteria cri, Model model) {
		int totalCount = adminUserSVC.getTotal(cri);
		
		model.addAttribute("list", adminUserSVC.getList(cri));
		model.addAttribute("total", totalCount);
		model.addAttribute("paging", new NoticePageDTO(cri,totalCount));
	}

	// odermapper에 따른 수정필요
	@GetMapping("/info")
	public void userInfomation(@RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri, Model model) {
		
		Criteria subCri = new Criteria(1,10);
		log.info("controller - get user information - " + userid);

		model.addAttribute("user", accountSVC.get(userid));

		int totalCount = adminOrderSVC.getUserOrderCount(userid);
		model.addAttribute("total", totalCount);
		model.addAttribute("orderList", adminOrderSVC.getUserOrderListWithPaging(userid, subCri));
		model.addAttribute("paging", new NoticePageDTO(subCri,totalCount));

	}

	@GetMapping("/mod")
	public void userModify(@RequestParam("userid") String userid, PhoneDTO phone, Model model) {

		UserVO user = accountSVC.get(userid);

		phone.phoneSplit(user);

		model.addAttribute("user", user);

	}

	@PostMapping("/mod")
	public String userModifyPost(@RequestParam("userid") String userid, UserVO user, PhoneDTO phone,
			RedirectAttributes rttr) {

		user.setPhone(phone.phoneAppend(user));

		adminUserSVC.modify(user);

		rttr.addFlashAttribute("result", "userModSuccess");

		return "redirect:/adminUser/mod?userid=" + userid;

	}

}
