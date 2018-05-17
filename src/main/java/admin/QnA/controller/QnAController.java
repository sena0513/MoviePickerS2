package admin.QnA.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.QnA.bean.AdminQnaBoardPaging;
import admin.QnA.bean.AdminQnaBoardDTO;
import admin.QnA.dao.AdminQnaBoardDAO;

@Component
@Controller
public class QnAController {
	@Autowired
	private AdminQnaBoardDAO qservice;

	@Autowired
	private AdminQnaBoardPaging qnaPaging;
	
	@RequestMapping(value = "/adminQnA/qnaregitform.do")
	public ModelAndView qnaregitform()  {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/adminQnA/qnaregitform");
		return mav;
	}
	
	@RequestMapping(value = "/adminQnA/qnaregit.do", method=RequestMethod.POST)
	public ModelAndView movieregit(@RequestParam Map<String,String> map)  {
		ModelAndView mav = new ModelAndView(); 
		qservice.Insertqna(map);
		mav.setViewName("redirect:qnalistform.do");
		return mav;
	}
	@RequestMapping(value="/adminQnA/qnalistform.do", method=RequestMethod.GET)
	public String boardList(@RequestParam(required=false) String pg, Model model,String searchtext) {   // 데이터 값이 안 들어올 경우도 있기 때문에 required=false로 설정해야함
		if(pg==null) pg="1"; // pg = 현재 페이지
		if(searchtext==null) searchtext = "";
		
		int endNum = Integer.parseInt(pg)*10; // 한 폐이지당 5개 뿌리고 싶을 때
		int startNum = endNum-9;
		// DB 
		// 1폐이지당 글 5개
		List<AdminQnaBoardDTO> list = qservice.getQnaBoardList(startNum, endNum,searchtext);
		
		// 페이징 처리
		int totalA = qservice.getQnaTotalA(searchtext); // 총 글수
		qnaPaging.setCurrentPage(Integer.parseInt(pg));
		qnaPaging.setPageBlock(3);
		qnaPaging.setPageSize(5);
		qnaPaging.setTotalA(totalA);
		qnaPaging.makePagingHTML(searchtext);

		// 응답
		model.addAttribute("pg", pg);
		model.addAttribute("list", list);
		model.addAttribute("qnaPaging", qnaPaging);
		return "/WEB-INF/adminQnA/qnalist";
	}
	@RequestMapping(value = "/adminQnA/qnainfoform.do")
	public ModelAndView qnaintoform(@RequestParam int seq,@RequestParam(required=false) String pg){
		ModelAndView mav = new ModelAndView();
		AdminQnaBoardDTO list = qservice.QnaBoardView(seq);
		mav.addObject("pg",pg);
		mav.addObject("list",list);
		mav.setViewName("/WEB-INF/adminQnA/qnainfoform");
		return mav;
	}
	@RequestMapping(value = "/adminQnA/modifyqna.do", method=RequestMethod.POST)
	public ModelAndView modifyqna(@RequestParam Map<String,String> map,@RequestParam(required=false) String pg)  {
		ModelAndView mav = new ModelAndView(); 
		qservice.Modifyqna(map);
		mav.addObject("pg",pg);
		mav.setViewName("redirect:qnalistform.do");
		return mav;
	}
	@RequestMapping(value = "/adminQnA/deleteqna.do", method=RequestMethod.GET)
	public ModelAndView deletenoitce(@RequestParam int seq,@RequestParam(required=false) String pg)  {
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("pg",pg);
		qservice.Deleteqna(seq);
		mav.setViewName("redirect:qnalistform.do");
		return mav;
	}
}
