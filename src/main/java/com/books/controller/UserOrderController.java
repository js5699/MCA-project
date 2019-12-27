package com.books.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;
import com.books.domain.UserVO;
import com.books.service.UserOrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/account/*")
@AllArgsConstructor
public class UserOrderController {
	
	private UserOrderService service; 
	
	@GetMapping("/myOrderList")//주문목록+페이징
	public void list(@RequestParam("userid") String userid, Criteria cri, Model model) {
		log.info("myOrderList" + cri);
		
		model.addAttribute("orderlist", service.getList(userid,cri));
		// 전체데이터 개수처리
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("paging", new NoticePageDTO(cri, total));
		
	}
	
	@GetMapping("/orderPayment")//회원주문폼
	public void insertorder() {
		log.info("회원주문페이지");
	}
	
	@PostMapping("/orderPayment")//회원주문
	public String insertorder(OrderVO order, RedirectAttributes rttr) {
		log.info("orderPayment:" + order);
		
		service.insertorder(order);
		
		rttr.addFlashAttribute("result", order.getOrderid());
		
		return "redirect:/account/myOrderList";
	}
	/*
	@PostMapping("/orderPayment")//회원주문
	public String insertorder(HttpSession session, OrderVO order, OrderDetailVO orderDetail, RedirectAttributes rttr) {
		log.info("orderPayment:" + order);
		
		UserVO user = (UserVO)session.getAttribute("user");
		String userId = user.getUserid();
		
		service.insertorder(order);
		service.insertorderDetail(orderDetail);
		
		rttr.addFlashAttribute("result", order.getOrderid());
		
		return "redirect:/account/myOrderList";
	}
	*/
	@GetMapping({"/myOrderDetail","/myOrderMod"})//주문상세조회(수령자정보,책목록)+페이지번호유지
	public void get(@RequestParam("orderid") String orderid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/myOrderDetail or myOrderMod");
		
		model.addAttribute("orderdetail", service.orderView(orderid));
		model.addAttribute("dNameinfo", service.get(orderid));
		
	}
	
	@PostMapping("/myOrderMod")//주문수정+페이징
	public String modify(OrderVO order, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("myOrderMod:"+order);
		
		if(service.modify(order)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/account/myOrderDetail";
	}
}
