package com.books.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.Criteria;
import com.books.domain.PageDTO;
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
	public void register(Model model) {
		model.addAttribute("cidList", APservice.getCid());
	}
	
	//상품 등록
	@PostMapping("/register")
	public String register(ProductVO PVO, RedirectAttributes rttr) {
		
		APservice.register(PVO);
		
		rttr.addFlashAttribute("result", "registerSuccess");
		
		return "redirect:/adminProduct/list";
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName,int cid) {
		
		File file = new File("C:\\img\\" + cid +"\\"+ fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//상품수정페이지 이동
	@GetMapping("modify")
	public void get(@RequestParam("productId") String productId, Model model) {
		model.addAttribute("product", APservice.get(productId));
		model.addAttribute("cidList", APservice.getCid());
	}
	
	//상품수정
	@PostMapping("/modify")
	public String modify(ProductVO PVO, RedirectAttributes rttr) {
		if(APservice.modify(PVO)) {
			rttr.addFlashAttribute("result", "modifySuccess");
		}
		return "redirect:/";
	}
	
	//상품삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("productId") String productId, RedirectAttributes rttr) {
		if(APservice.remove(productId)) {
			rttr.addFlashAttribute("result", "removeSuccess");
		}
		
		return "redirect:/adminProduct/list";
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", APservice.list(cri));
		
		int total = APservice.getTotal(cri);
		
		model.addAttribute("paging", new PageDTO(cri, total));
	}
}
