package com.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.books.domain.AuthVO;
import com.books.domain.Criteria;
import com.books.domain.OrderVO;
import com.books.domain.UserVO;

public interface AdminUserMapper {
	
	// 유저 페이징 - 총회원수
	public int getTotalCount(Criteria cri);
	
	// 유저 목록 페이징
	public List<UserVO> getList(Criteria cri);
	
	// 회원 정보 + 권한
	public UserVO readUserWithAuth(String userid);
	
	// 회원 정보 업데이트
	public int update(UserVO user);
	
	public int delete(String userid);//

	// 회원 개인 주문내역 카운트
	public int getUserOrderCount(String userid);
	
	// 회원 개인 주문내역 리스트+페이징
	public List<OrderVO> getUserOrderListWithPaging(@Param("userid") String userid, @Param("cri") Criteria cri);
	
	// 회원 관리자 권한 추가
	public int insertAuth(AuthVO auth);
	
	// 회원 관리자 권한 삭제
	public int deleteAuth(AuthVO auth);
}
