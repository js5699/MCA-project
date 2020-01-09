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
	
	//�긽�뭹�벑濡� �럹�씠吏� �씠�룞
	@GetMapping("/register")
	public void register(Model model) {
		model.addAttribute("cidList", APservice.getCid());
	}
	
	//�긽�뭹 �벑濡�
	@PostMapping("/register")
	public String register(ProductVO PVO, RedirectAttributes rttr) {
		
		APservice.register(PVO);
		
		rttr.addFlashAttribute("result", "register");
		
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
	
	//�긽�뭹�닔�젙�럹�씠吏� �씠�룞
	@GetMapping("modify")
	public void get(@RequestParam("productId") String productId, Model model) {
		model.addAttribute("product", APservice.get(productId));
		model.addAttribute("cidList", APservice.getCid());
	}
	
	//�긽�뭹�닔�젙
	@PostMapping("/modify")
	public String modify(ProductVO PVO, RedirectAttributes rttr) {
		if(APservice.modify(PVO)) {
			rttr.addFlashAttribute("result", "modify");
		}
		return "redirect:/adminProduct/list";
	}
	
	//�긽�뭹�궘�젣
	@PostMapping("/remove")
	public String remove(@RequestParam("productId") String productId, RedirectAttributes rttr) {
		if(APservice.remove(productId)) {
			rttr.addFlashAttribute("result", "remove");
		}
		
		return "redirect:/adminProduct/list";
	}
	
	@PostMapping("/chkRemove")
	public String chkRemove(String[] chkProductId, RedirectAttributes rttr) {
		
		for(String productId : chkProductId) {
			APservice.remove(productId);
		}
		rttr.addFlashAttribute("result", "remove");
		return "redirect:/adminProduct/list";
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", APservice.list(cri));
		
		int total = APservice.getTotal(cri);
		
		model.addAttribute("paging", new PageDTO(cri, total));
	}
}
