package com.books.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailVO;
import com.books.domain.OrderVO;
import com.books.domain.PageDTO;
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
	
	@GetMapping("/myOrderList")//주문목록+?��?���?
	public void list(@RequestParam("userid") String userid, Criteria cri, Model model) {
		log.info("myOrderList" + cri);
		
		model.addAttribute("orderlist", service.getList(userid,cri));
		// ?��체데?��?�� 개수처리
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("paging", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/orderPayment")//?��?��주문?��
	public void insertorder() {
		log.info("?��?��주문?��?���?");
	}
	/*
	@PostMapping("/orderPayment")//?��?��주문
	public String insertorder(OrderVO order, RedirectAttributes rttr) {
		log.info("orderPayment:" + order);
		
		service.insertorder(order);
		
		rttr.addFlashAttribute("result", order.getOrderid());
		
		return "redirect:/account/myOrderList";
	}
	*/
	@PostMapping("/orderPayment")//?��?��주문-미완
	public String insertorder(HttpSession session, OrderVO order, OrderDetailVO orderDetail, RedirectAttributes rttr) {
		log.info("orderPayment:" + order);
		
		UserVO user = (UserVO)session.getAttribute("user");
		String userid = user.getUserid();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		 
		for(int i = 1; i <= 6; i ++) {
		 subNum += (int)(Math.random() * 10);
		}
		
		String orderid = ymd + "_" + subNum;
		
		order.setOrderid(orderid);
		order.setUserid(userid);
		
		service.insertorder(order);
		orderDetail.setOrderid(orderid);
		service.insertorderDetail(orderDetail);
		
		rttr.addFlashAttribute("result", order.getOrderid());
		
		return "redirect:/account/myOrderList";
	}
	
	
	@GetMapping({"/myOrderDetail","/myOrderMod"})//주문?��?��조회(?��?��?��?���?,책목�?,책제�?)+?��?���?번호?���?
	public void get(@RequestParam("orderid") String orderid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/myOrderDetail or myOrderMod");
		
		model.addAttribute("orderdetail", service.orderView(orderid));
		//model.addAttribute("orderdetailtitle", service.orderViewTitle(orderid));
		model.addAttribute("dNameinfo", service.get(orderid));
		
	}
	
	@PostMapping("/myOrderMod")//주문?��?��+?��?���?
	public String modify(OrderVO order, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("myOrderMod:"+order);
		
		if(service.modify(order)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/account/myOrderDetail";
	}
	
	
	// dy
	@PostMapping("/orderPayment2")
	public void orderPaymentProcess1(@RequestBody String checkedItems, RedirectAttributes rttr) {
		String[] cartIdx = checkedItems.split(",");
		rttr.addAttribute("items" ,service.getCheckedCartList(cartIdx));
	}
	
	@PostMapping("/ordered")
	public String orderPaymentProcess2(OrderVO order) {
		
		return "redirect://account/order_ok";
	}
	
}
