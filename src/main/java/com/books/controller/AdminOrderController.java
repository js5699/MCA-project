package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.books.domain.Criteria;
import com.books.domain.NoticePageDTO;
import com.books.domain.OrderVO;
import com.books.service.AdminOrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminOrder/*")
@AllArgsConstructor
public class AdminOrderController {
	
	//권한처리 필요
	private AdminOrderService service;

	@GetMapping("/list")
	public void userOrderList(Criteria cri, Model model) {
		
		int totalCount = service.getHasOrderCount(cri);
		model.addAttribute("total", totalCount);
		model.addAttribute("list", service.getLatestOrderListWithPaging(cri));
		model.addAttribute("paging", new NoticePageDTO(cri, totalCount));
		
	}

	@GetMapping("/userOrder-detail")
	public void userOrder(@RequestParam("orderid") String orderid,
						  @RequestParam("userid") String userid,
						  Criteria cri, Model model) {
		
		log.warn("orderid : " + orderid);
		log.warn("userid : " + userid);
		int totalCount = service.getUserOrderItemsCount(orderid, cri);
		model.addAttribute("user", service.getUserInformation(userid));
		model.addAttribute("order", service.getUserOrderDetail(orderid));
		model.addAttribute("list", service.getUserOrderItemsListWithPaging(orderid, cri));
		model.addAttribute("paging", new NoticePageDTO(cri, totalCount));
		
	}


	@PostMapping("/userOrder-detail")
	public String userOrderDetailsModify(OrderVO order) {

		return "";
	}
}
