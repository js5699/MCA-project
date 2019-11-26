package com.books.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/web-inf/spring/root-context.xml",
	"file:src/main/webapp/web-inf/spring/appServlet/servlet-context.xml"})
@Log4j
public class AccountControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	@Test
	public void testpwConfirm() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/account/pwConfirm")
				.param("userid", "testid")
				.param("userpw", "asdsda")
				).andReturn().getModelAndView().getViewName();
		
				log.info(resultPage);
	}
	
	/*
	@Test
	public void testMyPage() throws Exception {		//done
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/account/myPage")
				.param("userid", "testid")).andReturn().getModelAndView().getModelMap());
	}
	*/
	
	/*
	@Test
	public void testRegister() throws Exception {	//done
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/account/join")
				.param("userid", "controllertest")
				.param("userpw", "1234")
				.param("name", "테스트")
				.param("email", "test@test.com")
				.param("phone", "010-0000-0000")
				.param("zipcode", "12345")
				.param("address1", "1")
				.param("address2", "2")).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
		
	}
	*/
}
