package com.spring.ec.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.user.dao.MypageDAO;
import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDAO mypageDAO;
	
	//찜목록
	@Override
	public List<WishVO> selectwish(String user_id) throws Exception {
		List<WishVO> WishList = mypageDAO.selectwish(user_id);
		return WishList;
	}
	
	//리뷰목록
	@Override
	public List<ReviewVO> selectReview(String user_id) throws Exception {
		List<ReviewVO> ReviewList = mypageDAO.selectReview(user_id);
		return ReviewList;
	}
	
	//먹플리볼플리목록
	@Override
	public List<BoardVO> selectBoard(String user_id) throws Exception {
		List<BoardVO> BoardList = mypageDAO.selectBoard(user_id);
		return BoardList;
	}
	
	//예약목록
	@Override
	public List<ReservVO> selectBook(String user_id) throws Exception {
		List<ReservVO> ReservList = mypageDAO.selectBook(user_id);
		return ReservList;
	}
	
	//1:1문의목록
	@Override
	public List<AskVO> selectAsk(String user_id) throws Exception {
		List<AskVO> AskList = mypageDAO.selectAsk(user_id);
		return AskList;
	}


}