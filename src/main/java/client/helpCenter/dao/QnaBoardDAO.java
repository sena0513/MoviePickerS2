package client.helpCenter.dao;

import java.util.List;

import client.helpCenter.bean.QnaBoardDTO;

public interface QnaBoardDAO {

	public List<QnaBoardDTO> getQnaBoardList(int startNum, int endNum, String searchtext);

	public int getQnaTotalA(String searchtext);

	public QnaBoardDTO QnaBoardView(int seq);
	
	public List<QnaBoardDTO> getPreNextList(int seq);

	public void QnaViewCount(int seq);
}
