package com.books.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetailVO {
	List<CartListVO> list;
	
	private String orderid;
	private String productid;
	private Long ea;
	private Long saleprice;

	private String ptitle;
	private Long price;
	private Long salecnt;
}