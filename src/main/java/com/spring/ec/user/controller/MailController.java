package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;

public interface MailController {

	public String mailCheckPOST(String email,HttpServletRequest request) throws Exception;

	
	/*
	 * public void sendSimpleMail(HttpServletRequest request, HttpServletResponse
	 * response)throws Exception;
	 */

}
