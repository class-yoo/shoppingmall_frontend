package com.cafe24.shoppingmall.test;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.vo.CategoryVo;
import com.cafe24.shoppingmall.vo.ProductVo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class ProductRestTemplate {

	RestTemplate restTemplate;

	public ProductRestTemplate() {
		restTemplate = new RestTemplate();
	}

	public List<ProductVo> selectSearchProductList(String keyword, Long categoryNo, int startPageNum,
			int showProductNum) {
		
		// ProductList형태로 바로 역직렬화 시켜주려면 
		ResponseEntity<JSONResult<List<ProductVo>>> response = restTemplate.exchange(
				"http://localhost:8080/shoppingmall-backend/product/list/{keyword}/{categoryNo}/{curPageNum}/{showProductNum}",
				  HttpMethod.GET,
				  null,
				  new ParameterizedTypeReference<JSONResult<List<ProductVo>>>(){},  keyword, categoryNo, startPageNum, showProductNum);
		
		JSONResult jsonResult = response.getBody();
		List<ProductVo> list = (List<ProductVo>)jsonResult.getData();
//		String result = restTemplate.getForObject(
//				"http://localhost:8080/shoppingmall-backend/product/list/{keyword}/{categoryNo}/{curPageNum}/{showProductNum}",
//				String.class, keyword, categoryNo, startPageNum, showProductNum);
//		
//		
//		Gson gson = new Gson();
//		JSONResult jsonResult = gson.fromJson(result, JSONResult.class);
//		List<ProductVo> list = gson.fromJson(gson.toJson(jsonResult.getData()), new TypeToken<List<ProductVo>>() {}.getType());
		System.out.println(jsonResult.getData());
		System.out.println(jsonResult);
		System.out.println(list.size());
		return null;
	}

}
