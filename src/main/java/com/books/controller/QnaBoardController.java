package com.books.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.books.domain.QnaBoardVO;
import com.books.domain.Criteria;
import com.books.domain.QnaPageDTO;
import com.books.service.QnaBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/QnaBoard/*")
@AllArgsConstructor
public class QnaBoardController {
	private QnaBoardService service;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new QnaPageDTO(cri, total));
	}
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(QnaBoardVO board, RedirectAttributes rttr) {
		log.info("register: " + board);		
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/QnaBoard/list";
	}
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/modify")
	public String modify(QnaBoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/QnaBoard/list" + cri.getListLink();
	}
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("remove....." + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}		
		return "redirect:/QnaBoard/list" + cri.getListLink();
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
}
