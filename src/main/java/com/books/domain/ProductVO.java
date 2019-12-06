package com.books.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private String productId;
	private String pimg;
	private String ptitle;
	private int price;
	private String publisher;
	private String pubdate;
	private String author;
	private String bksize;
	private int bkpage;
	private String bkindex;
	private String bkdesc;
	private String isbn;
	private Date regdate;
	private Date updateDate;
	private int stock;
	private String cid;
	private int salecnt;
	
}
