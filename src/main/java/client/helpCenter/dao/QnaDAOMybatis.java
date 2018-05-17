package client.helpCenter.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.helpCenter.bean.QnaDTO;
import client.member.bean.MemberDTO;

@Transactional
@Component
public class QnaDAOMybatis implements QnaDAO{
   @Autowired
   private SqlSession sqlSession;

   @Override
   public void qnaWrite(Map<String, String> map) {
      sqlSession.insert("QnaSQL.QnaWrite", map);
   }

   @Override
   public QnaDTO QnaView(int seq) {
      return sqlSession.selectOne("QnaSQL.QnaView", seq);
   }

   @Override
   public List<QnaDTO> QnaList(int startNum, int endNum, String id, String searchtext) {
      Map<String,String> map = new HashMap<String, String>();
      map.put("startNum", Integer.toString(startNum));
      map.put("endNum", Integer.toString(endNum));
      map.put("id", id);
      map.put("searchtext", searchtext);
      return sqlSession.selectList("QnaSQL.QnaList", map);
   }

   @Override
   public int getQnaTotalA(String id, String searchtext) {
      Map<String,String> map = new HashMap<String, String>();
      map.put("id", id);
      map.put("searchtext", searchtext);
      return sqlSession.selectOne("QnaSQL.getQnaTotalA", map);
   }

   @Override
   public void qnaDelete(String seq, String qna) {
      String[] qna_ar = qna.split(",");
      Map<String,Object> map = new HashMap<String, Object>();
      map.put("seq", seq);
      map.put("qna", qna_ar);
      sqlSession.delete("QnaSQL.qnaDelete",  map);
   }
   

   
}