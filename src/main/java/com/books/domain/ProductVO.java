package com.books.domain;

import java.util.Date;

import lombok.Data;
@Data
public class ProductVO {
	private String productid;
	private String pimg;
	private String ptitle;
	private Long price;
	private String publisher;
	private Date pubdate;
	private String author;
	private String bksize;
	private Long bkpage;
	private String bkindex;
	private String bkdesc;
	private String isbn;
	private Date regdate;
	private Date updatedate;
	private Long stock;
	private String cid;
	private Long salecnt;
	private String bkweight;
}
