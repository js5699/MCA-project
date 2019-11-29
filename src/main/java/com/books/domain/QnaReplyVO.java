package com.books.domain;

import java.util.Date;

import com.books.domain.QnaReplyVO;

import lombok.Data;

@Data
public class QnaReplyVO {
	
	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;

}