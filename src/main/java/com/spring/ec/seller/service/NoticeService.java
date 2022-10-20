package com.spring.ec.seller.service;

import java.util.List;

import com.spring.ec.user.vo.NoticeVO;

public interface NoticeService {
	//�������� �Խ���
	public List<NoticeVO> s_noticeBoards(int page)throws Exception;
	
	//���������� ��������
	public List<NoticeVO> s_mainNoticeBoards(int page)throws Exception;
	
	//�������� �Խñ� �� �ۼ�
	public int s_noticeCount()throws Exception;
	
	//�������� �Խñ� Ȯ��
	public NoticeVO s_viewNotice(int list_num) throws Exception;
	
	//�������� ��ȸ��
	public void s_addNoticeHits(int list_num)throws Exception;
}
