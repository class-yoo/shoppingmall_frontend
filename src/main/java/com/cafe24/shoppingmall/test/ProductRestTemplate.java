package com.cafe24.shoppingmall.test;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.vo.CategoryVo;
import com.cafe24.shoppingmall.vo.ProductVo;

public class ProductRestTemplate {

	RestTemplate restTemplate;

	public ProductRestTemplate() {
		restTemplate = new RestTemplate();
	}

	public List<ProductVo> selectSearchProductList(String keyword, Long categoryNo, int startPageNum,
			int showProductNum) {
		
		ResponseEntity<JSONResult> response = restTemplate.exchange(
				"http://localhost:8080/shoppingmall-backend/product/list/{keyword}/{categoryNo}/{curPageNum}/{showProductNum}",
				  HttpMethod.POST,
				  null,
				  new ParameterizedTypeReference<JSONResult>(){},  keyword, categoryNo, startPageNum, showProductNum);
		
		List<ProductVo> productList = (List<ProductVo>)response.getBody().getData();
		
//		String result = restTemplate.getForObject(
//				"http://localhost:8080/shoppingmall-backend/product/list/{keyword}/{categoryNo}/{curPageNum}/{showProductNum}",
//				String.class, keyword, categoryNo, startPageNum, showProductNum);
//		
//		
//		Gson gson = new Gson();
//		JSONResult jsonResult = gson.fromJson(result, JSONResult.class);
//		List<ProductVo> list = gson.fromJson(gson.toJson(jsonResult.getData()), new TypeToken<List<ProductVo>>() {}.getType());
		return productList;
	}

}
