package com.cafe24.shoppingmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall.dto.CartDTO;
import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.util.APIServerURL;
import com.cafe24.shoppingmall.vo.CartVo;
import com.cafe24.shoppingmall.vo.OrderVo;

@Service
public class OrderService {

	@Autowired
	private RestTemplate restTemplate;

	public List<OrderVo> getOrderList() {
		
		String endpoint = APIServerURL.getContextURL()+"/order/list";
		
		ResponseEntity<JSONResult> response = restTemplate.exchange(
				endpoint, HttpMethod.GET, null,
				  new ParameterizedTypeReference<JSONResult>(){});
		
		@SuppressWarnings("unchecked")
		List<OrderVo> orderList = (List<OrderVo>)response.getBody().getData();
		
		return orderList;
	}

	public JSONResult order(OrderVo orderVo) {
		
		String endpoint = APIServerURL.getContextURL() + "/order";

		HttpEntity<OrderVo> request = new HttpEntity<>(orderVo);
		
		ResponseEntity<JSONResult> response = restTemplate.exchange(endpoint, HttpMethod.POST, request,
				JSONResult.class);
		
		return response.getBody();
	}

}
