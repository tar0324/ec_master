package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.NoticeVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface MemberService {
	//회원가입
	public int addMember(MemberVO memberVO) throws DataAccessException; 
	//로그인
	public MemberVO login(MemberVO member)throws DataAccessException;
	//비밀번호 찾기
	public String find_pwd_Result(MemberVO member) throws DataAccessException;
	//아이디 찾기
	public String find_id_Result(MemberVO member) throws DataAccessException;

}
