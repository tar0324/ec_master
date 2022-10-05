package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MypageController {
	//마이페이지
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지- 플레이리스트 작성 글 확인
	public ModelAndView myplist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지 - 리뷰 확인
	public ModelAndView uReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지 - 예약 확인
	public ModelAndView uBook(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지 - 찜목록
	public ModelAndView uLike(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지 - 1대1문의
	public ModelAndView uAsk(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//마이페이지 - 최근 본 목록
	public ModelAndView recentView(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
