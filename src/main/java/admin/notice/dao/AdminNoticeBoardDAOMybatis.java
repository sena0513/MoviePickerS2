package admin.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import admin.notice.bean.AdminNoticeBoardDTO;

@Transactional
@Component
public class AdminNoticeBoardDAOMybatis implements AdminNoticeBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<AdminNoticeBoardDTO> getNoticeBoardList(int startNum, int endNum, String searchtext, String searchfield) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		map.put("searchtext", searchtext);
		map.put("searchfield", searchfield);
		
		System.out.println("검색한 searchtext: >"+map.get("searchtext")+"<");
		System.out.println("검색한 searchfield: >"+map.get("searchfield")+"<");
		List<AdminNoticeBoardDTO> list = sqlSession.selectList("AdminNoticeBoardSQL.getNoticeBoardList", map);

		
		return list;
	}

	@Override
	public int getNoticeTotalA(String searchtext, String searchfield) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("searchtext", searchtext);
		map.put("searchfield", searchfield);
		return sqlSession.selectOne("AdminNoticeBoardSQL.getNoticeTotalA", map);
	}

	@Override
	public AdminNoticeBoardDTO NoticeBoardView(int seq) {
		return sqlSession.selectOne("AdminNoticeBoardSQL.NoticeBoardView", seq);
	}

	@Override
	public List<AdminNoticeBoardDTO> getPreNextList(int seq) {
		return sqlSession.selectList("AdminNoticeBoardSQL.getPreNextList", seq);
	}
	
	@Override
	public int InsertNotice(Map<String, String> map) {
		return sqlSession.insert("AdminNoticeBoardSQL.insertnotice",map);
	}
	
	@Override
	public void DeleteNotice(int seq) {
		sqlSession.delete("AdminNoticeBoardSQL.deletenotice", seq);
	}
	
	@Override
	public AdminNoticeBoardDTO ModifyNoticeform(int seq) {
		return sqlSession.selectOne("AdminNoticeBoardSQL.NoticeBoardView",seq);
	}
	@Override
	public int ModifyNotice(Map<String,String> map) {
		return sqlSession.update("AdminNoticeBoardSQL.modifynotice", map);
	}

}
