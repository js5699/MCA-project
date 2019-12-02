package com.books.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private String productId;
	private String pImg;
	private String pTitle;
	private int price;
	private String publisher;
	private String pubDate;
	private String author;
	private String bkSize;
	private int bkPage;
	private String bkIndex;
	private String bkDesc;
	private String ISBN;
	private Date regDate;
	private Date updateDate;
	private int stock;
	private String cId;
	private int saleCnt;
	
}
