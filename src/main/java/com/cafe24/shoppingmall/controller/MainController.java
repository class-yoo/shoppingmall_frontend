package com.cafe24.shoppingmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.shoppingmall.service.ProductService;
import com.cafe24.shoppingmall.vo.ProductVo;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("")
	public String main(Model model) {
		
		List<ProductVo> productList  = productService.getSearchProductList("empty", 0L, 1, 30);
		
		model.addAttribute("productList", productList);
		
		return "main/index";
	}
}
