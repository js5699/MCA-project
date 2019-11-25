package com.books.domain;

import lombok.Data;

@Data
public class UserVO {
	
	private String userid;
	private String userpw;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
}
