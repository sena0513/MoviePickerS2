package admin.notice.dao;

import java.util.List;
import java.util.Map;

import admin.notice.bean.AdminNoticeBoardDTO;

public interface AdminNoticeBoardDAO {

	public List<AdminNoticeBoardDTO> getNoticeBoardList(int startNum, int endNum, String searchtext, String searchfield);

	public int getNoticeTotalA(String searchtext, String searchfield);

	public AdminNoticeBoardDTO NoticeBoardView(int seq);
	
	public List<AdminNoticeBoardDTO> getPreNextList(int seq);
	
	public void DeleteNotice(int seq);
	
	public AdminNoticeBoardDTO ModifyNoticeform(int seq);
	
	public int ModifyNotice(Map<String,String> map);
	
	public int InsertNotice(Map<String,String> map);
}
