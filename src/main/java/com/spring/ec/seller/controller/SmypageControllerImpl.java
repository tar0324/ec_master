package com.spring.ec.seller.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.service.InfoService;
import com.spring.ec.seller.service.SmypageService;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreinfosumVO;


@Controller("smypageController")
public class SmypageControllerImpl implements SmypageController  {
	private static final String MENU_IMAGE_REPO="C:\\EATSEE\\menu_image";
	private static final Logger logger = LoggerFactory.getLogger(SmypageControllerImpl.class);
	@Autowired
	private SmypageService smypageService;
	@Autowired
	private InfoService infoService;
	
	
	
	// 본인확인창
	@Override
	@RequestMapping(value = "/checkuserpage.do", method = RequestMethod.GET)
	public ModelAndView checkuserpage(@RequestParam("code") String code,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("code", code);
		mav.setViewName(viewName);
		return mav; 
	}
	
	// 본인확인
	@Override
	@RequestMapping(value = "/checkuser.do", method = RequestMethod.POST)
	public ModelAndView checkuser(@RequestParam("seller_pw") String seller_pw, @RequestParam("code") String code,RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		//MemberVO mm = (MemberVO) session.getAttribute("member");
		//String seller_id = mm.getSeller_id());
		
		String seller_id = "stest001";
		listMap.put("seller_id", seller_id);
		listMap.put("seller_pw", seller_pw);
		
		int result = smypageService.checkuser(listMap);
		
		if(result == 1) { 
			if(code.equals("info")) {
				mav.setViewName("redirect:/smypage.do");
			} else if(code.equals("pwd")) {
				rAttr.addFlashAttribute("result", "pwdsuccess");
				mav.setViewName("redirect:/changepwdpage.do");
			} else {
				rAttr.addFlashAttribute("result", "pwdfail");
				mav.setViewName("redirect:/error.do");
			}
 
		} else { 
			rAttr.addFlashAttribute("result", "pwdfail");
			mav.setViewName("redirect:/checkuserpage.do?code=" + code);
		}
		return mav; 
	}
	
	
	// 정보수정창
	@Override 
	@RequestMapping(value = "/smypage.do", method = RequestMethod.GET)
	public ModelAndView smypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		//session에 남아있는 sellerid를 가져와야함
		//MemberVO mm = (MemberVO) session.getAttribute("member");
		//String seller_id = mm.getSeller_id());
		
		String seller_id = "stest001";
		
		//해당 가게의 찜,리뷰,예약 조회
		StoreinfosumVO infosum = infoService.selectinfosum(seller_id);
		SellerVO seller = smypageService.sellerinfo(seller_id);
		StoreinfosumVO sellerdetail = smypageService.sellerdetail(seller_id);
		
		
		//가게 소개가 등록되어있는지 확인
		Integer storeinfonum = sellerdetail.getStoreInfo_num();
		int infostatus;
	
		
		if(storeinfonum == null) {
			infostatus = 0;
			
			sellerdetail.setImage_fileName("no_store_img.png");
			sellerdetail.setStore_introduce("가게 소개를 등록해주세요.");
			sellerdetail.setOpenTime("영업 시간을 등록해주세요.");
			sellerdetail.setCloseDay("휴무일을 등록해주세요.");
			sellerdetail.setStore_nic("상호명을 등록해주세요.");
			sellerdetail.setStore_benefit("편의 시설을 등록해주세요.");

		} else {
			infostatus = 1;
		}
		
		mav.addObject("infosum", infosum);
		mav.addObject("seller", seller);
		mav.addObject("sellerinfo", sellerdetail);
		mav.addObject("infostatus", infostatus);
		mav.setViewName(viewName);
		return mav; 
	}
	
	// 비밀번호 변경창
	@Override 
	@RequestMapping(value = "/changepwdpage.do", method = RequestMethod.GET)
	public ModelAndView changepwdpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; 
	}
	
	
	// change pwd
	@Override 
	@RequestMapping(value = "/changepwd.do", method = RequestMethod.POST)
	public ModelAndView changepwd(@RequestParam("seller_pw") String seller_pw,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		//MemberVO mm = (MemberVO) session.getAttribute("member");
		//String seller_id = mm.getSeller_id());
		
		String seller_id = "stest001";
		listMap.put("seller_id", seller_id);
		listMap.put("seller_pw", seller_pw);
		
		int result = smypageService.changepwd(listMap);
		
		
		if(result == 1) { 
			//세션 끊어서 다시 로그인하기
			session.removeAttribute("member");
			session.removeAttribute("isLogOn");
			rAttr.addFlashAttribute("result", "pwdchagesuccess");
			mav.setViewName("redirect:/sellerMain");   //로그인으로 가야됨(임시)
 
		} else { 
			rAttr.addFlashAttribute("result", "pwdchangefail");
			mav.setViewName("redirect:/error.do");
		}
		
		return mav; 
	}
	

	

}