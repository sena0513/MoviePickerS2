package admin.report.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.report.bean.AdminQnaDTO;
import admin.report.bean.AdminReviewReportDTO;
import admin.report.bean.adminreviewPaging;
import admin.report.bean.reportPaging;
import admin.report.dao.AdminQnaDAO;
import admin.report.dao.AdminReviewReportDAO;

@Component
@Controller
public class ReportController {
   @Autowired
   private AdminQnaDAO qnaDAO;
   @Autowired
   private reportPaging reportPaging;
   @Autowired
   private AdminReviewReportDAO reviewDAO;
   @Autowired
   private adminreviewPaging reviewPaging;
   

   /*------------------- 일대일 문의 내역 -------------------*/
   @RequestMapping(value="/adminreport/reportlistform.do", method=RequestMethod.GET )
   public ModelAndView myInquiryQnAList(@RequestParam(required=false) String pg, @RequestParam(required=false) String searchtext) {
      ModelAndView mav = new ModelAndView();

      if(pg==null) pg="1";
      if(searchtext==null) searchtext = "";

      // 1페이지당 5개씩
      int endNum = Integer.parseInt(pg)*5;
      int startNum = endNum-4;

      //DB
      List<AdminQnaDTO> QnaList = qnaDAO.QnaList(startNum, endNum, searchtext);

      // 페이징 처리
      int QnaTotalA = qnaDAO.getQnaTotalA(searchtext);
      reportPaging.setCurrentPage(Integer.parseInt(pg));
      reportPaging.setPageBlock(3);
      reportPaging.setPageSize(5);
      reportPaging.setTotalA(QnaTotalA);
      reportPaging.makePagingHTML(searchtext);

      mav.addObject("pg", pg);
      mav.addObject("QnaTotalA", QnaTotalA);
      mav.addObject("reportPaging", reportPaging);
      mav.addObject("QnaList", QnaList);
      mav.setViewName("/WEB-INF/adminreport/reportlist");      
      return mav;
   }

   @RequestMapping(value="/adminreport/myInquiryQnAView.do", method=RequestMethod.GET )
   public ModelAndView myInquiryQnAView(@RequestParam(required=false) String seq,
         @RequestParam(required=false) String pg, @RequestParam(required=false) String searchtext) {
      ModelAndView mav = new ModelAndView();

      //DB
      
      AdminQnaDTO qnaDTO = qnaDAO.QnaView(Integer.parseInt(seq));

      mav.addObject("pg", pg);
      mav.addObject("qnaDTO", qnaDTO);
      mav.setViewName("/WEB-INF/adminreport/qnareportform");      
      return mav;
   }
   @RequestMapping(value="/adminreport/reportregit.do", method=RequestMethod.GET )
   public ModelAndView reportregit(@RequestParam Map<String,String> map) {
      ModelAndView mav = new ModelAndView();

      qnaDAO.updateqna(map);

      mav.addObject("pg", map.get("pg"));
      mav.setViewName("redirect:reportlistform.do");      
      return mav;
   }
	  @RequestMapping(value="/adminreport/reportreviewlistform.do", method=RequestMethod.GET )
	  public ModelAndView reportreviewlistform(@RequestParam(required=false) String pg) {
      ModelAndView mav = new ModelAndView();

      if(pg==null) pg="1";

      // 1페이지당 5개씩
      int endNum = Integer.parseInt(pg)*10;
      int startNum = endNum-9;

      //DB
      List<AdminReviewReportDTO> reviewList = reviewDAO.reviewList(startNum, endNum);
      // 페이징 처리
      int reviewTotalA = reviewDAO.getreviewTotalA();
      reviewPaging.setCurrentPage(Integer.parseInt(pg));
      reviewPaging.setPageBlock(3);
      reviewPaging.setPageSize(5);
      reviewPaging.setTotalA(reviewTotalA);
      reviewPaging.makePagingHTML();

      mav.addObject("pg", pg);
      mav.addObject("reviewTotalA", reviewTotalA);
      mav.addObject("reviewPaging", reviewPaging);
      mav.addObject("reviewList", reviewList);
      mav.setViewName("/WEB-INF/adminreport/reportreviewlist");      
      return mav;
   }
	  @RequestMapping(value="/adminreport/updatereview.do", method=RequestMethod.GET )
	   public ModelAndView updatereview(@RequestParam(required=false) int rev_seq) {
	      ModelAndView mav = new ModelAndView();
	      reviewDAO.updatereview(rev_seq);
	      mav.setViewName("redirect:/adminreport/reportreviewlistform.do");      
	      return mav;
	   }
	  @RequestMapping(value="/adminreport/deletereview.do", method=RequestMethod.GET )
	   public ModelAndView deletereview(@RequestParam(required=false) int rev_seq) {
	      ModelAndView mav = new ModelAndView();
	      reviewDAO.deletereview(rev_seq);
	      mav.setViewName("redirect:/moviePoint/myreview.do");      
	      return mav;
	   }
}