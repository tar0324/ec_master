package com.spring.ec.seller.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.dao.SmypageDAO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreinfosumVO;

@Service("smypageService")
public class SmypageServiceImpl implements SmypageService {
	@Autowired
	SmypageDAO smypageDAO;
	
	//pwd check
	@Override
	public int checkuser(Map<String, Object> listMap) throws Exception {
		return smypageDAO.checkuser(listMap);
	}
	
	//select seller info
	@Override
	public SellerVO sellerinfo(String seller_id) throws Exception {
		return smypageDAO.sellerinfo(seller_id);
	}
	
	//select seller detail info
	@Override
	public StoreinfosumVO sellerdetail(String seller_id) throws Exception {
		return smypageDAO.sellerdetail(seller_id);
	}

	//pwd change
	@Override
	public int changepwd(Map<String, Object> listMap) throws Exception {
		return smypageDAO.changepwd(listMap);
	}

	

}