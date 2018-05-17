package client.member.dao;

import java.util.List;
import java.util.Map;

import client.member.bean.MemberDTO;
import client.movies.bean.MoviePointDTO;
import client.movies.bean.MovieplatformDTO;
import client.review.bean.ReviewDTO;
import client.ticket.bean.TicketDTO;
import client.usagehistory.bean.UsagehistoryDTO;
import client.wishList.bean.WishlistDTO;


public interface MemberDAO {
	//전에 쓰던거
	public MemberDTO MemberView(String id);
	public void register(MemberDTO memberDTO);
	public MemberDTO login(String id, String pw);
	public MemberDTO idCheck(String id);
	public int updateMember(MemberDTO memberDTO, String id);
	public void deleteMember(String id);
	public String idSearch(String name, String birth1, String birth2, String birth3, String rphone1, String rphone2,String rphone3);
	public MemberDTO getPw(String id);
	public int UpdatePw(String id, String pw);
	public List<MemberDTO> getMemberData(String id);
	public void updateProfileImage(Map<String, String> map);
	public MemberDTO nicknameCheck(String nickname);
	public MemberDTO nickname_idCheck(Map<String, String> map);

	//위시리스트
	public int InsertWishList(Map<String,String> map);
	public List<MovieplatformDTO> getMovieInfoForMovielog(String movieNameforKr);
	public List<WishlistDTO> getWishlist(String id);
	public int getWishlistCount(String id);
	public int getMovielogCount(String id);
	public List<UsagehistoryDTO> getMovielogList(int startNum, int endNum, String id);
	public int deleteWishList(Map<String, String> map);
	public List<MoviePointDTO> getHeartInfoForWishlist(String movienameforkr);
	public List<ReviewDTO> getReviewInfoForMovielog(Map<String, String> map);
	public List<WishlistDTO> getWishlist(int startNum, int endNum, String id);
	
	
	//프로필이미지
	public String profileImgName(String id);
	public void deleteProfileImg(String fileName, String id);
	public void updateNickName(String id, String nickNameText);
	
	//Ticket Mypage
	public List<TicketDTO> getTicketInfo(String id);
	   public List<TicketDTO> getSelectedMovieInfo(String ticketmoviecode);
	   public void deleteTicketInfo(String ticketmoviecode);
	   
	   public int getUsedPoint(Map<String, String> getUsedPointMap);
	   
	   public void resetSeats1(Map<String, Object> movieCanceledMap1);
	   public void resetSeats2(Map<String, Object> movieCanceledMap2);
	   public void resetSeats3(Map<String, Object> movieCanceledMap3);
	   public void resetSeats4(Map<String, Object> movieCanceledMap4);
	   public void resetSeats5(Map<String, Object> movieCanceledMap5);
	   
	   public String getTheaterRegion(int seq);
	   
	   //------------------------------------------------- 내가 새로 추가한 부분
	   public String getUserPoint(String id);
	   public void returnPoint(Map<String, Object> pointMap);
	   
	   public int getUsageInfo(Map<String, String> getUsedPointMap);
	   
	   public void deleteUsagehistory(String ticketmoviecode);
	  
	
	

}