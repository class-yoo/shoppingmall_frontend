package com.cafe24.shoppingmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.util.BaseURL;
import com.cafe24.shoppingmall.vo.OptionVo;
import com.cafe24.shoppingmall.vo.ProductImage;
import com.cafe24.shoppingmall.vo.ProductVo;

@Service
public class ProductService {
	
	@Autowired
	private RestTemplate restTemplate;
	
	public boolean add(ProductVo productVo) {
		return true;
	}
 	
	public ProductVo getProductByProductNo(Long productNo) {
		return null;
	}

	public boolean modify(ProductVo productVo) {
		return true;
	}
	
	public boolean remove(Long productNo) {
		return true;
	}

	public Long getProductCount(String keyword, Long categoryNo) {
		return null;
	}	
	
	public List<ProductVo> getSearchProductList(String keyword, Long categoryNo, int startPageNum, int showProductNum) {
		
		String endpoint = BaseURL.getContextURL()+"/product/list/{keyword}/{categoryNo}/{curPageNum}/{showProductNum}";
		System.out.println();
		
		ResponseEntity<JSONResult> response = restTemplate.exchange(
				endpoint, HttpMethod.GET, null,
				  new ParameterizedTypeReference<JSONResult>(){},  keyword, categoryNo, startPageNum, showProductNum);
		
		@SuppressWarnings("unchecked")
		List<ProductVo> productList = (List<ProductVo>)response.getBody().getData();
		
//		JSONResult jsonResult = restTemplate.getForObject(endpoint, JSONResult.class,
//				keyword, categoryNo, startPageNum, showProductNum);
		
		return productList;
	}

	public boolean addImage(ProductImage productImage) {
		return true;
	}
	
	public boolean removeImage(Long imageNo) {
		return true;
	}

	public boolean addOption(OptionVo optionVo) {
		return true;
	}

	public boolean removeOption(Long productNo, Long optionNo, String optionValue) {
		return true;
	}

}
