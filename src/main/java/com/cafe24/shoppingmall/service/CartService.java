package com.cafe24.shoppingmall.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall.dto.CartDTO;
import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.util.APIServerURL;
import com.cafe24.shoppingmall.vo.CartVo;
import com.cafe24.shoppingmall.vo.OrderVo;

@Service
@Transactional
public class CartService {
	
	@Autowired
	private RestTemplate restTemplate;
	
	public JSONResult add(CartDTO cartDTO) {
		
		String endpoint = APIServerURL.getContextURL()+"/cart";
		
		HttpEntity<CartDTO> request = new HttpEntity<>(cartDTO);
			      
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
	
	public List<CartVo> getCartListByCartNos(List<Long> cartNoList) {
		
		String endpoint = APIServerURL.getContextURL()+"/cart/{cartNo}";
		List<CartVo> cartList  = new ArrayList<CartVo>();
		
		for(Long cartNo : cartNoList) {
			ResponseEntity<JSONResult<CartVo>> response = restTemplate.exchange(
					endpoint, HttpMethod.GET, null,
					  new ParameterizedTypeReference<JSONResult<CartVo>>(){}, cartNo);
			
			cartList.add((CartVo)response.getBody().getData());
		}
		
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
