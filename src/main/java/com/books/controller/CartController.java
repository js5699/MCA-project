package com.books.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.books.domain.CartListVO;
import com.books.domain.CartVO;
import com.books.service.CartService;
import com.books.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Controller
@Log4j
@RequestMapping("/shop/*")
public class CartController {

	private CartService service;

	// Ïπ¥Ìä∏ ?ã¥Í∏?
	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart /* HttpSession session */) throws Exception {

		int result = 0;

		log.warn(cart);
		service.addCart(cart);

		return result;
	}

	// Ïπ¥Ìä∏ ?àò?üâ ?àò?†ï
	@ResponseBody
	@RequestMapping(value = "/modifyCart", method = RequestMethod.POST)
	public int modifyCart(@RequestParam(value = "chbox[]") List<String> chArr, CartVO cart /* HttpSession session */)
			throws Exception {

		int result = 0;
		int cartNum = 0;

		log.warn("modifyCart");
		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			cart.setCartNum(cartNum);
			service.modifyCart(cart);
			log.warn(chArr);
			log.warn(cart);

		}
		log.warn(cart);

		return result;
	}

	// Ïπ¥Ìä∏ Î¶¨Ïä§?ä∏
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public void cartList(Model model/* HttpSession session */) throws Exception {
		log.warn("get cart list");

		List<CartListVO> cartList = service.cartList();
		if (cartList.isEmpty()) { //cartList nullÍ∞? ?ôï?ù∏ ?Üµ?ï¥ ?û•Î∞îÍµ¨?ãà ?óÜ?ùå ?ëú?ãú
			String notice = "nocart";
			model.addAttribute("nocart", notice);
			log.warn("model:" + model);
		}else{
			model.addAttribute("cartList", cartList);
			log.warn("model:" + model);

		}

	}

	// Ïπ¥Ìä∏ ?Ç≠?†ú
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int delectCart(@RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {

		log.warn("delete cart");

		log.warn(chArr);
		log.warn(cart);

		int result = 0;
		int cartNum = 0;

		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			cart.setCartNum(cartNum);
			service.delectCart(cart);
			log.warn(chArr);
			log.warn(cart);
		}
		log.warn(result);
		return result;
	}	

}
