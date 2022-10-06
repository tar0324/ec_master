package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MypageController {
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myplist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uBook(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uLike(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uAsk(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView recentView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myinfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
