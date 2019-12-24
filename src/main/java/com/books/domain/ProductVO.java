package com.books.domain;

import lombok.Data;

@Data
public class ProductVO {

//	 "PRODUCTID" VARCHAR2(20),
//		"PIMG" VARCHAR2(100) NOT NULL,
//		"PTITLE" VARCHAR2(100) NOT NULL,
//		"PRICE" NUMBER(7) NOT NULL,
//		"PUBLISHER" VARCHAR2(80) NOT NULL,
//		"AUTHOR" VARCHAR2(80) NOT NULL,
//		"BKSIZE" VARCHAR2(30),
//		"BKPAGE" NUMBER(5),
//		"BKINDEX" VARCHAR2(2000),
//		"BKDESC" VARCHAR2(4000), 
//		"ISBN" VARCHAR2(20),
//		"STOCK" NUMBER(6) DEFAULT 100, 
//		"CID" VARCHAR2(5) NOT NULL,
//		"SALECNT" NUMBER(7,0) DEFAULT 0,
	private String productid;
	private String pimg;
	private String ptitle;
	private int price;
	private String publisher;
	private String author;
	private String bkSize;
	private int bkPage;
	private String bkIndex;
	private String bkDesc;
	private String ISBN;
	private int stock;
	private String cid;
	private int salecnt;
		
}
