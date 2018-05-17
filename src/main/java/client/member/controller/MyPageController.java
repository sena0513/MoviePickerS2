package client.member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import client.helpCenter.bean.QnaDTO;
import client.helpCenter.bean.QnaPaging;
import client.helpCenter.dao.QnaDAO;
import client.member.bean.MemberDTO;
import client.member.dao.MemberDAO;
import client.movies.bean.MoviePointDTO;
import client.movies.bean.MovieplatformDTO;
import client.review.bean.ReviewDTO;
import client.ticket.bean.TicketDTO;
import client.usagehistory.bean.UsagehistoryDTO;
import client.wishList.bean.MovielogPaging;
import client.wishList.bean.WishlistDTO;
import client.wishList.bean.WishlistPaging;

@Component
@RequestMapping("/myPage")
public class MyPageController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private QnaPaging qnaPaging;
	@Autowired
	private MovielogPaging movielogPaging;
	@Autowired
	private WishlistPaging wishlistPaging;

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public ModelAndView index(HttpSession session, @RequestParam(required = false) String pg,
			@RequestParam(required = false) String searchtext) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("loginId");

		// DB 연결
		MemberDTO memberDTO = memberDAO.MemberView(id);

		if (pg == null)
			pg = "1";
		if (searchtext == null)
			searchtext = "";
		int endNum = Integer.parseInt(pg) * 5;
		int startNum = endNum - 4;

		List<QnaDTO> QnaList = qnaDAO.QnaList(startNum, endNum, id, searchtext);
		int QnaTotalA = qnaDAO.getQnaTotalA(id, searchtext);

		mav.addObject("pg", pg);
		mav.addObject("QnaTotalA", QnaTotalA);
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("QnaList", QnaList);
		mav.addObject("display", "/WEB-INF/myPage/myPageHome.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	/*------------------- 나 의 정 보 수 정 -------------------*/
	@RequestMapping(value = "/myInfoForm.do", method = RequestMethod.GET)
	public ModelAndView myInfoForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("loginId");

		// DB 연결
		MemberDTO memberDTO = memberDAO.MemberView(id);

		mav.addObject("memberDTO", memberDTO);
		mav.addObject("display", "/WEB-INF/myPage/myInfo.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/myInfo.do", method = RequestMethod.POST)
	public ModelAndView myInfo(HttpSession session, @ModelAttribute MemberDTO memberDTO) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("loginId");

		
		memberDAO.updateMember(memberDTO, id);

		mav.addObject("display", "/WEB-INF/myPage/myPageHome.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	/*------------------- 회 원 탈 퇴 -------------------*/
	@RequestMapping(value = "/myInfoDelete.do", method = RequestMethod.GET)
	public ModelAndView myInfoDelete(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("loginId");
		// DB 연결
		MemberDTO memberDTO = memberDAO.MemberView(id);

		mav.addObject("memberDTO", memberDTO);
		mav.addObject("id", id);
		mav.addObject("display", "/WEB-INF/myPage/myInfoDelete.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/myInfoDeleteResult.do", method = RequestMethod.POST)
	public ModelAndView myInfoDeleteResult(HttpSession session, @RequestParam String pw) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("loginId");

		
		// DB
		MemberDTO memberDTO = memberDAO.login(id, pw);

		if (memberDTO == null) {
			mav.setViewName("/WEB-INF/myPage/myInfoDeleteFail");
		} else {
			// 회원탈퇴 완료
			memberDAO.deleteMember(id);
			session.removeAttribute("loginId");
			mav.setViewName("/WEB-INF/main/dropOutForm");
		}

		return mav;
	}

	/*------------------- 일대일 문의 내역 -------------------*/
	@RequestMapping(value = "/myInquiryQnAList.do", method = RequestMethod.GET)
	public ModelAndView myInquiryQnAList(HttpSession session, @RequestParam(required = false) String pg,
			@RequestParam(required = false) String searchtext) {
		ModelAndView mav = new ModelAndView();

		if (pg == null)
			pg = "1";
		if (searchtext == null)
			searchtext = "";

		// ID 세션 추가
		String id = (String) session.getAttribute("loginId");

		// DB 연결
		MemberDTO memberDTO = memberDAO.MemberView(id);

		mav.addObject("memberDTO", memberDTO);

		// 1페이지당 5개씩
		int endNum = Integer.parseInt(pg) * 5;
		int startNum = endNum - 4;

		// DB
		List<QnaDTO> QnaList = qnaDAO.QnaList(startNum, endNum, id, searchtext);

		// 페이징 처리
		int QnaTotalA = qnaDAO.getQnaTotalA(id, searchtext);
		qnaPaging.setCurrentPage(Integer.parseInt(pg));
		qnaPaging.setPageBlock(3);
		qnaPaging.setPageSize(5);
		qnaPaging.setTotalA(QnaTotalA);
		qnaPaging.makePagingHTML(searchtext);

		mav.addObject("pg", pg);
		mav.addObject("QnaTotalA", QnaTotalA);
		mav.addObject("qnaPaging", qnaPaging);
		mav.addObject("QnaList", QnaList);
		mav.addObject("display", "/WEB-INF/myPage/myInquiryQnAList.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/myInquiryQnAView.do", method = RequestMethod.GET)
	public ModelAndView myInquiryQnAView(@RequestParam(required = false) String seq,
			@RequestParam(required = false) String pg, @RequestParam(required = false) String searchtext,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/* 유효성검사 필요 */

		// ID 세션 추가
		String id = (String) session.getAttribute("loginId");

		// DB 연결
		MemberDTO memberDTO = memberDAO.MemberView(id);

		mav.addObject("memberDTO", memberDTO);

		// DB
		
		QnaDTO qnaDTO = qnaDAO.QnaView(Integer.parseInt(seq));

		mav.addObject("pg", pg);
		mav.addObject("qnaDTO", qnaDTO);
		mav.addObject("display", "/WEB-INF/myPage/myInquiryQnA.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/qnaDelete.do", method = RequestMethod.GET)
	public ModelAndView qnaDelete(@RequestParam(required = false) String seq, @RequestParam(required = false) String pg,
			@RequestParam String qna) {
		ModelAndView mav = new ModelAndView();
		if (pg == null)
			pg = "1";

		
		// DB
		qnaDAO.qnaDelete(seq, qna);

		mav.setViewName("redirect:/myPage/myInquiryQnAList.do?pg=" + pg);
		return mav;
	}

	@RequestMapping(value = "/mypoint.do", method = RequestMethod.GET)
	public ModelAndView mypoint(HttpSession session, @RequestParam(required = false) String pg,
			@RequestParam(required = false) String searchtext) {
		ModelAndView mav = new ModelAndView();

		String id = (String) session.getAttribute("loginId");

		MemberDTO memberDTO = memberDAO.MemberView(id);

		mav.addObject("memberDTO", memberDTO);
		mav.addObject("display", "/WEB-INF/myPage/mypoint.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/movieticket.do", method = RequestMethod.GET)
	public ModelAndView movieticket(HttpSession session, @RequestParam(required = false) String pg,
			@RequestParam(required = false) String searchtext) {
		ModelAndView mav = new ModelAndView();

		String id = (String) session.getAttribute("loginId");

		MemberDTO memberDTO = memberDAO.MemberView(id);

		mav.addObject("memberDTO", memberDTO);
		mav.addObject("display", "/WEB-INF/myPage/movieticket.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/go_edit_page.do", method = RequestMethod.GET)
	public ModelAndView go_edit_page(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String id = (String) session.getAttribute("loginId");
		MemberDTO memberDTO2 = memberDAO.MemberView(id);
		List<MemberDTO> memberDTO = memberDAO.getMemberData(id);
		String fileName = memberDTO.get(0).getProfileImage();
		String src = "../res/image/profile/" + fileName;
		mav.addObject("id", id);
		mav.addObject("memberDTO2", memberDTO2);
		mav.addObject("name", memberDTO.get(0).getName());
		mav.addObject("nickname", memberDTO.get(0).getNickName());
		mav.addObject("src", src);
		mav.setViewName("/WEB-INF/myPage/profile");
		return mav;
	}

	@RequestMapping(value = "profileWrite.do", method = RequestMethod.POST)
	public ModelAndView profileWrite(@RequestParam MultipartFile img, HttpSession session, Model model,
			Map<String, String> map, @RequestParam String nickNameText) {
		ModelAndView mav = new ModelAndView();

		String id = (String) session.getAttribute("loginId");

		String filePath = "C:\\MvWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mvProject\\res\\image\\profile";
		String fileName = id + img.getOriginalFilename();
		File file = new File(filePath, fileName);

		if (!fileName.equals("")) {
			// img를 통해 들어온 임시파일을 file에 복사
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}

			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setProfileImage(fileName);

			if (!fileName.equals(memberDTO.getProfileImage())) {
				fileName = "default_profileImage.PNG";
			}
			map.put("id", id);
			map.put("fileName", fileName);
			map.put("nickName", nickNameText);
			memberDAO.updateProfileImage(map);
		} else {
			memberDAO.updateNickName(id, nickNameText);
		}
		// DB
		mav.setViewName("/WEB-INF/myPage/profile");
		return mav;
	}

	@RequestMapping(value = "/profileImgDelete.do", method = RequestMethod.GET)
	public String profileImgDelete(HttpSession session) {
		String id = (String) session.getAttribute("loginId");

		// 프로필 이미지 정보
		String filename = memberDAO.profileImgName(id);

		String path = "C:\\MvWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mvProject\\res\\image\\profile";
		// 상품 이미지 삭제
		if (filename != null) {
			File file = new File(path + filename);
			// 파일이 존재하면
			if (file.exists()) {
				file.delete(); // 파일 삭제
			}
		}
		String fileName = "";
		memberDAO.deleteProfileImg(fileName, id);
		return "redirect:/myPage/go_edit_page.do";
	}

	@RequestMapping(value = "/nicknameCheck.do", method = RequestMethod.POST)
	public @ResponseBody String nicknameCheck(@RequestParam String nickNameText) {
		MemberDTO memberDTO = memberDAO.nicknameCheck(nickNameText);
		if (memberDTO == null) {
			return "non_exist";
		} else {
			return "exist";
		}
	}

	@RequestMapping(value = "/nickname_idCheck.do", method = RequestMethod.POST)
	public @ResponseBody String nickname_idCheck(@RequestParam String nickNameText, HttpSession session,
			Map<String, String> map) {
		String id = (String) session.getAttribute("loginId");
		map.put("id", id);
		map.put("nickName", nickNameText);

		MemberDTO memberDTO = memberDAO.nickname_idCheck(map);
		if (memberDTO == null) {
			return "non_exist"; // 아이디랑 닉네임 다름.
		} else {
			return "exist";
		}
	}

	/*----------------------------무비로그--------------*/

	@RequestMapping(value = "/myMovielog.do", method = RequestMethod.GET)
	public ModelAndView myMovielog(HttpServletRequest request, @RequestParam(required = false) String pg,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String id = (String) session.getAttribute("loginId");

		if (pg == null)
			pg = "1";

		// 1페이지당 5개씩
		int endNum = Integer.parseInt(pg) * 5;
		int startNum = endNum - 4;

		List<UsagehistoryDTO> pagelist = memberDAO.getMovielogList(startNum, endNum, id);

		
		// 페이징처리
		int totalA = memberDAO.getMovielogCount(id); // 총글수
		movielogPaging.setCurrentPage(Integer.parseInt(pg));
		movielogPaging.setPageBlock(3);
		movielogPaging.setPageSize(5);
		movielogPaging.setTotalA(totalA);
		movielogPaging.makePagingHTML();

		// 응답
		request.setAttribute("pg", pg);
		request.setAttribute("pagelist", pagelist);
		request.setAttribute("movielogPaging", movielogPaging);

		// -----------------------------------------

		int movielogCount = memberDAO.getMovielogCount(id);
		int wishlistCount = memberDAO.getWishlistCount(id);

		// 영화 정보
		List<MovieplatformDTO> getMovieInfoForMovielog = new ArrayList<MovieplatformDTO>();
		List<MovieplatformDTO> list = new ArrayList<>();

		for (int i = 0; i < pagelist.size(); i++) {
			list = memberDAO.getMovieInfoForMovielog(pagelist.get(i).getMovieName());

			for (int j = 0; j < list.size(); j++) {
				getMovieInfoForMovielog.add(list.get(j));
			}

		}

		

		// 평점 가져오기
		Map<String, String> map = new HashMap<>();
		List<ReviewDTO> getReviewInfoForMovielog = new ArrayList<ReviewDTO>();
		List<ReviewDTO> list3 = new ArrayList<>();

		for (int k = 0; k < pagelist.size(); k++) {
			map.put("id", id);
			map.put("movienameforkr", pagelist.get(k).getMovieName());

			list3 = memberDAO.getReviewInfoForMovielog(map);

			// 첫번째 리뷰가 없으면 두번째로 넘어가기 때문에 이런 문제가 생긴 것.
			for (int z = 0; z < list3.size(); z++) {
				if (list3.get(z) == null) {
					getReviewInfoForMovielog.set(z, null);
				} else {
					getReviewInfoForMovielog.add(list3.get(z));
				}
			}
		}

		

		request.setAttribute("wishlistCount", wishlistCount);
		request.setAttribute("movielogCount", movielogCount);
		request.setAttribute("getMovieInfoForMovielog", getMovieInfoForMovielog);
		request.setAttribute("getReviewInfoForMovielog", getReviewInfoForMovielog);
		mav.addObject("display", "/WEB-INF/myPage/myMovielog.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	/*--------------------위시리스트 */

	@RequestMapping(value = "/movieWishlist.do", method = RequestMethod.GET)
	public ModelAndView movieWishlist(HttpServletRequest request, @RequestParam(required = false) String pg,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String id = (String) session.getAttribute("loginId");

		if (pg == null)
			pg = "1";

		// 1페이지당 5개씩
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		List<WishlistDTO> pagelist = memberDAO.getWishlist(startNum, endNum, id);

		// 페이징처리
		int totalA = memberDAO.getWishlistCount(id); // 총글수

		wishlistPaging.setCurrentPage(Integer.parseInt(pg));
		wishlistPaging.setPageBlock(3);
		wishlistPaging.setPageSize(6);
		wishlistPaging.setTotalA(totalA);
		wishlistPaging.makePagingHTML();

		// 응답
		request.setAttribute("pg", pg);
		request.setAttribute("pagelist", pagelist);
		request.setAttribute("wishlistPaging", wishlistPaging);

		// ---------------------------values

		int movielogCount = memberDAO.getMovielogCount(id);
		int wishlistCount = memberDAO.getWishlistCount(id);

		List<WishlistDTO> getWishlist = memberDAO.getWishlist(id);

		List<MovieplatformDTO> getMovieInfoForWishlist = new ArrayList<MovieplatformDTO>();
		List<MovieplatformDTO> list2 = new ArrayList<>();

		for (int i = 0; i < getWishlist.size(); i++) {
			list2 = memberDAO.getMovieInfoForMovielog(getWishlist.get(i).getMovienameforkr());

			for (int j = 0; j < list2.size(); j++) {
				getMovieInfoForWishlist.add(list2.get(j));
			}
		}

		List<MoviePointDTO> getHeartInfoForWishlist = new ArrayList<MoviePointDTO>();
		List<MoviePointDTO> list3 = new ArrayList<>();

		for (int k = 0; k < getWishlist.size(); k++) {
			list3 = memberDAO.getHeartInfoForWishlist(getWishlist.get(k).getMovienameforkr());

			for (int z = 0; z < list3.size(); z++) {
				getHeartInfoForWishlist.add(list3.get(z));
			}
		}

		request.setAttribute("getWishlist", getWishlist);
		request.setAttribute("wishlistCount", wishlistCount);
		request.setAttribute("movielogCount", movielogCount);
		request.setAttribute("getMovieInfoForWishlist", getMovieInfoForWishlist);
		request.setAttribute("getHeartInfoForWishlist", getHeartInfoForWishlist);

		mav.addObject("display", "/WEB-INF/myPage/movieWishlist.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/myReservationStep1.do", method = RequestMethod.GET)
	public ModelAndView toMyPageReservationStep1(HttpSession session) {

		String id = (String) session.getAttribute("loginId");

		ModelAndView mav = new ModelAndView();
		MemberDTO memberDTO = memberDAO.MemberView(id);
		List<TicketDTO> ticketList = memberDAO.getTicketInfo(id);

		mav.addObject("ticketList", ticketList);

		mav.addObject("memberDTO", memberDTO);
		mav.addObject("display", "/WEB-INF/myPage/myReservationStep1.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/myReservationStep2.do", method = RequestMethod.GET)
	public ModelAndView toMyPageReservationStep2(HttpSession session, @RequestParam String ticketmoviecode) {

		String id = (String) session.getAttribute("loginId");

		ModelAndView mav = new ModelAndView();

		List<TicketDTO> movieTicket = new ArrayList<>();
		movieTicket = memberDAO.getSelectedMovieInfo(ticketmoviecode);
		// DB 연결
		MemberDTO memberDTO = memberDAO.MemberView(id);

		mav.addObject("memberDTO", memberDTO);
		mav.addObject("movieTicket", movieTicket);

		mav.addObject("display", "/WEB-INF/myPage/myReservationStep2.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value = "/myReservationStep3.do", method = RequestMethod.GET)
	public ModelAndView toMyPageReservationStep3(@RequestParam String ticketmoviecode, HttpSession session) {

		String id = (String) session.getAttribute("loginId");

		ModelAndView mav = new ModelAndView();
		// DB 연결
		MemberDTO memberDTO = memberDAO.MemberView(id);

		mav.addObject("memberDTO", memberDTO);
		// ----------------------------------------------------------- 정보 뿌려주기 ----
		List<TicketDTO> movieCanceled = new ArrayList<>();
		movieCanceled = memberDAO.getSelectedMovieInfo(ticketmoviecode);

		
		//------------------------------------------------------ 취소시 없을떄
		if (movieCanceled.size()==0) {
			mav.addObject("display", "/WEB-INF/myPage/noTicketData.jsp");
		}
		
		else {
			mav.addObject("movieCanceled", movieCanceled);
	
			// -------------------------------------------------------- 총좌석 , 빈자석으로 만들기 ----
	
			if (movieCanceled.get(0).getTicketmoviepeople() == 1) {
				Map<String, Object> movieCanceledMap1 = new HashMap<>();
				movieCanceledMap1.put("moviePeople", movieCanceled.get(0).getTicketmoviepeople());
				movieCanceledMap1.put("movieSeat1", movieCanceled.get(0).getTicketmovieseat1());
				movieCanceledMap1.put("ticketselectMovieSeq", movieCanceled.get(0).getSelectedmovieseq());
				memberDAO.resetSeats1(movieCanceledMap1);
			}
			if (movieCanceled.get(0).getTicketmoviepeople() == 2) {
				Map<String, Object> movieCanceledMap2 = new HashMap<>();
				movieCanceledMap2.put("moviePeople", movieCanceled.get(0).getTicketmoviepeople());
				movieCanceledMap2.put("movieSeat1", movieCanceled.get(0).getTicketmovieseat1());
				movieCanceledMap2.put("movieSeat2", movieCanceled.get(0).getTicketmovieseat2());
				movieCanceledMap2.put("ticketselectMovieSeq", movieCanceled.get(0).getSelectedmovieseq());
				memberDAO.resetSeats2(movieCanceledMap2);
			}
			if (movieCanceled.get(0).getTicketmoviepeople() == 3) {
				Map<String, Object> movieCanceledMap3 = new HashMap<>();
				movieCanceledMap3.put("moviePeople", movieCanceled.get(0).getTicketmoviepeople());
				movieCanceledMap3.put("movieSeat1", movieCanceled.get(0).getTicketmovieseat1());
				movieCanceledMap3.put("movieSeat2", movieCanceled.get(0).getTicketmovieseat2());
				movieCanceledMap3.put("movieSeat3", movieCanceled.get(0).getTicketmovieseat3());
				movieCanceledMap3.put("ticketselectMovieSeq", movieCanceled.get(0).getSelectedmovieseq());
				memberDAO.resetSeats3(movieCanceledMap3);
			}
			if (movieCanceled.get(0).getTicketmoviepeople() == 4) {
				Map<String, Object> movieCanceledMap4 = new HashMap<>();
				movieCanceledMap4.put("moviePeople", movieCanceled.get(0).getTicketmoviepeople());
				movieCanceledMap4.put("movieSeat1", movieCanceled.get(0).getTicketmovieseat1());
				movieCanceledMap4.put("movieSeat2", movieCanceled.get(0).getTicketmovieseat2());
				movieCanceledMap4.put("movieSeat3", movieCanceled.get(0).getTicketmovieseat3());
				movieCanceledMap4.put("movieSeat4", movieCanceled.get(0).getTicketmovieseat4());
				movieCanceledMap4.put("ticketselectMovieSeq", movieCanceled.get(0).getSelectedmovieseq());
				memberDAO.resetSeats4(movieCanceledMap4);
			}
			if (movieCanceled.get(0).getTicketmoviepeople() == 5) {
				Map<String, Object> movieCanceledMap5 = new HashMap<>();
				movieCanceledMap5.put("moviePeople", movieCanceled.get(0).getTicketmoviepeople());
				movieCanceledMap5.put("movieSeat1", movieCanceled.get(0).getTicketmovieseat1());
				movieCanceledMap5.put("movieSeat2", movieCanceled.get(0).getTicketmovieseat2());
				movieCanceledMap5.put("movieSeat3", movieCanceled.get(0).getTicketmovieseat3());
				movieCanceledMap5.put("movieSeat4", movieCanceled.get(0).getTicketmovieseat4());
				movieCanceledMap5.put("movieSeat5", movieCanceled.get(0).getTicketmovieseat5());
				movieCanceledMap5.put("ticketselectMovieSeq", movieCanceled.get(0).getSelectedmovieseq());
				memberDAO.resetSeats5(movieCanceledMap5);
			}
	
			// ----------------------------------------------------------- 포인트 반환 시키기 ----
			int getPlusedPoint = movieCanceled.get(0).getPointPlused();
	
			Map<String, String> getUsedPointMap = new HashMap<>();
			getUsedPointMap.put("id", id);
			getUsedPointMap.put("moviename", movieCanceled.get(0).getTicketmoviename());
			getUsedPointMap.put("ticketmoviecode", ticketmoviecode);
	
			
	
			int cancelUsedPoint = memberDAO.getUsageInfo(getUsedPointMap);
	
			Map<String, Object> pointMap = new HashMap<>();
			pointMap.put("id", id);
			pointMap.put("getPlusedPoint", getPlusedPoint);
			pointMap.put("cancelUsedPoint", cancelUsedPoint);
	
			memberDAO.returnPoint(pointMap);
			memberDAO.deleteUsagehistory(ticketmoviecode);
	
			// -----------------------------------------------------------테이블에서 삭제 시키기 ---
			memberDAO.deleteTicketInfo(ticketmoviecode);
	
			mav.addObject("display", "/WEB-INF/myPage/myReservationStep3.jsp");
		}
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

}