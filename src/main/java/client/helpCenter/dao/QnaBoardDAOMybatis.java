package client.helpCenter.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.helpCenter.bean.QnaBoardDTO;

@Transactional
@Component
public class QnaBoardDAOMybatis implements QnaBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<QnaBoardDTO> getQnaBoardList(int startNum, int endNum, String searchtext) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		map.put("searchtext", searchtext);
		
		return sqlSession.selectList("QnaBoardSQL.getQnaBoardList", map);
	}

	@Override
	public int getQnaTotalA(String searchtext) {
		return sqlSession.selectOne("QnaBoardSQL.getQnaTotalA", searchtext);
	}

	@Override
	public QnaBoardDTO QnaBoardView(int seq) {
		return sqlSession.selectOne("QnaBoardSQL.QnaBoardView", seq);
	}

	@Override
	public List<QnaBoardDTO> getPreNextList(int seq) {
		return sqlSession.selectList("QnaBoardSQL.getPreNextList", seq);
	}

	@Override
	public void QnaViewCount(int seq) {
		sqlSession.update("QnaBoardSQL.QnaViewCount", seq);
	}
}
