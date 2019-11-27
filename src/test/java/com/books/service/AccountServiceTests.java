package com.books.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.books.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/web-inf/spring/root-context.xml")
@Log4j
public class AccountServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private AccountService service;
	
	@Test
	public void testDelete() {		//done
		
		log.info("REMOVE RESULT : " + service.remove("testid02"));
	}
	
	/*
	@Test
	public void testUpdate() {		//done
		
		UserVO user = service.get("testid02");
		
		if ( user == null )
			return;
		
		user.setEmail("emailmodify@test.com");
		
		log.info("MODIFY RESULT : " + service.modify(user));
		
	}
	*/
	/*
	@Test
	public void testGet() {		//done
		
		log.info(service.get("testid02"));
	}
	*/
	
	/*
	@Test
	public void testRegister() {	//done
		UserVO user = new UserVO();
		
		user.setUserid("testid02"); 
		user.setUserpw("testpw"); 
		user.setName("테스트");
		user.setPhone("010-1111-1111"); 
		user.setEmail("google@gmail.com");
		user.setZipcode("11111"); 
		user.setAddress1("기본주소");
		user.setAddress2("상세 주소 수정");
		
		service.register(user);
		
		log.info("추가된 회원 아이디 : "+ user.getUserid());
		
	}
	*/
	
	/*
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	*/
}
