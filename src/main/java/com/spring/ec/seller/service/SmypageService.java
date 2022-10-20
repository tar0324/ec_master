package com.spring.ec.seller.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreinfosumVO;

public interface SmypageService {
	public int checkuser(Map<String, Object> listMap) throws Exception;
	public SellerVO sellerinfo(String seller_id) throws Exception;
}