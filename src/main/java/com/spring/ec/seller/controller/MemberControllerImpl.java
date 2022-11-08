package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.service.MemberService;
import com.spring.ec.seller.vo.SellerVO;

@Controller("sellerController")
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memService;
	@Autowired
	SellerVO sellerVO;
	
	//로그인 화면 이동
	@Override
	@RequestMapping(value = "/seller/member/loginForm.do", method = RequestMethod.GET)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/seller/member/s_regadmin.do", method = RequestMethod.GET)
	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; 
	}
	
	@Override
	@RequestMapping(value = "/seller/member/memberForm_sdetail.do", method = RequestMethod.GET)
	public ModelAndView memberform_sdetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;

	}
	
	//회원가입
	@Override
	@RequestMapping(value = "/seller/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") SellerVO sellerVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result = 0;
		sellerVO.setKeyword(request.getParameter("keyword"));
		result = memService.addMember(sellerVO);
		ModelAndView mav = new ModelAndView("redirect:/seller/member/loginForm.do");
		return mav;
	}
	
	//로그인
	@Override
	@RequestMapping(value = "/seller/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") SellerVO sellerVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		sellerVO = memService.login(sellerVO);
		if (sellerVO != null) { 
			HttpSession session = request.getSession();
			session.setAttribute("sellerMember", sellerVO);
			session.setAttribute("isLogOn", true);

			mav.setViewName("redirect:/sellerMain"); 
		} else {
			rAttr.addFlashAttribute("result", "loginFailed"); 
			mav.setViewName("redirect:/seller/member/loginForm.do"); 
		}
		return mav;
	}
	
	
	//로그아웃
	@Override
	@RequestMapping(value = "/seller/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("sellerMember");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/seller/member/loginForm.do");
		return mav;
	}
	
	
	



}