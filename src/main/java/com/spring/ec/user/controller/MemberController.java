package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.user.vo.MemberVO;

public interface MemberController {
	// 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쌨소듸옙
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 회占쏙옙占쏙옙占�
	// 占싸깍옙占쏙옙 창 占쏙옙占쏙옙(占쏙옙占쏙옙/占쏙옙占쏙옙 占쏙옙占쏙옙)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 占쏙옙占쏙옙 占싸깍옙占쏙옙창
	public ModelAndView memberform_main(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 占쏙옙占쏙옙 회占쏙옙占쏙옙占쏙옙 占쏙옙
	public ModelAndView memberform_udetail(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 占쏙옙占쏙옙 占싸깍옙占쏙옙
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 회占쏙옙占쏙옙占쏙옙 占쏙옙占�
	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 占싸그아울옙
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 占쏙옙占싱듸옙 찾占쏙옙
//	public String idCheck(@RequestBody String filterJSON, HttpServletResponse response, ModelMap model) throws Exception;
	public String idCheck(HttpServletRequest request) throws Exception;

	public String nickCheck(HttpServletRequest request) throws Exception;
	
	 public String emailCheck(HttpServletRequest request) throws Exception;
	
	 public String mobileCheck(HttpServletRequest request) throws Exception;

	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 占쏙옙占싱듸옙 찾占쏙옙 占쏙옙占시�
	public ModelAndView find_id_Result( HttpServletRequest request,HttpServletResponse response) throws Exception;

	// 占쏙옙橘占싫� 찾占쏙옙
	public ModelAndView find_pwd(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 占쏙옙橘占싫� 찾占쏙옙 占쏙옙占� 창
	public ModelAndView find_pwd_Result(HttpServletRequest request,HttpServletResponse response) throws Exception;

}