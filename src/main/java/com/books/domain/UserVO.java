package com.books.domain;
 
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private String userid;
	private String userpw;
	private String name;
	
	private String newUserPw1;
	private String newUserPw2;
	
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	
	
	private List<AuthVO> authList;
}
