package client.moviefinder.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.movies.bean.MovieplatformDTO;

@Transactional
@Component
public class MovieFinderDAOMybatis implements MovieFinderDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<MovieplatformDTO> getAgelim(Map<String, String> map) {
		return sqlSession.selectList("movieFinderSQL.getAgelim", map);
	}

	@Override
	public List<MovieplatformDTO> getMovieList(int startNum, int endNum, String searchtext, String searchfield, 
			String genre, String nation, String ageLimit, String year_start, String year_end) {
		
		String[] genre_ar = genre.split(",");
		/*for(String data : genre_ar) {
			System.out.println("장르 : " + data);
		}*/
		String[] nation_ar = nation.split(",");
		/*for(String data : nation_ar) {
			System.out.println("제작국가 : " + data);
		}*/
		String[] ageLimit_ar = ageLimit.split(",");
		/*for(String data : ageLimit_ar) {
			System.out.println("관람등급 : " + data);
		}*/
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		map.put("searchtext", searchtext);
		map.put("searchfield", searchfield);
		map.put("genre", genre_ar);
		map.put("nation", nation_ar);
		map.put("ageLimit", ageLimit_ar);	
		map.put("year_start", year_start);
		map.put("year_end", year_end);
		
		List<MovieplatformDTO> list = sqlSession.selectList("movieFinderSQL.getMovieList", map);
//		System.out.println("검색한 genre: >"+list.get(0).getMovietitle()+"<");

		return list;
	}

	@Override
	public int getMovieTotalA(String searchtext, String searchfield, String genre, 
			String nation, String ageLimit, String year_start, String year_end) {
		String[] genre_ar = genre.split(",");
		/*for(String data : genre_ar) {
			System.out.println("장르 : " + data);
		}*/
		String[] nation_ar = nation.split(",");
		/*for(String data : nation_ar) {
			System.out.println("제작국가 : " + data);
		}*/
		String[] ageLimit_ar = ageLimit.split(",");
		/*for(String data : ageLimit_ar) {
			System.out.println("관람등급 : " + data);
		}*/
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("searchtext", searchtext);
		map.put("searchfield", searchfield);
		map.put("genre", genre_ar);
		map.put("nation", nation_ar);
		map.put("ageLimit", ageLimit_ar);
		map.put("year_start", year_start);
		map.put("year_end", year_end);
		return sqlSession.selectOne("movieFinderSQL.getMovieTotalA", map);
	}
	
	
}
