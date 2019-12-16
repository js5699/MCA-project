package com.books.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.books.domain.Criteria;
import com.books.domain.OrderDetailPageDTO;
import com.books.domain.OrderPageDTO;
import com.books.service.OrderManageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/userOrders/")
@RestController
@Log4j
@AllArgsConstructor
public class OrderManageController {
	
	private OrderManageService service;
	
	@GetMapping(value="/orderList/{userid}/{page}", 
				produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<OrderPageDTO> getUserOrdersList(@PathVariable("page") int page, @PathVariable("userid") String userid) {
		log.info("user order List.....");
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(service.getUserOrderListPage(userid, cri), HttpStatus.OK);
	}
	
	
	@GetMapping(value="/orderDetail/{orderid}/{page}",
				produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<OrderDetailPageDTO> getOrderDetailsList(@PathVariable("page") int page, @PathVariable("orderid") String orderid) {
		log.info("user order detail..... : " +  orderid);
		Criteria cri = new Criteria(page, 15);
		return new ResponseEntity<>(service.getUserOrderItemsListPage(orderid, cri), HttpStatus.OK);
	}
	
}
