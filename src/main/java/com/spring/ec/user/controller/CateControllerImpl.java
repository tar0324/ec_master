package com.spring.ec.user.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.service.CateService;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;

@Controller("categoryController")
public class CateControllerImpl implements CateController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	private static final String REVIEW_IMAGE_REPO = "C:\\EATSEE\\review_imagefile";
	@Autowired
	private CateService cateService;
	@Autowired
	StoreVO storeVO;
	@Autowired
	MemberVO memberVO;
	@Autowired
	ReservVO reservVO;
	@Autowired
	ReviewVO reviewVO;
	
	// 카테고리
	@Override
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public ModelAndView category(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/category/categorymain";
		System.out.println("viewName::" + viewName);
		List StoreList = cateService.selectAllStores();
		List MenuList = cateService.selectMenu();
		List ReviewList = cateService.selectReview();
		List Reviewavgsum = cateService.selectReviewavgsum();
		List prosumList = cateService.selectprosum();
		List wishList = null;
		HttpSession session = request.getSession();

		if (session.getAttribute("member") != null) {
			MemberVO mm = (MemberVO) session.getAttribute("member");
			wishList = cateService.selectwish(mm.getUser_id());
		}

		List wishsum = cateService.selectwishsum();


		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("StoreList", StoreList);
		mav.addObject("menuList", MenuList);
		mav.addObject("reviewList", ReviewList);
		mav.addObject("reviewavgsum", Reviewavgsum);
		mav.addObject("wishList", wishList);
		mav.addObject("wishsum", wishsum);
		mav.addObject("prosumList", prosumList);
		return mav;
	}

	/* 검색 */
	@Override
	@RequestMapping(value = "/searchcategory.do", method = RequestMethod.GET)
	public ModelAndView searchcategory(@RequestParam(value = "search") String search,
			@RequestParam(value = "kind") String kind, @RequestParam(value = "area") String area,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/category/searchcategory";
		System.out.println("viewName::" + viewName);
		ModelAndView mav = new ModelAndView(viewName);
		List<String> searchword = Arrays.asList(search.split(" "));
		Map<String, String> listMap = new HashMap<String, String>();
		for (int i = 0; i < searchword.size(); i++) {
			listMap.put("key0" + (i + 1), searchword.get(i));

		}
		System.out.println("listMap::::" + listMap);
		System.out.println("Type is: " + listMap.getClass());

		if (area == null || area.equals("null") || area.equals("지역")) {
			listMap.put("area", "null");
		} else {
			listMap.put("area", area);
		}
		
		if (kind == null || kind.equals("null")|| kind.equals("업종")) {
			listMap.put("kind", "null");
		} else if (kind.equals("먹거리")) {
			listMap.put("kind", "10");
		} else if (kind.equals("볼거리")) {
			listMap.put("kind", "20");
		} else {
			listMap.put("kind", kind);
		}

		/*
		 * if (area.equals("null") && kind.equals("null") && search == null) {
		 * mav.setViewName("redirect:/category.do"); }
		 */
		List StoreList = cateService.selectSearchStores(listMap);
		List MenuList = cateService.selectMenu();
		List ReviewList = cateService.selectReview();
		List Reviewavgsum = cateService.selectReviewavgsum();
		List prosumList = cateService.selectprosum();
		List wishList = null;
		HttpSession session = request.getSession();

		if (session.getAttribute("member") != null) {
			MemberVO mm = (MemberVO) session.getAttribute("member");
			wishList = cateService.selectwish(mm.getUser_id());
		}

		List wishsum = cateService.selectwishsum();

		
		// ModelAndView mav = new ModelAndView("redirect:/category.do");
		// ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("StoreList", StoreList);
		mav.addObject("menuList", MenuList);
		mav.addObject("reviewList", ReviewList);
		mav.addObject("reviewavgsum", Reviewavgsum);
		mav.addObject("wishList", wishList);
		mav.addObject("wishsum", wishsum);
		mav.addObject("prosumList", prosumList);
		return mav;
	}

	/* 상세조회 */
	@Override
	@RequestMapping(value = "/storeInfo.do", method = RequestMethod.GET)
	public ModelAndView storeInfo(@RequestParam(value = "seller_id") String seller_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = "/category/storeInfo";
		System.out.println("viewName::" + viewName);
		// Map<String, String> listMap = new HashMap<String, String>();

		StoreVO StoreList = cateService.selectstoreInfo(seller_id);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("StoreList", StoreList);
		return mav;
	}

	/* 리뷰 좋아요 up */
	@Override
	@RequestMapping(value = "/reviewlike.do", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String reviewlike(@RequestParam(value = "review_num") int reviewnum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		cateService.updatereviewlike(reviewnum);
		String result = cateService.selectreviewlike(reviewnum);
		System.out.println("result::" + result);
		return result;
	}

	
	//221005
	// 찜하기
	@Override
	@RequestMapping(value = "/addwish.do", method = RequestMethod.POST)
	public @ResponseBody String addwish(@RequestParam(value = "seller_id") String seller_id,
			@RequestParam(value = "user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		Map<String, String> listMap = new HashMap<String, String>();
		listMap.put("seller_id", seller_id);
		listMap.put("user_id", user_id);
		int result = cateService.addwish(listMap);
		// 찜개수 가져오기
		String wishsellsum = cateService.selectsellerwishsum(seller_id);


		String state = "";
		if (result == 1) {
			state = "true";
		} else {
			state = "false";
		}
		return wishsellsum;
	}

	
	//221005
	// 찜삭제
	@Override
	@RequestMapping(value = "/delwish.do", method = RequestMethod.POST)
	public @ResponseBody String delwish(@RequestParam(value = "seller_id") String seller_id,
			@RequestParam(value = "user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		Map<String, String> listMap = new HashMap<String, String>();
		listMap.put("seller_id", seller_id);
		listMap.put("user_id", user_id);
		int result = cateService.delwish(listMap);
		String wishsellsum = cateService.selectsellerwishsum(seller_id);
		String state = "";
		if (result == 1) {
			state = "false";
		} else {
			state = "true";
		}
		return wishsellsum;
	}

	// 다중 이미지 글 추가하기
	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/addreview.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public ResponseEntity addreview(@RequestParam(value =
	 * "seller_id") String seller_id, MultipartHttpServletRequest multipartRequest,
	 * HttpServletResponse response) throws Exception {
	 * multipartRequest.setCharacterEncoding("utf-8"); String imageFileName = null;
	 * 
	 * Map reviewMap = new HashMap(); Enumeration enu =
	 * multipartRequest.getParameterNames(); while(enu.hasMoreElements()) { String
	 * name = (String)enu.nextElement(); String value =
	 * multipartRequest.getParameter(name); reviewMap.put(name, value); }
	 * 
	 * //로그인 시 세션에 저장된 회원 정보에서 글쓴이 아이디를 얻어와서 Map에 저장합니다. HttpSession session =
	 * multipartRequest.getSession(); MemberVO memberVO =
	 * (MemberVO)session.getAttribute("member"); String id = memberVO.getUser_id();
	 * reviewMap.put("user_id", id); reviewMap.put("seller_id", seller_id);
	 * 
	 * List<String> fileList = upload(multipartRequest); List<ImageVO> imageFileList
	 * = new ArrayList<ImageVO>(); if(fileList != null && fileList.size() !=0) {
	 * for(String fileName : fileList){ ImageVO imageVO = new ImageVO();
	 * imageVO.setImage_fileName(fileName); imageFileList.add(imageVO); }
	 * reviewMap.put("imageFileList",imageFileList ); } String message;
	 * ResponseEntity resEnt = null; HttpHeaders responseHeaders = new
	 * HttpHeaders();
	 * responseHeaders.add("Content-Type","text/html; charset=utf-8"); try { int
	 * review_num = cateService.addReview(reviewMap); if(imageFileList != null &&
	 * imageFileList.size() != 0) { for(ImageVO imageVO:imageFileList) {
	 * imageFileName = imageVO.getImage_fileName(); File srcFile = new
	 * File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName); File destDir
	 * = new File(REVIEW_IMAGE_REPO + "\\" + review_num); //destDir.mkdirs();
	 * FileUtils.moveFileToDirectory(srcFile, destDir, true); } }
	 * 
	 * message = "<script>"; message += " alert('리뷰를 추가했습니다.');";
	 * 
	 * message += " location.href='" + multipartRequest.getContextPath() +
	 * "/board/listArticles.do'; ";
	 * 
	 * message += " </script>"; resEnt = new ResponseEntity(message,
	 * responseHeaders,HttpStatus.CREATED); } catch(Exception e) { if(imageFileList
	 * != null && imageFileList.size() != 0) { for(ImageVO imageVO:imageFileList) {
	 * imageFileName = imageVO.getImage_fileName(); File srcFile = new
	 * File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
	 * srcFile.delete(); } }
	 * 
	 * message = "<script>"; message += " alert('오류가 발생했습니다. 다시 시도해 주세요');"; message
	 * += " location.href='" + multipartRequest.getContextPath() +
	 * "/board/articleForm.do'; "; message += " </script>"; resEnt = new
	 * ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 * e.printStackTrace(); } return resEnt; }
	 */
	
	
	
	//리뷰 등록
	@Override
	@RequestMapping(value="/addreview.do", method = RequestMethod.POST)
	public ModelAndView addreview(@ModelAttribute("review") ReviewVO review, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		MemberVO mm = (MemberVO) session.getAttribute("member");
		review.setUser_id(mm.getUser_id());
		int result = cateService.addreview(review);
		//result = cateService.addreview(review);
		ModelAndView mav = new ModelAndView("redirect:/category.do");
		return mav;
	}
	
	
	
	
	
	

	// 예약페이지
	@Override
	@RequestMapping(value = "/reservation.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView reservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		String seller_id = "stest002";
		ReservVO reservInfo = cateService.selectStoreInfo(seller_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("reservInfo", reservInfo);
		return mav;
	}

	@Override
	@RequestMapping(value = "/reservCheck", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView reservCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
