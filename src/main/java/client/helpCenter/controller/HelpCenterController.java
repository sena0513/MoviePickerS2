package client.helpCenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import client.helpCenter.bean.NoticeBoardDTO;
import client.helpCenter.bean.NoticeBoardPaging;
import client.helpCenter.bean.QnaBoardDTO;
import client.helpCenter.bean.QnaBoardPaging;
import client.helpCenter.bean.QnaDTO;
import client.helpCenter.dao.NoticeBoardDAO;
import client.helpCenter.dao.QnaBoardDAO;
import client.helpCenter.dao.QnaDAO;
import client.member.bean.MemberDTO;
import client.member.dao.MemberDAO;

@Component
@RequestMapping("/helpCenter")
public class HelpCenterController {
   @Autowired
   private QnaBoardDAO qnaBoardDAO;
   @Autowired
   private QnaBoardPaging qnaBoardPaging;
   @Autowired
   private NoticeBoardDAO noticeBoardDAO;
   @Autowired
   private NoticeBoardPaging noticeBoardPaging;
   @Autowired
   private QnaDAO qnaDAO;
   @Autowired
   private MemberDAO memberDAO;

   @RequestMapping(value="/index.do", method=RequestMethod.GET)
   public ModelAndView helpCenterIndex(@RequestParam(required=false) String pg, Model model,
         @RequestParam(required=false) String searchtext, @RequestParam(required=false) String searchfield,
         @RequestParam(required=false) String email) {
      ModelAndView mav = new ModelAndView();
      if(pg==null) pg="1";
      if(searchfield==null) searchfield = "title";
      if(searchtext==null) searchtext = "";
      if(email!=null) {
    	  mav.addObject("email", email);
      }
      // 1페이지당 5개씩
      int endNum = Integer.parseInt(pg)*5;
      int startNum = endNum-4;
      
      List<NoticeBoardDTO> NoticeList = noticeBoardDAO.getNoticeBoardList(startNum, endNum, searchtext, searchfield);

      mav.addObject("NoticeList", NoticeList);
      mav.addObject("display", "/WEB-INF/helpCenter/helpCenter-index.jsp");
      mav.setViewName("/WEB-INF/main/index");      
      return mav;
   }

   /* ------------------- 공지/뉴스 ------------------- */
   @RequestMapping(value="/notice_list.do", method=RequestMethod.GET)
   public ModelAndView notice_list(@RequestParam(required=false) String pg, Model model,
         @RequestParam(required=false) String searchtext, @RequestParam(required=false) String searchfield) {
      ModelAndView mav = new ModelAndView();
      if(pg==null) pg="1";
      if(searchfield==null) searchfield = "title";
      if(searchtext==null) searchtext = "";

      // 1페이지당 5개씩
      int endNum = Integer.parseInt(pg)*5;
      int startNum = endNum-4;

/*      System.out.println("검색한 값1 : >" + searchfield+"<");
      System.out.println("검색한 키워드1 : >" + searchtext+"<");
      System.out.println("시작 페이지1 : >" + startNum+"<");
      System.out.println("끝 페이지1 : >" + endNum+"<");*/

      List<NoticeBoardDTO> NoticeList = noticeBoardDAO.getNoticeBoardList(startNum, endNum, searchtext, searchfield);

      // 페이징 처리
      int NoticeTotalA = noticeBoardDAO.getNoticeTotalA(searchtext, searchfield);
      noticeBoardPaging.setCurrentPage(Integer.parseInt(pg));
      noticeBoardPaging.setPageBlock(3);
      noticeBoardPaging.setPageSize(5);
      noticeBoardPaging.setTotalA(NoticeTotalA);
      noticeBoardPaging.makePagingHTML(searchtext, searchfield);

      mav.addObject("pg", pg);
      mav.addObject("NoticeList", NoticeList);
      mav.addObject("NoticeTotalA", NoticeTotalA);
      mav.addObject("searchtext", searchtext);
      mav.addObject("searchfield", searchfield);
      mav.addObject("noticeBoardPaging", noticeBoardPaging);
      mav.addObject("display", "/WEB-INF/helpCenter/helpCenter-notice-list.jsp");
      mav.setViewName("/WEB-INF/main/index");      
      return mav;
   }


   @RequestMapping(value="/notice_view.do", method=RequestMethod.GET)
   public ModelAndView notice_view(@RequestParam String seq, @RequestParam(required=false) String pg, Model model,
         @RequestParam(required=false) String searchtext, @RequestParam(required=false) String searchfield,
         HttpServletRequest req,HttpServletResponse res) {
      ModelAndView mav = new ModelAndView();

      // 저장된 쿠키 불러오기
      Cookie cookies[] = req.getCookies();
      Map map = new HashMap();
      if(req.getCookies() != null){
         for (int i = 0; i < cookies.length; i++) {
            Cookie obj = cookies[i];
            map.put(obj.getName(),obj.getValue());
         }
      }

      // 저장된 쿠키중에 read_count 만 불러오기
      String readCount = (String) map.get("read_count");
      // 저장될 새로운 쿠키값 생성
      String newReadCount = "|" + seq;

      // 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
      if ( StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1 ) {
         // 없을 경우 쿠키 생성
         Cookie cookie = new Cookie("read_count", readCount + newReadCount);

         res.addCookie(cookie);
         noticeBoardDAO.NoticeViewCount(Integer.parseInt(seq));
      }

      //DB
      NoticeBoardDTO noticeBoardDTO = noticeBoardDAO.NoticeBoardView(Integer.parseInt(seq));
      List<NoticeBoardDTO> noticePreNextList = noticeBoardDAO.getPreNextList(Integer.parseInt(seq));
      String logtime = noticeBoardDTO.getLogtime();

      mav.addObject("noticePreNextList", noticePreNextList);
      mav.addObject("pg", pg);
      mav.addObject("noticeBoardDTO", noticeBoardDTO);      
      mav.addObject("logtime",logtime);
      mav.addObject("searchtext", searchtext);
      mav.addObject("searchfield", searchfield);
      mav.addObject("display", "/WEB-INF/helpCenter/helpCenter-notice-view.jsp");
      mav.setViewName("/WEB-INF/main/index");      
      return mav;
   }

   /* ------------------- 자주찾는 질문 ------------------- */
   @RequestMapping(value="/Qna_list.do", method=RequestMethod.GET)
   public ModelAndView Qna_list(@RequestParam(required=false) String pg, Model model,
         @RequestParam(required=false) String searchtext) {
      ModelAndView mav = new ModelAndView();
      if(pg==null) pg="1";
      if(searchtext==null) searchtext="";

      // 1페이지당 5개씩
      int endNum = Integer.parseInt(pg)*5;
      int startNum = endNum-4;

      List<QnaBoardDTO> QnaList = qnaBoardDAO.getQnaBoardList(startNum, endNum, searchtext);

      // 페이징 처리
      int QnaTotalA = qnaBoardDAO.getQnaTotalA(searchtext);
      qnaBoardPaging.setCurrentPage(Integer.parseInt(pg));
      qnaBoardPaging.setPageBlock(3);
      qnaBoardPaging.setPageSize(5);
      qnaBoardPaging.setTotalA(QnaTotalA);
      qnaBoardPaging.makePagingHTML(searchtext);

      mav.addObject("QnaTotalA", QnaTotalA);
      mav.addObject("pg", pg);
      mav.addObject("QnaList", QnaList);
      mav.addObject("searchtext", searchtext);
      mav.addObject("qnaBoardPaging", qnaBoardPaging);

      mav.addObject("display", "/WEB-INF/helpCenter/helpCenter-QnA-list.jsp");
      mav.setViewName("/WEB-INF/main/index");      
      return mav;
   }

   @RequestMapping(value="/Qna_view.do", method=RequestMethod.GET)
   public ModelAndView Qna_view(@RequestParam String seq, @RequestParam(required=false) String pg, Model model,
         @RequestParam(required=false) String searchtext,
         HttpServletRequest req,HttpServletResponse res) {
      ModelAndView mav = new ModelAndView();
      

      // 저장된 쿠키 불러오기
      Cookie cookies[] = req.getCookies();
      Map map = new HashMap();
      if(req.getCookies() != null){
         for (int i = 0; i < cookies.length; i++) {
            Cookie obj = cookies[i];
            map.put(obj.getName(),obj.getValue());
         }
      }

      // 저장된 쿠키중에 read_count 만 불러오기
      String qnareadCount = (String) map.get("read_countQna");
      // 저장될 새로운 쿠키값 생성
      String newQnaReadCount = "|" + seq;

      // 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
      if ( StringUtils.indexOfIgnoreCase(qnareadCount, newQnaReadCount) == -1 ) {
         // 없을 경우 쿠키 생성
         Cookie cookie = new Cookie("read_countQna", qnareadCount + newQnaReadCount);

         res.addCookie(cookie);
         qnaBoardDAO.QnaViewCount(Integer.parseInt(seq));
      }
      
      //DB
      QnaBoardDTO qnaBoardDTO = qnaBoardDAO.QnaBoardView(Integer.parseInt(seq));
      List<QnaBoardDTO> qnaPreNextList = qnaBoardDAO.getPreNextList(Integer.parseInt(seq));
      String logtime = qnaBoardDTO.getLogtime();

      mav.addObject("qnaPreNextList", qnaPreNextList);
      mav.addObject("pg", pg);
      mav.addObject("qnaBoardDTO", qnaBoardDTO);      
      mav.addObject("logtime",logtime);
      mav.addObject("searchtext", searchtext);

      mav.addObject("display", "/WEB-INF/helpCenter/helpCenter-QnA-view.jsp");
      mav.setViewName("/WEB-INF/main/index");      
      return mav;
   }


   /* ------------------- 이메일 문의 ------------------- */
   @RequestMapping(value="Qna_emailForm.do", method=RequestMethod.GET)
   public ModelAndView Qna_emailForm(HttpSession session) {
      
      ModelAndView mav = new ModelAndView();
      // ID 세션으로 바꿔주어야 할 값
      String id = (String)session.getAttribute("loginId");
      if(id == null) {
    	  mav.addObject("email","email");
    	  mav.setViewName("redirect:/helpCenter/index.do");
          return mav;
      }
      //DB
      MemberDTO memberDTO = memberDAO.MemberView(id);
      
      mav.addObject("memberDTO", memberDTO);
      mav.addObject("display", "/WEB-INF/helpCenter/helpCenter-QnA-email.jsp");
      mav.setViewName("/WEB-INF/main/index");   
      return mav;
   }
   
   @RequestMapping(value="Qna_email.do", method=RequestMethod.POST)
   public ModelAndView Qna_email(@RequestParam Map<String, String> map, HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      
      String id = request.getParameter("id");
      String name = request.getParameter("name");
      String phone1 = request.getParameter("phone1");
      String phone2 = request.getParameter("phone2");
      String email1 = request.getParameter("email1");
      String email2 = request.getParameter("email2");
      String type = request.getParameter("qna_list");
      String title = request.getParameter("title");
      String contents = request.getParameter("contents");
      
      map.put("id", id);
      map.put("name", name);
      map.put("phone1", phone1);
      map.put("phone2", phone2);
      map.put("email1", email1);
      map.put("email2", email2);
      map.put("type", type);
      map.put("title", title);
      map.put("contents", contents);
      
      //DB
      qnaDAO.qnaWrite(map);
      
      mav.setViewName("redirect:/helpCenter/index.do");   
      return mav;
   }
}