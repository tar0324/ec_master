package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;
import com.spring.ec.user.vo.LikedVO;

public interface BoardService {
	//�÷��� ����Ʈ �Խ��� ���
	public List<BoardVO> listBoards(int page)throws Exception;
	//���ø� �Խù���ϸ� ����
	public List<BoardVO> eatListBoards(int page)throws Exception;
	//���ø� �Խù� ��ϸ� ����
	public List<BoardVO> seeListBoards(int page)throws Exception;
	//�÷��̸���Ʈ ������ ����
	public int allListCount()throws Exception;
	//���ø� ������ ����
	public int eatListCount()throws Exception;
	//���ø� ������ ����
	public int seeListCount()throws Exception;	
	//�Խù� ��â	
	public BoardVO viewBoard(int list_num) throws Exception;
	//�Խù� Ŭ����
	public void addHits(int list_num)throws Exception;
	//�Խñ� ����
	public int addNewBoard(Map boardMap) throws Exception;
	// ��� �ҷ�����
	public List<CommentVO> listComments(int list_num)throws Exception;
	// ��� �ۼ�
	public int addNewComment(Map commentMap) throws Exception;
	
	public int likedCheck(Map likedMap) throws Exception;
	
	public int likedUp(Map likedMap)throws Exception;
	
	public int likedDown(Map likedMap)throws Exception;
	
	public int badCheck(Map badMap) throws Exception;
	
	public int badUp(Map badMap)throws Exception;
	
	public int badDown(Map badMap)throws Exception;
	
	public int removeBoard(int list_num)throws Exception;
	
	public int modBoard(Map boardMap)throws Exception;
	
	
}