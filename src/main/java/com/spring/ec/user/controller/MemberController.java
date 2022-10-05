package com.spring.ec.user.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.user.vo.MemberVO;

public interface MemberController {
	//사용자 메인페이지 연결 메소드
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	//회원기능
	//로그인 창 직전(유저/셀러 구분)
	public ModelAndView loginform( HttpServletRequest request,HttpServletResponse response) throws Exception;
	//유저 로그인창
	public ModelAndView memberform_main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//유저 회원가입 폼
	public ModelAndView memberform_udetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//유저 로그인
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//회원가입 약관
	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//회원가입 실행
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//아이디 찾기
	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 아이디 찾기 결과창
	public ModelAndView find_id_Result(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//비밀번호 찾기
	public ModelAndView find_pwd(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//비밀번호 찾기 결과 창
	public ModelAndView find_pwd_Result(@ModelAttribute("member") MemberVO member, HttpServletRequest request,HttpServletResponse response) throws Exception;
	

	
	
	
}
