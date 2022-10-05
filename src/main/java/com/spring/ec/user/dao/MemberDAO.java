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

	// ����� �α���
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	// ȸ������
	public int insertMember(MemberVO memberVO) throws DataAccessException;

	// ��й�ȣ ã��
	public String find_pwd_Result(MemberVO memberVO) throws DataAccessException;

	// ���̵� ã��
	public String find_id_Result(MemberVO memberVO) throws DataAccessException;
	// ��������/�̺�Ʈ

}
