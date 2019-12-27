package com.books.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	private String orderid;
	private String productid;
	private Long ea;
	private Long saleprice;

	private String ptitle;
	private Long price;
	private Long salecnt;
}