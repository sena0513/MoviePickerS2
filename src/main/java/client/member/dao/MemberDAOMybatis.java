package client.member.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.member.bean.MemberDTO;
import client.wishList.bean.WishlistDTO;
import client.usagehistory.bean.UsagehistoryDTO;
import client.movies.bean.MoviePointDTO;
import client.movies.bean.MovieplatformDTO;
import client.review.bean.ReviewDTO;
import client.ticket.bean.TicketDTO;

@Transactional
@Component
public class MemberDAOMybatis implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO MemberView(String id) {
		MemberDTO list = sqlSession.selectOne("MemberSQL.MemberView", id);
		return list;
	}

	@Override
	public void register(MemberDTO memberDTO) {
		sqlSession.insert("MemberSQL.register", memberDTO);
	}

	@Override
	public MemberDTO login(String id, String pw) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.selectOne("MemberSQL.login", map);
	}

	@Override
	public MemberDTO idCheck(String id) {
		return sqlSession.selectOne("MemberSQL.MemberView", id);
	}

	@Override
	public int updateMember(MemberDTO memberDTO, String id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("memberDTO", memberDTO);

		System.out.println("Mybaits 비밀번호 : "+map.get(memberDTO.getPw()));
		return sqlSession.update("MemberSQL.updateMember", map);
	}

	@Override
	public void deleteMember(String id) {
		sqlSession.delete("MemberSQL.deleteMember", id);
	}

	@Override
	public String idSearch(String name, String birth1, String birth2, String birth3, String rphone1, String rphone2,
			String rphone3) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("birth1", birth1);
		map.put("birth2", birth2);
		map.put("birth3", birth3);
		map.put("rphone1", rphone1);
		map.put("rphone2", rphone2);
		map.put("rphone3", rphone3);

		return sqlSession.selectOne("MemberSQL.idSearch",map);
	}

	@Override
	public MemberDTO getPw(String id) {
		return sqlSession.selectOne("MemberSQL.getPw",id);
	}

	@Override
	public List<MemberDTO> getMemberData(String id) {
		return sqlSession.selectList("MemberSQL.memberData",id);
	}

	@Override
	public void updateProfileImage(Map<String, String> map) {
		sqlSession.update("MemberSQL.updateProfileImage",map);

	}

	@Override
	public MemberDTO nicknameCheck(String nickName) {
		return sqlSession.selectOne("MemberSQL.nicknameCheck",nickName);
	}

	@Override
	public MemberDTO nickname_idCheck(Map<String, String> map) {

		return sqlSession.selectOne("MemberSQL.nickname_idCheck",map);
	}
	@Override
	public List<MovieplatformDTO> getMovieInfoForMovielog(String movieNameforKr) {
		return sqlSession.selectList("MemberSQL.getMovieInfoForMovielog", movieNameforKr);
	}

	@Override
	public List<WishlistDTO> getWishlist(String id) {
		return sqlSession.selectList("MemberSQL.getWishlist", id);
	}
	
	@Override
	public List<WishlistDTO> getWishlist(int startNum, int endNum, String id) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("id", id);

		return sqlSession.selectList("MemberSQL.getWishlist02", map);
	}

	@Override
	public int getWishlistCount(String id) {
		return sqlSession.selectOne("MemberSQL.getWishlistCount", id);
	}

	@Override
	public int getMovielogCount(String id) {
		return sqlSession.selectOne("MemberSQL.getMovielogCount", id);
	}

	@Override
	public List<UsagehistoryDTO> getMovielogList(int startNum, int endNum, String id) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("id", id);

		return sqlSession.selectList("MemberSQL.getMovielogList", map);
	}

	@Override
	public int UpdatePw(String id, String pw) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.update("MemberSQL.updatePw", map);
	}

	@Override
	public int InsertWishList(Map<String, String> map) {
		return sqlSession.insert("MemberSQL.insertWishList", map);

	}

	@Override
	public int deleteWishList(Map<String, String> map) {
		return sqlSession.delete("MemberSQL.deleteWishList", map);
	}


	@Override
	public String profileImgName(String id) {
		return sqlSession.selectOne("MemberSQL.profileImgName", id);
	}

	@Override
	public void deleteProfileImg(String fileName, String id) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("fileName", fileName);
		map.put("id", id);
		sqlSession.update("MemberSQL.deleteProfileImg", map);
	}

	@Override
	public void updateNickName(String id, String nickNameText) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("nickName", nickNameText);
		sqlSession.update("MemberSQL.updateNickName", map);
	}
	
	@Override
	   public List<MoviePointDTO> getHeartInfoForWishlist(String movienameforkr) {
	      return sqlSession.selectList("MemberSQL.getHeartInfoForWishlist", movienameforkr);
	   }

	   @Override
	   public List<ReviewDTO> getReviewInfoForMovielog(Map<String, String> map) {
	      return sqlSession.selectList("MemberSQL.getReviewInfoForMovielog", map);
	   }
	
	
	// Ticket Mypage
	@Override
	   public List<TicketDTO> getTicketInfo(String id) {
	      return sqlSession.selectList("MemberSQL.getTicketInfo", id);
	   }

	   @Override
	   public List<TicketDTO> getSelectedMovieInfo(String ticketmoviecode) {
	      return sqlSession.selectList("MemberSQL.getSelectedMovieInfo", ticketmoviecode);
	   }

	   @Override
	   public void deleteTicketInfo(String ticketmoviecode) {
	      sqlSession.delete("MemberSQL.deleteTicketInfo", ticketmoviecode);
	   }

	   @Override
	   public int getUsedPoint(Map<String, String> getUsedPointMap) {
	      return sqlSession.selectOne("MemberSQL.getUsedPoint", getUsedPointMap);
	   }
	   
	   @Override
	   public void resetSeats1(Map<String, Object> movieCanceledMap1) {
	      sqlSession.update("MemberSQL.resetSeats1", movieCanceledMap1);
	   }
	   
	   @Override
	   public void resetSeats2(Map<String, Object> movieCanceledMap2) {
	      sqlSession.update("MemberSQL.resetSeats2", movieCanceledMap2);
	   }

	   @Override
	   public void resetSeats3(Map<String, Object> movieCanceledMap3) {
	      sqlSession.update("MemberSQL.resetSeats3", movieCanceledMap3);
	   }

	   @Override
	   public void resetSeats4(Map<String, Object> movieCanceledMap4) {
	      sqlSession.update("MemberSQL.resetSeats4", movieCanceledMap4);
	   }

	   @Override
	   public void resetSeats5(Map<String, Object> movieCanceledMap5) {
	      sqlSession.update("MemberSQL.resetSeats5", movieCanceledMap5);
	   }
	   
	   @Override
	   public String getTheaterRegion(int seq) {
	      return sqlSession.selectOne("MemberSQL.getTheaterRegion", seq);
	   }

	   @Override
	   public String getUserPoint(String id) {
	      return sqlSession.selectOne("MemberSQL.getUserPoint", id);
	   }
	   
	   @Override
	   public void returnPoint(Map<String, Object> pointMap) {
	      sqlSession.update("MemberSQL.returnPoint", pointMap);
	   }

	   @Override
	   public int getUsageInfo(Map<String, String> getUsedPointMap) {
	      return sqlSession.selectOne("MemberSQL.getUsageInfo", getUsedPointMap);
	   }


	   @Override
	   public void deleteUsagehistory(String ticketmoviecode) {
	      sqlSession.delete("MemberSQL.deleteUsagehistory", ticketmoviecode);
	   }
	
	
	
}