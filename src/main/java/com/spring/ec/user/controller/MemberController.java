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
	//����� ���������� ���� �޼ҵ�
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	//ȸ�����
	//�α��� â ����(����/���� ����)
	public ModelAndView loginform( HttpServletRequest request,HttpServletResponse response) throws Exception;
	//���� �α���â
	public ModelAndView memberform_main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//���� ȸ������ ��
	public ModelAndView memberform_udetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//���� �α���
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//ȸ������ ���
	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//�α׾ƿ�
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//ȸ������ ����
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//���̵� ã��
	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// ���̵� ã�� ���â
	public ModelAndView find_id_Result(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//��й�ȣ ã��
	public ModelAndView find_pwd(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//��й�ȣ ã�� ��� â
	public ModelAndView find_pwd_Result(@ModelAttribute("member") MemberVO member, HttpServletRequest request,HttpServletResponse response) throws Exception;
	

	
	
	
}
