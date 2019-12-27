package com.books.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String type; 
	private String keyword;
	 
	private String kw_name;
	private String kw_orderid;
	private String kw_date_from;
	private String kw_date_to;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
//	  public String[] getTypeArr() { return type == null ? new String[] {} :
//	  type.split(""); }
	  
	public String getOrderListLink(String orderid) {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("orderid", orderid)
				.queryParam("pageNum", this.getPageNum())
				.queryParam("kw_name", this.getKw_name())
				.queryParam("kw_orderid", this.getKw_orderid())
				.queryParam("kw_date_from", this.getKw_date_from())
				.queryParam("kw_date_to", this.getKw_date_to());
		return builder.toUriString();
	}
	 
	
	public String getUserListLink(String userid) {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("userid", userid)
				.queryParam("pageNum", this.getPageNum())
				.queryParam("kw_name", this.getKw_name())
				.queryParam("kw_date_from", this.getKw_date_from())
				.queryParam("kw_date_to", this.getKw_date_to());
		return builder.toUriString();
	}
	
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}

}