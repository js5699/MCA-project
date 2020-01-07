package com.books.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.CartListVO;
import com.books.domain.Criteria;
import com.books.domain.PageDTO;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;
import com.books.domain.UserVO;
import com.books.service.CartService;
import com.books.service.UserOrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/account/*")
@AllArgsConstructor
public class UserOrderController {
	
	private UserOrderService service;
	
	private CartService cartservice;
	
	@GetMapping("/myOrderList")//주문목록+페이징
	public void list(@RequestParam("userid") String userid, Criteria cri, Model model) {
		log.info("myOrderList" + cri);
		
		model.addAttribute("orderlist", service.getList(userid,cri));
		// 전체데이터 개수처리
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("paging", new PageDTO(cri, total));
		
	}
	/*
	@GetMapping("/orderCompleted")//주문완료
	public void completed(@RequestParam("orderid") String orderid, Model model) {
		log.info("주문완료");
		model.addAttribute("orderCompleted", service.orderCompleted(orderid));
	}
	*/
	@GetMapping("/orderPayment")//회원주문폼
	public void insertorder(Model model)throws Exception {
		log.info("회원주문페이지");
		
		List<CartListVO> cartList = cartservice.cartList();
		
		model.addAttribute("cartList",cartList);
	}
	/*
	@PostMapping("/orderPayment")//회원주문
	public String insertorder(OrderVO order, RedirectAttributes rttr) {
		log.info("orderPayment:" + order);
		
		service.insertorder(order);
		
		rttr.addFlashAttribute("result", order.getOrderid());
		
		return "redirect:/account/myOrderList";
	}
	
	@PostMapping("/orderPayment")//회원주문-미완
	public String insertorder(OrderVO order, OrderDetailVO orderDetail, RedirectAttributes rttr) {
		log.info("orderPayment:" + order);
		

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		 
		for(int i = 1; i <= 999; i ++) {
			subNum += (int)1;
		}
		
		String orderid = ymd + "_" + subNum;

		
		order.setOrderid(orderid);
		order.setUserid(userid);
		
		service.insertorder(order);
		orderDetail.setOrderid(orderid);
		service.insertorderDetail(orderDetail);
		
		rttr.addFlashAttribute("result", order.getOrderid());
		
		return "redirect:/account/orderCompleted";
	}
	*/
	@RequestMapping(value = "/orderPayment", method = RequestMethod.POST,
			consumes = "application/json")
	@ResponseBody
	public String insertorder(@RequestBody OrderVO order, @RequestBody OrderDetailVO orderDetail, RedirectAttributes rttr)throws Exception {
		log.info("orderPayment");
		
		List<CartListVO> cartList = cartservice.cartList();
		log.warn(cartList);
		service.insertorder(order);
		orderDetail.setList(cartList);
		service.insertorderDetail(orderDetail);
		rttr.addFlashAttribute("result", order.getOrderid());
		
		return "redirect:/account/orderCompleted";
	}
	
	
	@GetMapping({"/myOrderDetail","/myOrderMod","/orderCompleted"})//주문상세조회(수령자정보,책목록,책제목)+페이지번호유지
	public void get(@RequestParam("orderid") String orderid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/myOrderDetail or myOrderMod");
		
		model.addAttribute("orderdetail", service.orderView(orderid));
		//model.addAttribute("orderdetailtitle", service.orderViewTitle(orderid));
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
