package com.cafe24.shoppingmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.service.ProductService;
import com.cafe24.shoppingmall.vo.ProductVo;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value= "/list", method=RequestMethod.GET)
	public String list(Model model) {
		
		List<ProductVo> productList  = productService.getSearchProductList("empty", 0L, 1, 100);
		model.addAttribute("productList", productList);
		
		return "admin/product/list";
	}
	
	
	@RequestMapping(value= "/register", method=RequestMethod.GET)
	public String register(Model model) {
		return "admin/product/register";
	}
	
	@ResponseBody
	@RequestMapping(value= "/register", method=RequestMethod.POST)
	public JSONResult register(@RequestBody ProductVo productVo) {
		return productService.add(productVo);
	}
	
	@RequestMapping(value= "/remove", method=RequestMethod.GET)
	public String remove(@RequestParam Long productNo) {
		
		JSONResult removeResult =  productService.remove(productNo);
		
		return "redirect:/admin/product/list";
	}
	
}
