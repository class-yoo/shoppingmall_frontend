package com.cafe24.shoppingmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cafe24.shoppingmall.service.ProductService;
import com.cafe24.shoppingmall.vo.ProductVo;

@Controller
@RequestMapping("/product")
public class ProductController {

	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value= "/detail" , method=RequestMethod.GET)
	public String detail(@RequestParam(value="productNo" , defaultValue="0") Long productNo,  Model model) {
		
		ProductVo product =  productService.getProductByProductNo(productNo);
		
		System.out.println(product);
		model.addAttribute("product", product);
		
		return "product/detail";
	}
	
	
	@RequestMapping(value= "/register", method=RequestMethod.GET)
	public String register(Model model) {
		return "product/register";
	}
	
}
