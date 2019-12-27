package com.books.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.Criteria;
import com.books.domain.NoticePageDTO;
import com.books.domain.OrderDetailPageDTO;
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
		log.warn("list" + cri);
		
		model.addAttribute("list", service.getLatestOrderListWithPaging(cri));
		int totalCount = service.getHasOrderCount(cri);
		model.addAttribute("total", totalCount);
		model.addAttribute("pageMaker", new NoticePageDTO(cri, totalCount));
		
	}

	
	@GetMapping("/detail")
	public void userOrder(@RequestParam("orderid") String orderid, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("order", service.getUserOrderDetail(orderid));
		
	}


	@PostMapping("/detail")
	public String userOrderDetailsModify(@RequestParam("orderid") String orderid, @ModelAttribute("cri") Criteria cri, OrderVO oder, RedirectAttributes rttr) {
		
		if(service.modUserOrder(oder)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/adminOrder/detail" + cri.getOrderListLink(orderid);
	}
	
	
	@ResponseBody
	@GetMapping(value = "/orderItems/{orderid}/{page}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<OrderDetailPageDTO> getOrderDetailsList(@PathVariable("page") int page, @PathVariable("orderid") String orderid) {
		log.info("user order detail..... : " + orderid);
		Criteria cri = new Criteria(page, 15);
		return new ResponseEntity<>(service.getUserOrderItemsListPage(orderid, cri), HttpStatus.OK);
	}
}
