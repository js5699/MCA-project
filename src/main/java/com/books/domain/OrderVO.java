package com.books.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private String orderid;
	private String userid;
	private Date orderdate;
	private Long quantity;
	private Long totalprice;
	
	private String dname;
	private String dtell;
	private String dzipcode;
	private String daddress1;
	private String daddress2;
	private String dmsg;
	private String orderstatus;//배송상태 추가
	private String orderbook;//주문도서명 추가
}
