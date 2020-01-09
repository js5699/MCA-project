package com.books.domain;

import java.util.List;

import lombok.Data;

@Data
public class PaymentDTO {
	
	private OrderVO order;
	private OrderDetailVO orderDetail;
	
	private List<CartVO> cartList;
	
}
