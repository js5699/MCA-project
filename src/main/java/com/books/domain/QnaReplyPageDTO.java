package com.books.domain;

import java.util.List;

import com.books.domain.QnaReplyPageDTO;
import com.books.domain.QnaReplyVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class QnaReplyPageDTO {
	
	private int replyCnt;
	private List<QnaReplyVO> list;

}

