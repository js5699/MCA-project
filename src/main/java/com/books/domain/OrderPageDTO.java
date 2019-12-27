package com.books.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class OrderPageDTO {
	
	private int orderCnt;
	
	private List<OrderVO> list;

}
