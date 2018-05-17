package admin.movie.dao;

import java.util.List;
import java.util.Map;

import client.movies.bean.MovieplatformDTO;
import client.movies.bean.MoviePointDTO;



public interface MovieplatformDAO {
	public int fixdata(Map<String,String> map);
	public int InsertMovie(Map<String,String> map);
	public List<MovieplatformDTO> getMovieList(int startNum, int endNum);
	public int getTotalA();
	public MovieplatformDTO modifymovieform(String seq);
	public void modifymovie(Map<String,String> map);
	public void deletemovie(String seq);
	public List<MovieplatformDTO> getAllData();
	public int InsertMoviePoint(Map<String,String> map);
}
