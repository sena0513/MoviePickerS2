package admin.report.dao;

import java.util.List;
import java.util.Map;

import admin.report.bean.AdminQnaDTO;
import admin.report.bean.AdminReviewReportDTO;

public interface AdminQnaDAO {

   public void qnaWrite(Map<String, String> map);
   public List<AdminQnaDTO> QnaList(int startNum, int endNum,String searchtext);
   public int getQnaTotalA(String searchtext);
   public AdminQnaDTO QnaView(int seq);
   public void qnaDelete(String seq, String qna);
   public void updateqna(Map<String,String> map);
   
}