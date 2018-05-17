package client.helpCenter.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.helpCenter.bean.NoticeBoardDTO;

@Transactional
@Component
public class NoticeBoardDAOMybatis implements NoticeBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<NoticeBoardDTO> getNoticeBoardList(int startNum, int endNum, String searchtext, String searchfield) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		map.put("searchtext", searchtext);
		map.put("searchfield", searchfield);
		
		
		List<NoticeBoardDTO> list = sqlSession.selectList("NoticeBoardSQL.getNoticeBoardList", map);

		
		return list;
	}

	@Override
	public int getNoticeTotalA(String searchtext, String searchfield) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("searchtext", searchtext);
		map.put("searchfield", searchfield);
		return sqlSession.selectOne("NoticeBoardSQL.getNoticeTotalA", map);
	}

	@Override
	public NoticeBoardDTO NoticeBoardView(int seq) {
		return sqlSession.selectOne("NoticeBoardSQL.NoticeBoardView", seq);
	}

	@Override
	public List<NoticeBoardDTO> getPreNextList(int seq) {
		return sqlSession.selectList("NoticeBoardSQL.getPreNextList", seq);
	}

	@Override
	public void NoticeViewCount(int seq) {
		sqlSession.update("NoticeBoardSQL.NoticeViewCount", seq);
	}
	

}
