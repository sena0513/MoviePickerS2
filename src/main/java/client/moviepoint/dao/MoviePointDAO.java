package client.moviepoint.dao;

import java.util.List;
import java.util.Map;

import client.movies.bean.MoviePointDTO;
import client.review.bean.ReviewDTO;

public interface MoviePointDAO {

	public MoviePointDTO getMoviePoint(String movienameforkr);
	public MoviePointDTO getMoviePoint(int seq);
	public List<ReviewDTO> getReviewList(String seq, int startNum, int endNum);
	public int getTotalReviewFromMv_seq(String mv_seq);
	public int insertreview(Map<String,String>map);	
	public void charmpointupdate(Map<String,String>map);
	public List<ReviewDTO> getReviewdata(Map<String,String>map);
	public void updatemoviepoint(Map<String,String>map);
	public List<ReviewDTO> reviewcheck(Map<String,String>map);
	public int modifyreviewcontents(Map<String,String>map);
	public void removereview(Map<String,String>map);
	public void reportreview(Map<String,String>map);
	public List<ReviewDTO> myreview(int endNum,int startNum,String id);
	public int getmyreviewTotalA(String id);
	public void deletemyreview(int rev_seq);
	public int plusHeartToMovienameforkr(Map<String, String> map);
	public int minusHeartToMovienameforkr(Map<String, String> map);
}
