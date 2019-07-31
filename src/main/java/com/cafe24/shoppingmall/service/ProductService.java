package com.cafe24.shoppingmall.service;

import java.util.List;


import com.cafe24.shoppingmall.test.ProductRestTemplate;
import com.cafe24.shoppingmall.vo.OptionVo;
import com.cafe24.shoppingmall.vo.ProductImage;
import com.cafe24.shoppingmall.vo.ProductVo;

public class ProductService {
	
	private ProductRestTemplate productRestTemplate;
	
	public ProductService() {
		productRestTemplate = new ProductRestTemplate();
	}
	
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
		
		return productRestTemplate.selectSearchProductList(keyword, categoryNo, startPageNum, showProductNum);
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
