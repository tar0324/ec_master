package com.spring.ec.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@Override
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/mypage";
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		MemberVO mm = (MemberVO) session.getAttribute("member");
		String user_id = mm.getUser_id();
		
		//찜목록
		List wishList = mypageService.selectwish(user_id);
		//리뷰 리스트
		List ReviewList = mypageService.selectReview(user_id);
		//먹플리볼플리 리스트
		List BoardList = mypageService.selectBoard(user_id);
		//예약 리스트
		List BookList = mypageService.selectBook(user_id);
		//1:1문의 리스트
		List AskList = mypageService.selectAsk(user_id);
		
		mav.addObject("wishList", wishList);
		mav.addObject("reviewList", ReviewList);
		mav.addObject("boardList", BoardList);
		mav.addObject("bookList", BookList);
		mav.addObject("askList", AskList);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/my_pList.do", method = RequestMethod.GET)
	public ModelAndView myplist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();
		
      //먹플리볼플리 리스트
        List BoardList = mypageService.selectBoard(user_id);
        mav.addObject("boardList", BoardList);
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/uReview.do", method = RequestMethod.GET)
	public ModelAndView uReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
        HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();
                
          //리뷰 리스트
        List ReviewList = mypageService.selectReview(user_id);
        mav.addObject("reviewList", ReviewList);
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/uBook.do", method = RequestMethod.GET)
	public ModelAndView uBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();
        
      //예약 리스트
        List BookList = mypageService.selectBook(user_id);
        mav.addObject("bookList", BookList);
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/uLike.do", method = RequestMethod.GET)
	public ModelAndView uLike(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();
		
      //찜목록
        List wishList = mypageService.selectwish(user_id);
        mav.addObject("wishList", wishList);
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/uAsk.do", method = RequestMethod.GET)
	public ModelAndView uAsk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
        MemberVO mm = (MemberVO) session.getAttribute("member");
        String user_id = mm.getUser_id();
        
      //1:1문의 리스트
        List AskList = mypageService.selectAsk(user_id);
        mav.addObject("askList", AskList);
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/mypage/recent_view.do", method = RequestMethod.GET)
	public ModelAndView recentView(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName(viewName);
        return mav;
	}
	@Override
    @RequestMapping(value = "/mypage/myinfo.do", method = RequestMethod.GET)
    public ModelAndView myinfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();
        mav.setViewName(viewName);
        return mav;
    }
	
}
