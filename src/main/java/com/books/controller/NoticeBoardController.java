/*
 * package com.books.controller;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * import com.books.service.NoticeBoardService;
 * 
 * import lombok.AllArgsConstructor; import lombok.extern.log4j.Log4j;
 * 
 * @Controller
 * 
 * @Log4j
 * 
 * @RequestMapping("/NoticeBoard/*")
 * 
 * @AllArgsConstructor public class NoticeBoardController {
 * 
 * private NoticeBoardService NBservice;
 * 
 * @GetMapping("/list") public void list(Model model) {
 * //model.addAttribute("list", NBservice.getList()); } }
 */
package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.books.domain.Criteria;
import com.books.service.NoticeBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/NoticeBoard/*")
@AllArgsConstructor
public class NoticeBoardController {

	private NoticeBoardService NBservice;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		//model.addAttribute("list", NBservice.getList());
		
	}
	
}
