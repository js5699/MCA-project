package com.books.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.books.service.ProductService;
import com.books.domain.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Controller
@Log4j
public class ProductController {
	
	private ProductService service; 
	
	//책 리스트
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void allList(Model model) throws Exception {
		
		log.info("get product list");
		
		List<ProductVO> productlist = service.allList();
		
		/*
		 * log.info("get cid"); List<CidVO> cidlist = service.cid();
		 * log.warn("cidlist: "+ cidlist);
		 * 
		 * model.addAttribute("cid", cidlist);
		 */
		model.addAttribute("list", productlist);  		
	}
	
	//카테고리별 리스트
	@RequestMapping(value ="/shop/list", method = RequestMethod.GET)
	public void cidList(@RequestParam("cid") String cid, Model model) throws Exception {
		
		log.info("get cidlist");
		
		List<ProductVO> productlist = null; 
		
		productlist = service.cidList(cid);
		
		model.addAttribute("list", productlist);  		
	}
	
	
	
	//책 상세정보
	 @RequestMapping(value = "shop/productDetail", method = RequestMethod.GET)
	 public void getproduct(@RequestParam("pid") String productid, Model model)throws Exception{
	 
		 log.info("get productDetail");
		 
		 ProductVO product = service.getProduct(productid);
		 
		 model.addAttribute("product", product); 
	 }
	
	
	//예제 모음 
	@GetMapping("/excollection")
	public void excollection() {
				
			
		} 
	 
}
