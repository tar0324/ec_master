package com.spring.ec.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.ec.user.dao.MemberDAO;
import com.spring.ec.user.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO userDAO;

	// 회원기능
	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException {
		return userDAO.loginById(memberVO);
	}

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return userDAO.insertMember(member);
	}

	@Override
	public String find_pwd_Result(MemberVO member) throws DataAccessException {
		return userDAO.find_pwd_Result(member);
	}

	@Override
	public String find_id_Result(MemberVO member) throws DataAccessException {
		return userDAO.find_id_Result(member);
	}

}
