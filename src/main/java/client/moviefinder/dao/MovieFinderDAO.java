package client.moviefinder.dao;

import java.util.List;
import java.util.Map;

import client.movies.bean.MovieplatformDTO;


public interface MovieFinderDAO {
	public List<MovieplatformDTO> getAgelim(Map<String, String> map);

	public List<MovieplatformDTO> getMovieList(int startNum, int endNum, String searchtext, String searchfield, String genre, String nation, String ageLimit, String year_start, String year_end);

	public int getMovieTotalA(String searchtext, String searchfield, String genre, String nation, String ageLimit, String year_start, String year_end);
}
