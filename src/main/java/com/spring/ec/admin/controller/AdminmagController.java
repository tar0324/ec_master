package com.spring.ec.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminmagController {
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
