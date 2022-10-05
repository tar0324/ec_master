package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.NoticeVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface MemberDAO {

	// 사용자 로그인
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	// 회원가입
	public int insertMember(MemberVO memberVO) throws DataAccessException;

	// 비밀번호 찾기
	public String find_pwd_Result(MemberVO memberVO) throws DataAccessException;

	// 아이디 찾기
	public String find_id_Result(MemberVO memberVO) throws DataAccessException;
	// 공지사항/이벤트

}
