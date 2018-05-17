package admin.report.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import admin.report.bean.AdminQnaDTO;
import admin.report.bean.AdminReviewReportDTO;

@Transactional
@Component
public class AdminQnaDAOMybatis implements AdminQnaDAO{
   @Autowired
   private SqlSession sqlSession;

   @Override
   public void qnaWrite(Map<String, String> map) {
      sqlSession.insert("AdminQnaSQL.QnaWrite", map);
   }

   @Override
   public AdminQnaDTO QnaView(int seq) {
      return sqlSession.selectOne("AdminQnaSQL.QnaView", seq);
   }

   @Override
   public List<AdminQnaDTO> QnaList(int startNum, int endNum,String searchtext) {
      Map<String,String> map = new HashMap<String, String>();
      map.put("startNum", Integer.toString(startNum));
      map.put("endNum", Integer.toString(endNum));
      map.put("searchtext", searchtext);
      return sqlSession.selectList("AdminQnaSQL.QnaList", map);
   }

   @Override
   public int getQnaTotalA(String searchtext) {
      Map<String,String> map = new HashMap<String, String>();
      map.put("searchtext", searchtext);
      return sqlSession.selectOne("AdminQnaSQL.getQnaTotalA", map);
   }

   @Override
   public void qnaDelete(String seq, String qna) {
      String[] qna_ar = qna.split(",");
      Map<String,Object> map = new HashMap<String, Object>();
      map.put("seq", seq);
      map.put("qna", qna_ar);
      sqlSession.delete("AdminQnaSQL.qnaDelete",  map);
   }

	@Override
	public void updateqna(Map<String, String> map) {
	  sqlSession.update("AdminQnaSQL.updateqna",map);
	}

   
}
