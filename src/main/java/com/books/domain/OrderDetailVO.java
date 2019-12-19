package com.books.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetailVO {
	private String orderid;
	private String productid;
	private Long ea;
	private Long saleprice;
	
	private String ptitle;//조인해서 얻는 컬럼도 넣어주기
	
}
