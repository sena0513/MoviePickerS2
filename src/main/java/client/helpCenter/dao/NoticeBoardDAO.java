package client.helpCenter.dao;

import java.util.List;

import client.helpCenter.bean.NoticeBoardDTO;

public interface NoticeBoardDAO {

	public List<NoticeBoardDTO> getNoticeBoardList(int startNum, int endNum, String searchtext, String searchfield);

	public int getNoticeTotalA(String searchtext, String searchfield);

	public NoticeBoardDTO NoticeBoardView(int seq);
	
	public List<NoticeBoardDTO> getPreNextList(int seq);
	
	public void NoticeViewCount(int seq);
}
