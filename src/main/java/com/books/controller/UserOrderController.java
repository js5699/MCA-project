package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.OrderVO;
import com.books.service.UserOrderService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/account/*")
public class UserOrderController {
	
	private UserOrderService service; 
	
	@GetMapping("/myOrderList")//주문목록
	public void list(@RequestParam("userid") String userid, Model model) {
		log.info("myOrderList");
		
		model.addAttribute("orderlist", service.getList(userid));
	}
	
	@PostMapping("/insertorder")//회원주문
	public String insertorder(OrderVO order, RedirectAttributes rttr) {
		log.info("insertorder:" + order);
		
		service.insertorder(order);
		
		rttr.addFlashAttribute("result", order.getOrderid());
		
		return "redirect:/account/myOrderList";
	}
	
	@GetMapping("/myOrderDetail")//주문상세조회
	public void get(@RequestParam("orderid") String orderid, Model model) {
		log.info("/myOrderDetail");
		
		model.addAttribute("order", service.get(orderid));
	}
	
	@PostMapping("/modify")//주문수정
	public String modify(OrderVO order, RedirectAttributes rttr) {
		log.info("modify:"+order);
		
		if(service.modify(order)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/account/myOrderList";
	}
}