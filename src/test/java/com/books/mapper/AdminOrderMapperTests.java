package com.books.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import com.books.domain.Criteria;
import com.books.domain.OrderVO;
import com.books.mapper.AdminOrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/web-inf/spring/root-context.xml"})
@Log4j
public class AdminOrderMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private AdminOrderMapper mapper;
	
	//@Test
	public void testCount() {
		Criteria cri = new Criteria();
		cri.setKw_name("testset");
		cri.setKw_date_from("");
		cri.setKw_orderid("");
		cri.setKw_date_to("");
		log.warn(mapper.getHasOrderCount(cri));
	}
	
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKw_date_from("2019-12-05");
		cri.setKw_date_to("2019-12-07");
		
		log.warn(mapper.getHasOrderCount(cri));
		
		List<OrderVO> list = mapper.getLatestOrderListWithPaging(cri);
		
		list.forEach(orderList -> log.warn(orderList));
	}
}
