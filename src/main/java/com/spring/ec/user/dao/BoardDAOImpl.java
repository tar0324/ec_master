package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;
import com.spring.ec.user.vo.ImageVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	// 먹플리 볼플리
	@Override
	public List selectAllBoardsList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<BoardVO> boardsList = sqlSession.selectList("mapper.board.selectAllBoardsList", page);
		return boardsList;
	}

	@Override
	public List selectEatBoardsList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<BoardVO> boardsList = sqlSession.selectList("mapper.board.selectEatBoardsList", page);

		return boardsList;
	}

	@Override
	public List selectSeeBoardsList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<BoardVO> boardsList = sqlSession.selectList("mapper.board.selectSeeBoardsList", page);
		return boardsList;
	}

	@Override
	public BoardVO selectBoard(int list_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectBoard", list_num);
	}

	// 이미지 파일 리스트 호출
	@Override
	public List selectImageFileList(int list_num) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList", list_num);
		return imageFileList;
	}

	@Override
	public void addHits(int list_num) throws DataAccessException {
		sqlSession.update("mapper.board.addHits", list_num);
	}

	@Override
	public int insertNewBoard(Map boardMap) throws Exception {
		int list_num = selectNewList_num();
		boardMap.put("list_num", list_num);
		sqlSession.insert("mapper.board.insertNewBoard", boardMap);
		return list_num;
	}

	@Override
	public void insertNewImage(Map boardMap) throws DataAccessException {
		String image_fileName = (String) boardMap.get("image_fileName");
		System.out.println("DAO" + image_fileName);
		int list_num = (Integer) boardMap.get("list_num");
		int image_num = selectNewImage_num();
		ImageVO imageVO = new ImageVO();
		imageVO.setImage_num(image_num);
		imageVO.setList_num(list_num);
		imageVO.setOrigin_fileName(image_fileName);
		imageVO.setImage_fileName(image_fileName);

		sqlSession.insert("mapper.board.insertNewImage", imageVO);
	}

	@Override
	public List selectAllCommentsList(int list_num) throws DataAccessException {
		List<CommentVO> commentsList = sqlSession.selectList("mapper.board.selectAllCommentsList", list_num);
		return commentsList;
	}

	@Override
	public int insertNewComment(Map commentMap) throws Exception {
		int comment_num = selectNewComment_num();
		commentMap.put("comment_num", comment_num);
		sqlSession.insert("mapper.board.insertNewComment", commentMap);
		return comment_num;
	}

	private int selectNewList_num() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewList_num");
	}

	private int selectNewImage_num() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImage_num");
	}

	private int selectNewComment_num() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewComment_num");
	}

	@Override
	public int eatBoardPaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectEatBoardCount");
	}

	@Override
	public int seeBoardPaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectSeeBoardCount");
	}

	@Override
	public int allBoardPaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectAllBoardCount");
	}
}
