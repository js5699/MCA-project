package com.books.util;

import java.net.URI;

import org.junit.Test;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.extern.log4j.Log4j;

@Log4j
public class UriComponentTests {


	@Test
	public void testURI() throws Exception{
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/adminOrder/detail?orderid=20191206102")
				.queryParam("pageNum", "1")
				.queryParam("kw_name", "testset")
				.queryParam("kw_orderid", "")
				.queryParam("kw_date_from", "2019-12-10")
				.queryParam("kw_date_to", "2019-12-31")
				.build();

		//log.warn("/adminOrder/detail?orderid=20191206102?");
		log.warn(uriComponents.toUriString());
		
	}
	
}
