package com.spring.ec.seller.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.SellerVO;

@Repository("smypageDAO")
public class SmypageDAOImpl implements SmypageDAO {
	@Autowired
	private SqlSession sqlSession;


	//pwd check
	@Override
	public int checkuser(Map<String, Object> listMap) throws Exception {
		int checkuser = sqlSession.selectOne("mapper.seller.mypage.checkuser",listMap);
		return checkuser;
	}
	
	//select seller info
	@Override
	public SellerVO sellerinfo(String seller_id) throws Exception {
		SellerVO sellerinfo = sqlSession.selectOne("mapper.seller.mypage.sellerinfo",seller_id);
		return sellerinfo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}