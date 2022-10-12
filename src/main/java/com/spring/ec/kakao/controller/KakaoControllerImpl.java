package com.spring.ec.kakao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.kakao.service.KakaoService;
import com.spring.ec.kakao.vo.KakaoVO;

@Controller("kakaoController")
public class KakaoControllerImpl implements KakaoController {

	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private HttpSession session;

	@Override
	@RequestMapping(value="/kakaoLogin", method = RequestMethod.GET) //localhost:8080/ec/kakao 濡� �샇異쒗빐�빞�맂�떎.
	//吏곸젒�샇異쒗븯硫� 移댁뭅�삤濡쒓렇�씤api�뿉�꽌 �젙蹂� 紐삳컺�븘�삤湲곕븣臾몄뿉 臾댁쓽誘명븯�떎.
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
		 System.out.println("#########" + code);
		 String access_Token = kakaoService.getAccessToken(code);
		 
		 //userInfo�쓽 ���엯�쓣 kakaoVO濡� 蹂�寃� 諛� import
		 KakaoVO userInfo = kakaoService.getUserInfo(access_Token);
//		 KakaoVO number = kakaoService.kakaoNumber(userInfo);
		 System.out.println("userInfo :"+userInfo.getK_name() );
		 session.invalidate();
		 session.setAttribute("kakaoN", userInfo.getK_name());
		 session.setAttribute("kakaoE", userInfo.getK_email());
//		 session.setAttribute("kakaoNumber", number.getK_number());
	       
//	        System.out.println("###access_Token#### : " + access_Token);
//	        System.out.println("###email#### : " + userInfo.get("email"));
//	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
//	        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
	
	      model.addAttribute("k_name",userInfo.getK_name());  
	      model.addAttribute("k_email",userInfo.getK_email()); 
	        return "/main"; /* "/main"�쑝濡� �빐�빞�븿 */
    }
	
	@Override
	@RequestMapping(value = "/kakao/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("userInfo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
}