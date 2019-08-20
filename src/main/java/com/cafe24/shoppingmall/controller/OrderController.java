package com.cafe24.shoppingmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.service.CartService;
import com.cafe24.shoppingmall.service.OrderService;
import com.cafe24.shoppingmall.vo.CartVo;
import com.cafe24.shoppingmall.vo.OrderVo;
import com.cafe24.shoppingmall.vo.UserVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value ="", method=RequestMethod.GET)
	public String getCartListByCartNos(Model model,
			@RequestParam(value="cartNo") List<Long> cartNoList) {
		
		List<CartVo> cartList =  cartService.getCartListByCartNos(cartNoList);
		model.addAttribute("cartList", cartList);
		
		return "order/order";
	}
	
	@RequestMapping(value ="", method=RequestMethod.POST)
	public String getCartListByCartNos(Model model,
			@ModelAttribute OrderVo orderVo, HttpSession session, @CookieValue(value = "cookieId", defaultValue = "-1") String cookieId) {

		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		String userId = authUser != null ? authUser.getId() : cookieId;
		orderVo.setUserId(userId);
		
		JSONResult orderResult =  orderService.order(orderVo);
		
		return "redirect:/";
	}
	
	
}
