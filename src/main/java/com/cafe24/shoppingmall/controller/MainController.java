package com.cafe24.shoppingmall.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.shoppingmall.service.ProductService;
import com.cafe24.shoppingmall.vo.ProductVo;

@Controller
@RequestMapping("/")
public class MainController {
	
	private ProductService productService;
	
	@RequestMapping("")
	public String main(Model model) {
		productService = new ProductService();
		
		List<ProductVo> list  = productService.getSearchProductList("empty", 0L, 1, 30); 
		model.addAttribute("productList", list);
		
		return "main/index";
	}
}
