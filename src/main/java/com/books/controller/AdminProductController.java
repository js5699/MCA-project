package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.ProductVO;
import com.books.service.AdminProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/adminProduct/*")
public class AdminProductController {

	private AdminProductService APservice;
	
	//상품등록 페이지 이동
	@GetMapping("/register")
	public void register() {
		
	}
	
	//상품 등록
	@PostMapping("/register")
	public String register(ProductVO PVO, RedirectAttributes rttr) {
		
		APservice.register(PVO);
		
		rttr.addFlashAttribute("result", PVO.getProductId());
		
		return "redirect:/";
	}
	
	//상품수정페이지 이동
	@GetMapping("modify")
	public void get(@RequestParam("productId") String productId, Model model) {
		
		model.addAttribute("AP", APservice.get(productId));
	}
	
	//상품수정
	@PostMapping("/modify")
	public void modify() {
		
	}
	
	//상품삭제
	@PostMapping("/remove")
	public void remove() {
		
	}
}
