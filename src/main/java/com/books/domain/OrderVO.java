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
	private String dName;
	private String dTell;
	private String dZipcode;
	private String dAddress1;
	private String dAddress2;
	private String dMsg;
}
