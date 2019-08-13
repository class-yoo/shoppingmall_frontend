package com.cafe24.shoppingmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.util.APIServerURL;
import com.cafe24.shoppingmall.vo.CartVo;

@Service
public class CartService {
	
	@Autowired
	private RestTemplate restTemplate;
	
	public JSONResult add(Map<String, Object> cartMap) {
		
		String endpoint = APIServerURL.getContextURL()+"/cart";
		
		HttpEntity<Map<String, Object>> request = new HttpEntity<>(cartMap);
			      
		ResponseEntity<JSONResult> response = restTemplate
			            .exchange(endpoint, HttpMethod.POST, request, JSONResult.class);
			      
		return response.getBody();
	}
 	
	public List<CartVo> getCartListByUserId(String userId) {
		
		String endpoint = APIServerURL.getContextURL()+"/cart/list/{userId}";
		
		ResponseEntity<JSONResult> response = restTemplate.exchange(
				endpoint, HttpMethod.GET, null,
				  new ParameterizedTypeReference<JSONResult>(){}, userId);
		
		@SuppressWarnings("unchecked")
		List<CartVo> cartList = (List<CartVo>)response.getBody().getData();
		
		return cartList;
		
	}

	public JSONResult modify(CartVo cartVo) {
		String endpoint = APIServerURL.getContextURL()+"/cart";
		
		HttpEntity<CartVo> request = new HttpEntity<>(cartVo);
			      
		ResponseEntity<JSONResult> response = restTemplate.exchange(
				endpoint, HttpMethod.PUT, null,
				  new ParameterizedTypeReference<JSONResult>(){});
		
		return response.getBody();
		
	}
	
	public JSONResult remove(Long cartNo) 
	{
		String endpoint = APIServerURL.getContextURL()+"/cart/{cartNo}";
		
		ResponseEntity<JSONResult> response = restTemplate.exchange(
				endpoint, HttpMethod.DELETE, null,
				  new ParameterizedTypeReference<JSONResult>(){}, cartNo);
		
		return response.getBody();
	}

}
