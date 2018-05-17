package admin.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.movies.bean.MovieplatformDTO;

@Component
@Transactional
public class MovieplatformDAOMybatis implements MovieplatformDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int fixdata(Map<String,String> map) {
		return sqlSession.update("adminmovieSQL.moviefix",map);
	}

	@Override
	public int InsertMovie(Map<String,String> map) {
		return sqlSession.insert("adminmovieSQL.movieinsert",map);
		
	}
	@Override
	public int InsertMoviePoint(Map<String, String> map) {
		return sqlSession.insert("adminmovieSQL.moviepointinsert",map);
	}

	@Override
	public List<MovieplatformDTO> getMovieList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
	    map.put("startNum", startNum);
	    map.put("endNum", endNum);
	    return sqlSession.selectList("adminmovieSQL.getmovieList", map);
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("adminmovieSQL.getTotalA");
	}

	//수정 폼 불러오기
	@Override
	public MovieplatformDTO modifymovieform(String seq) {
		return sqlSession.selectOne("adminmovieSQL.getmodifyform",seq);
	}

	//수정폼에서의 수정하기
	@Override
	public void modifymovie(Map<String,String> map) {
		sqlSession.update("adminmovieSQL.modifymovie",map);
	}
	@Override
	public void deletemovie(String seq) {
		sqlSession.delete("adminmovieSQL.deletemovie", seq);
	}

	@Override
	public List<MovieplatformDTO> getAllData() {
		return sqlSession.selectList("adminmovieSQL.getAllData");
	}

	

}
