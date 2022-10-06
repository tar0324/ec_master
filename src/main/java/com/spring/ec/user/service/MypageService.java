package com.spring.ec.user.service;

import java.util.List;

import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface MypageService {
	public List<WishVO> selectwish(String user_id) throws Exception;
	public List<ReviewVO> selectReview(String user_id) throws Exception;
	public List<BoardVO> selectBoard(String user_id) throws Exception;
	public List<ReservVO> selectBook(String user_id) throws Exception;
	public List<AskVO> selectAsk(String user_id) throws Exception;
}
