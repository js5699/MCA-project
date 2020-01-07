package com.books.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartListVO {
	
	private String productid;
	private int productstock;	
	private int cartNum;
	private int stock;
	
	private int num;
	private String ptitle;
	private int price;
	private String pimg;	
			
}