package admin.QnA.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import admin.QnA.bean.AdminQnaBoardDTO;

@Transactional
@Component
public class AdminQnaBoardDAOMybatis implements AdminQnaBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<AdminQnaBoardDTO> getQnaBoardList(int startNum, int endNum, String searchtext) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		map.put("searchtext", searchtext);
		System.out.println("검색한 단어>"+map.get("searchtext")+"<이거 검색");
		return sqlSession.selectList("AdminQnaBoardSQL.getQnaBoardList", map);
	}

	@Override
	public int getQnaTotalA(String searchtext) {
		return sqlSession.selectOne("AdminQnaBoardSQL.getQnaTotalA", searchtext);
	}

	@Override
	public AdminQnaBoardDTO QnaBoardView(int seq) {
		return sqlSession.selectOne("AdminQnaBoardSQL.QnaBoardView", seq);
	}

	@Override
	public List<AdminQnaBoardDTO> getPreNextList(int seq) {
		return sqlSession.selectList("AdminQnaBoardSQL.getPreNextList", seq);
	}

	@Override
	public int Insertqna(Map<String, String> map) {
		return sqlSession.insert("AdminQnaBoardSQL.insertqna",map);
	}
	
	@Override
	public void Deleteqna(int seq) {
		sqlSession.delete("AdminQnaBoardSQL.deleteqna", seq);
	}
	
	@Override
	public AdminQnaBoardDTO Modifyqnaform(int seq) {
		return sqlSession.selectOne("AdminQnaBoardSQL.qnaBoardView",seq);
	}
	@Override
	public int Modifyqna(Map<String,String> map) {
		return sqlSession.update("AdminQnaBoardSQL.modifyqna", map);
	}
}
