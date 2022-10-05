package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.user.service.MypageService;
import com.spring.ec.user.vo.MemberVO;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	private static final String U_IMAGE_REPO = "C:\\board\\u_board_imagefile";
	public static final int pagePerList = 10;
	public static final int pagingCount = 10;
	@Autowired
	private MypageService mypageService;
	@Autowired
	MemberVO memberVO;
	
	// 마이페이지
	@Override
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/mypage";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/board/myplist.do", method = RequestMethod.GET)
	public ModelAndView myplist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/uReview.do", method = RequestMethod.GET)
	public ModelAndView uReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/uBook.do", method = RequestMethod.GET)
	public ModelAndView uBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/uLike.do", method = RequestMethod.GET)
	public ModelAndView uLike(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/uAsk.do", method = RequestMethod.GET)
	public ModelAndView uAsk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/recent_view.do", method = RequestMethod.GET)
	public ModelAndView recentView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/mypage/recent_view";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
