package com.books.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books.domain.AuthVO;
import com.books.domain.Criteria;
import com.books.domain.OrderPageDTO;
import com.books.domain.UserVO;
import com.books.mapper.AdminUserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminUserServiceImpl implements AdminUserService {
	
	private AdminUserMapper mapper;

	@Override
	public boolean modify(UserVO user) {
		log.info("admin-user-mod-" + user.getUserid());
		return mapper.update(user) == 1;
	}

	@Override
	public boolean remove(String userid) {
		log.info("admin-user-del-" + userid);
		return mapper.delete(userid) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("admin-user-getTotal");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<UserVO> getList(Criteria cri) {
		log.info("admin-user-getList " + cri);
		return mapper.getList(cri);
	}

	@Override
	public UserVO getUserWithAuth(String userid) {
		log.info("admin-user-get User With Auth");
		return mapper.readUserWithAuth(userid);
	}
	
	@Override
	public OrderPageDTO getUserOrderListPage(String userid, Criteria cri) {

		return new OrderPageDTO(mapper.getUserOrderCount(userid),
								mapper.getUserOrderListWithPaging(userid, cri));
	}

	@Override
	public int addAuth(AuthVO auth) {
		return mapper.insertAuth(auth);
	}

	@Override
	public int removeAuth(AuthVO auth) {
		return mapper.deleteAuth(auth);
	}
}
