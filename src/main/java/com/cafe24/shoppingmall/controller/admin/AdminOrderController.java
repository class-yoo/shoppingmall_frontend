package com.cafe24.shoppingmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.shoppingmall.service.CartService;
import com.cafe24.shoppingmall.service.OrderService;
import com.cafe24.shoppingmall.vo.CartVo;
import com.cafe24.shoppingmall.vo.OrderVo;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {
	
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping(value ="/list", method=RequestMethod.GET)
	public String getCartListByCartNos(Model model) {
		
		List<OrderVo> orderList =  orderService.getOrderList();
		model.addAttribute("orderList", orderList);
		
		return "admin/order/list";
	}
	
	
	
}
