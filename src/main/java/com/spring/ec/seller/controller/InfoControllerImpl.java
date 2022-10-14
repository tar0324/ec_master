package com.spring.ec.seller.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.service.InfoService;
import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.StoreinfosumVO;


@Controller("infoController")
public class InfoControllerImpl implements InfoController  {
	private static final Logger logger = LoggerFactory.getLogger(InfoControllerImpl.class);
	@Autowired
	private InfoService infoService;
	
	
	// 에러페이지 이동
	@Override
	@RequestMapping(value = "/error.do", method = RequestMethod.GET)
	public ModelAndView error(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; 
	}
	
	
	// 메뉴관리
	@Override
	@RequestMapping(value = "/menumanage.do", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		//session에 남아있는 sellerid를 가져와야함
		//MemberVO mm = (MemberVO) session.getAttribute("member");
		//String seller_id = mm.getSeller_id());
		
		String seller_id = "stest001";
		
		//해당 가게의 찜,리뷰,예약 조회
		StoreinfosumVO infosum = infoService.selectinfosum(seller_id);
		
		//해당 가게 메뉴 리스트
		List<ProductVO> MenuList = infoService.selectMenu(seller_id);
		
		mav.addObject("infosum", infosum);
		mav.addObject("menuList", MenuList);
		mav.setViewName(viewName);
		return mav; 
	}
	
	
	
	// 메뉴관리 - 검색

	@Override
	@ResponseBody 
	@RequestMapping(value = "/searchmenu.do", method = RequestMethod.GET)
	public ModelAndView searchmenu(@RequestParam("search") String search,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		Map<String, String> listMap = new HashMap<String, String>();
		//session에 남아있는 sellerid를 가져와야함
		//MemberVO mm = (MemberVO) session.getAttribute("member");
		//String seller_id = mm.getSeller_id());
		
		String seller_id = "stest001";
		listMap.put("seller_id", seller_id);
		listMap.put("search", search);
		
		List<ProductVO> MenuList = infoService.selectsearchMenu(listMap);
		
		mav.addObject("menuList", MenuList);
		mav.setViewName(viewName);
		return mav; 
	}
	
	// 메뉴관리 - 삭제
	@Override
	@ResponseBody 
	@RequestMapping(value = "/deletemenu.do", method = RequestMethod.GET)
	public ModelAndView deletemenu(@RequestParam("menucheck") String params,  RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		//MemberVO mm = (MemberVO) session.getAttribute("member");
		//String seller_id = mm.getSeller_id());
		String[] memuList = params.split(",");
		
		String seller_id = "stest001";
		listMap.put("seller_id", seller_id);
		listMap.put("params", memuList);
		
		int result = infoService.deletemenu(listMap);
		if(result >= 1) { 
			rAttr.addFlashAttribute("result", "deletesuccess");
			mav.setViewName("redirect:/menumanage.do"); 
		} else { 
			rAttr.addFlashAttribute("result", "deletefail");
			mav.setViewName("redirect:/error.do");
		}

		return mav; 
	}
	
	
	// 메뉴관리 - 상세페이지
	@Override
	@RequestMapping(value = "/menudetail.do", method = RequestMethod.POST)
	public @ResponseBody  ProductVO menudetail(@RequestParam("pro_num") String pro_num,HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = (String) request.getAttribute("viewName");
		Map<String, String> listMap = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		//MemberVO mm = (MemberVO) session.getAttribute("member");
		//String seller_id = mm.getSeller_id());
		
		String seller_id = "stest001";
		listMap.put("seller_id", seller_id);
		listMap.put("pro_num", pro_num);
		
		ProductVO menudetail = infoService.menudetail(listMap);
		
		//mav.addObject("menudetail", menudetail);
		//mav.setViewName(viewName);

		return menudetail; 
	}
	
	
	
	
	
	
	

}