package com.spring.ec.user.controller;

import java.io.File;

import java.util.Iterator;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.user.service.MemberService;
import com.spring.ec.user.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	private static final String U_IMAGE_REPO = "C:\\board\\u_board_imagefile";
	public static final int pagePerList = 10;
	public static final int pagingCount = 10;
	@Autowired
	private MemberService memService;
	@Autowired
	MemberVO memberVO;

	// 메인 페이지
	@Override
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String image_fileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image_fileName = mFile.getOriginalFilename();
			System.out.println("upload=" + image_fileName);
			File file = new File(U_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(U_IMAGE_REPO + "\\" + "temp" + "\\" + image_fileName));
				}
			}
		}
		return image_fileName;
	}

	// 로그인
	@Override
	@RequestMapping(value = "/user/loginForm.do", method = RequestMethod.GET)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/memberForm_main.do", method = RequestMethod.GET)
	public ModelAndView memberform_main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;

	}

	@Override
	@RequestMapping(value = "/user/memberForm_udetail.do", method = RequestMethod.GET)
	public ModelAndView memberform_udetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName"); /* intercepotor getviewName메서드이용 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; /* ModelAndView객체 이용하여 값을 전달 */
	}

	@Override
	@RequestMapping(value = "/user/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memService.login(member);
		if (memberVO != null) { /* DB에 있는 값과 일치하지않으면 */
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			if (action != null) {
				mav.setViewName("redirect:" + action); /* action도메인 비어있음 */
			} else {
				mav.setViewName("redirect:/main.do"); /* 로그인 성공시 */
			}
		} else {
			rAttr.addFlashAttribute("result", "loginFailed"); /* login.jsp의 loginFailed <choose>구문 실행 */
			mav.setViewName("redirect:/user/loginForm.do"); /* login.jsp redirect한다 */
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/u_regadmin.do", method = RequestMethod.GET)
	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result = 0;
		result = memService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/find_id.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * interceptor에서 gitviewname()메서드 잘라낸 도메인(viewName)을 setAttribute한걸
		 * getAttribute로받음
		 */
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/find_id_Result.do", method = RequestMethod.POST)
	public ModelAndView find_id_Result(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		String user_id = memService.find_id_Result(member);

		ModelAndView mav = new ModelAndView();
		mav.addObject("user_id", user_id);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/find_pwd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView find_pwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * interceptor에서 gitviewname()메서드 잘라낸 도메인(viewName)을 setAttribute한걸
		 * getAttribute로받음
		 */
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/find_pwd_Result.do", method = RequestMethod.POST)
	public ModelAndView find_pwd_Result(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		String user_pwd = memService.find_pwd_Result(member);

		ModelAndView mav = new ModelAndView();
		mav.addObject("user_pwd", user_pwd);
		mav.setViewName(viewName);
		return mav;
	}

}
