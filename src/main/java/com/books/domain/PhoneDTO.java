package com.books.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PhoneDTO {
	
	private String phone;
	
	public PhoneDTO() {
		
	}

	public UserVO phoneSplit(UserVO user) {
		String[] splitPhone = (user.getPhone()).split("-");
		user.setPhone1(splitPhone[0]);
		user.setPhone2(splitPhone[1]);
		user.setPhone3(splitPhone[2]);
		return user;
	}
	
	public String phoneAppend(UserVO user) {
		return phone = user.getPhone1() + "-" + user.getPhone2() + "-" + user.getPhone3();
	}
}
