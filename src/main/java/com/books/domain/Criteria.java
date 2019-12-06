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
	
	//admin user search
	private String pkType;
	private String roleType;
	
	private String pkKeyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getPkTypeArr() {
		return pkType == null? new String[] {}: pkType.split("");
	}
	
	public String[] getRoleTypeArr() {
		return roleType == null? new String[] {}: roleType.split("");
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
	
	public String getUserListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("pkType", this.getPkType())
				.queryParam("pkKeyword", this.getPkKeyword())
				.queryParam("roleType", this.getRoleType());
		
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