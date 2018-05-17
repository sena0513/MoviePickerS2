package admin.QnA.dao;

import java.util.List;
import java.util.Map;

import admin.QnA.bean.AdminQnaBoardDTO;

public interface AdminQnaBoardDAO {

	public List<AdminQnaBoardDTO> getQnaBoardList(int startNum, int endNum, String searchtext);

	public int getQnaTotalA(String searchtext);

	public AdminQnaBoardDTO QnaBoardView(int seq);
	
	public List<AdminQnaBoardDTO> getPreNextList(int seq);
	
	public void Deleteqna(int seq);
	
	public AdminQnaBoardDTO Modifyqnaform(int seq);
	
	public int Modifyqna(Map<String,String> map);
	
	public int Insertqna(Map<String,String> map);
}
