package com.books.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.books.domain.Criteria;
import com.books.domain.OrderVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminOrder/*")
@AllArgsConstructor
public class AdminOrderController {

	@GetMapping("/list")
	public void userOrderList(Criteria cri, Model model) {

		log.info("Test");
	}

	@GetMapping("/userOrder")
	public void userOrder(Model model) {

	}

	@GetMapping("/userOrder/details")
	public void userOrderDetails(Model model) {

	}

	@PostMapping("/userOrder/details")
	public String userOrderDetailsModify(OrderVO order) {

		return "";
	}
}
