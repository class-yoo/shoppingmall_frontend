package com.cafe24.shoppingmall.controller;

import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.shoppingmall.dto.CartDTO;
import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.service.CartService;
import com.cafe24.shoppingmall.vo.CartVo;
import com.cafe24.shoppingmall.vo.UserVo;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public JSONResult add(@RequestBody CartDTO cartDTO, HttpSession session, HttpServletResponse response,
			@CookieValue(value = "cookieId", defaultValue = "-1") String cookieId) {
			
		UserVo userVo = null;
		String userId = null;
		if (session != null) {
			userVo = (UserVo) session.getAttribute("authUser");
		}
		if (userVo != null) {
			userId = userVo.getId();
		} else {
			if ("-1".equals(cookieId)) {
				String newCookieId = getGenerateCookieId();
				Cookie newCookie = new Cookie("cookieId", newCookieId);
				newCookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효기간 = 1주일
				response.addCookie(newCookie);
				userId = newCookieId;
			} else {
				userId = cookieId;
			}
		}
		
		cartDTO.setUserId(userId);
		
		return cartService.add(cartDTO);
	}
	
	@ResponseBody
	@RequestMapping(value= "/remove", method=RequestMethod.GET)
	public JSONResult remove(@RequestParam Long cartNo) {
		
		return cartService.remove(cartNo);
	}
	
	@ResponseBody
	@RequestMapping(value= "/modify", method=RequestMethod.GET)
	public JSONResult modify(@RequestBody CartVo cartVo) {
		
		return cartService.modify(cartVo);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getCartListByUserId(HttpSession session,
			@CookieValue(value = "cookieId", defaultValue = "-1") String cookieId, Model model) {
		
		UserVo userVo = null;

		if (session != null) {
			userVo = (UserVo) session.getAttribute("authUser");
		}
		
		String userId = userVo != null ? userVo.getId() : cookieId;
		
		List<CartVo> cartList = null;
		if(!"-1".equals(userId)) {
			cartList = cartService.getCartListByUserId(userId);
		}
		
		model.addAttribute("cartList", cartList);
		
		return "cart/list";
	}

	public String getGenerateCookieId() {
		String firstCookieId = UUID.randomUUID().toString();
		String secondCookieId = "" + Calendar.getInstance().getTimeInMillis();
		String completedCookieId = firstCookieId+"-"+secondCookieId;
		return completedCookieId;
	}
}
