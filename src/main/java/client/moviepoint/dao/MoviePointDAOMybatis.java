package client.moviepoint.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.movies.bean.MoviePointDTO;
import client.review.bean.ReviewDTO;

@Transactional
@Component
public class MoviePointDAOMybatis implements MoviePointDAO{
	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public MoviePointDTO getMoviePoint(String moviename) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("moviename", moviename);
		return sqlsession.selectOne("moviePointSQL.getMoviePoint", map);
		 
	}

	@Override
	public MoviePointDTO getMoviePoint(int mv_seq) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mv_seq", mv_seq);
		return sqlsession.selectOne("moviePointSQL.getMoviePointseq", map);
	}

	@Override
	public List<ReviewDTO> getReviewList(String seq, int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("seq", Integer.parseInt(seq));
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlsession.selectList("moviePointSQL.getReviewList",map);
	}

	@Override
	public int getTotalReviewFromMv_seq(String mv_seq) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mv_seq", Integer.parseInt(mv_seq));
		return sqlsession.selectOne("moviePointSQL.getTotalReviewFromMv_seq", map); 
	}

	@Override
	public int insertreview(Map<String, String> map) {
		return sqlsession.insert("moviePointSQL.insertReivew",map);
	}

	@Override
	public void charmpointupdate(Map<String, String> map) {
		sqlsession.update("moviePointSQL.charmpointupdate",map);
	}

	@Override
	public List<ReviewDTO> getReviewdata(Map<String, String> map) {
		return sqlsession.selectList("moviePointSQL.getReviewdata",map);
	}

	@Override
	public void updatemoviepoint(Map<String, String> map) {
		sqlsession.update("moviePointSQL.updatemoviepoint",map);
	}

	@Override
	public List<ReviewDTO> reviewcheck(Map<String, String> map) {
		return sqlsession.selectList("moviePointSQL.reviewcheck",map);
	}

	@Override
	public int modifyreviewcontents(Map<String, String> map) {
		return sqlsession.update("moviePointSQL.modifyreviewcontents",map);
		
	}

	@Override
	public void removereview(Map<String, String> map) {
		sqlsession.delete("moviePointSQL.removereview",map);
	}

	@Override
	public void reportreview(Map<String, String> map) {
		sqlsession.update("moviePointSQL.reportreview",map);
	}

	@Override
	public List<ReviewDTO> myreview(int endNum,int startNum,String id) {
		Map<String,String>map= new HashMap<String,String>();
		map.put("id",id);
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		return sqlsession.selectList("moviePointSQL.myreview", map);
	}

	@Override
	public int getmyreviewTotalA(String id) {
		return sqlsession.selectOne("moviePointSQL.getmyreviewTotalA",id);
	}
	
	@Override
	public void deletemyreview(int rev_seq) {
		sqlsession.delete("moviePointSQL.deletemyreview",rev_seq);
	}
	
	@Override
	public int plusHeartToMovienameforkr(Map<String, String> map) {
		return sqlsession.update("moviePointSQL.plusHeartToMovienameforkr",map);
	}

	@Override
	public int minusHeartToMovienameforkr(Map<String, String> map) {
		
		return sqlsession.update("moviePointSQL.minusHeartToMovienameforkr", map);
	}
}
