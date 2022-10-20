package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.vo.SellerVO;


public interface SmypageController {
	public ModelAndView checkuserpage(@RequestParam("code") String code,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView checkuser(@RequestParam("seller_pw") String seller_pw,@RequestParam("code") String code,RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView smypage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView changepwdpage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView changepwd(@RequestParam("seller_pw") String seller_pw,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}