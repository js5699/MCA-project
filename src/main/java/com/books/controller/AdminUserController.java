package com.books.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.AuthVO;
import com.books.domain.Criteria;
import com.books.domain.NoticePageDTO;
import com.books.domain.OrderPageDTO;
import com.books.domain.PhoneDTO;
import com.books.domain.UserVO;
import com.books.service.AdminUserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminUser/*")
@AllArgsConstructor
public class AdminUserController { // 관리자 권한 추가

	private AdminUserService service;
	
	@GetMapping("/list")
	public void userList(Criteria cri, Model model) {
		
		int totalCount = service.getTotal(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("total", totalCount);
		model.addAttribute("pageMaker", new NoticePageDTO(cri,totalCount));
	}
	
	@GetMapping("/info")
	public void userInformation(@RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("user", service.getUserWithAuth(userid));

	}

	@GetMapping("/mod")
	public void userModify(@RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri, Model model) {
		
		PhoneDTO PDTO = new PhoneDTO();
		UserVO user = service.getUserWithAuth(userid);
		PDTO.phoneSplit(user);
		model.addAttribute("user", user);

	}

	@PostMapping("/mod")
	public String userModifyPost(@RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri, UserVO user, RedirectAttributes rttr) {
		
		PhoneDTO PDTO = new PhoneDTO();
		user.setPhone(PDTO.phoneAppend(user));
		service.modify(user);
		
		rttr.addFlashAttribute("result", "userModSuccess");

		return "redirect:/adminUser/mod" + cri.getUserListLink(userid);
		
	}
	
	//권한추가
	@ResponseBody
	@PostMapping(value="/add-role") 
	public ResponseEntity<String> insertRole(@RequestBody AuthVO auth) {
		
		return service.addAuth(auth) == 1
			   ? new ResponseEntity<>("success", HttpStatus.OK)
			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//권한삭제
	@ResponseBody
	@DeleteMapping(value="/remove-role")
	public ResponseEntity<String> remove(@RequestBody AuthVO auth) {
		
		return service.removeAuth(auth) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	// 회원의 주문내역 리스트
	@ResponseBody
	@GetMapping(value = "/orderList/{userid}/{page}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<OrderPageDTO> getUserOrdersList(@PathVariable("page") int page, @PathVariable("userid") String userid) {
		log.info("user order List.....");
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(service.getUserOrderListPage(userid, cri), HttpStatus.OK);
	}
	
}
