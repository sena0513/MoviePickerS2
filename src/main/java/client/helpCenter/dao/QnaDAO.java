package client.helpCenter.dao;

import java.util.List;
import java.util.Map;

import client.helpCenter.bean.QnaDTO;

public interface QnaDAO {

   public void qnaWrite(Map<String, String> map);

   public List<QnaDTO> QnaList(int startNum, int endNum, String id, String searchtext);

   public int getQnaTotalA(String id, String searchtext);

   public QnaDTO QnaView(int seq);

   public void qnaDelete(String seq, String qna);
}