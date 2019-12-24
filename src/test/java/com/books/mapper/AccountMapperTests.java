package com.books.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.books.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AccountMapperTests {

	@Setter(onMethod_ = @Autowired)
	private AccountMapper mapper;

	/*
	@Test
	public void testRead() {
		log.info("read user : " + mapper.read("testid"));
	}
	
	*/
	/*
	@Test
	public void testDelete() {
		log.info("delete count: " + mapper.delete("testid01"));
	}
	*/
	
	/*
	@Test
	public void testUpdate() {
		UserVO user = new UserVO();
		
		user.setUserid("testid"); 
		user.setUserpw("testpw"); 
		user.setName("와아아");
		user.setPhone("010-1111-1111"); 
		user.setEmail("google@gmail.com");
		user.setZipcode("11111"); 
		user.setAddress1("기본주소");
		user.setAddress2("상세 주소 수정");
		int count = mapper.update(user);
		
		log.info("update count: " + count);
		
	}
	*/
	/*
	 * @Test public void testGetList() { mapper.getList().forEach(user ->
	 * log.info(user)); }
	 */

	/*
	 * @Test public void testInserSql() {
	 * 
	 * UserVO user = new UserVO();
	 * 
	 * user.setUserid("testid01"); user.setUserpw("testpw"); user.setName("테스트");
	 * user.setPhone("010-1111-1111"); user.setEmail("google@gmail.com");
	 * user.setZipcode("11111"); user.setAddress1("기본주소");
	 * user.setAddress2("기본주소2");
	 * 
	 * mapper.insert(user);
	 * 
	 * log.info(user);
	 * 
	 * }
	 */
}
