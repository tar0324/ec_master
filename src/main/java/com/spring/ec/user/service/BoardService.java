package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;

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
}
