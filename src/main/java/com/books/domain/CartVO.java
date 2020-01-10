package com.books.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	
	private String productid;
	private int productstock;
	private int cartNum;
	private Date addDate;
	
	private String checkedItems;
}
