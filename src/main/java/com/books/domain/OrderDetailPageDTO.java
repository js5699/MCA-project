package com.books.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class OrderDetailPageDTO {
	
	private int itemsCnt;
	private List<OrderDetailVO> list;
}
