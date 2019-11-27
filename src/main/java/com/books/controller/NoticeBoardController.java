
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
import com.books.domain.NoticeBoardVO;
import com.books.domain.NoticePageDTO;
import com.books.service.NoticeBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller

@Log4j

@RequestMapping("/NoticeBoard/*")

@AllArgsConstructor
public class NoticeBoardController {

	private NoticeBoardService NBservice;

	@GetMapping("/noticeList")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", NBservice.getList(cri));
		
		int total = NBservice.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("paging", new NoticePageDTO(cri, total));
	}
	
	@PostMapping("/noticeRegister")
	public String register(NoticeBoardVO NBVO, RedirectAttributes rttr) {
		log.info("register : " + NBVO);
		
		NBservice.register(NBVO);
		
		rttr.addFlashAttribute("result", NBVO.getBno());
		
		return "redirect:/NoticeBoard/noticeList";
	}
	
	@GetMapping({"/noticeGet", "noticeModify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		
		model.addAttribute("NB", NBservice.get(bno));
	}
	
	@PostMapping("/noticeModify")
	public String modify(NoticeBoardVO NBVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + NBVO);
		
		if(NBservice.modify(NBVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/NoticeBoard/noticeList";
	}
	
	@PostMapping("/noticeRemove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		
		if(NBservice.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/NoticeBoard/noticeList";
	}
	
	@GetMapping("/noticeRegister")
	public void register() {
		
	}
}