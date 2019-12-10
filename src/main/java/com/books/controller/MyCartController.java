package com.books.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.books.domain.CartVO;
import com.books.service.MyCartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/cart/")
public class MyCartController {
	
	private MyCartService service;
	
	
	@PostMapping(value="/add", consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> add(@RequestBody CartVO cart) {
		
		log.warn("장바구니 추가 : " + cart);
		
		int addcount = service.addCart(cart);
		
		log.warn("장바구니 추가 count : " + addcount);
		
		return addcount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
							   new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
