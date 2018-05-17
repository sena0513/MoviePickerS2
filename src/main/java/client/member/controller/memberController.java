package client.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.maincategory.bean.MainCategoryDTO;
import admin.maincategory.dao.MainCategoryDAO;
import client.member.bean.MemberDTO;
import client.member.dao.MemberDAO;



@Component
@RequestMapping("/member")
public class memberController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MainCategoryDAO mainCategoryDAO; 
	/* ---------- 로 그 인 --------- */
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public @ResponseBody ModelAndView login(@RequestParam String inputIdText, 
			@RequestParam String inputPwText, 
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String id = inputIdText;
		String pw = inputPwText;
		
		
		List<MainCategoryDTO> list = mainCategoryDAO.getMovieList();
        mav.addObject("list", list);
		//DB
		MemberDTO memberDTO = memberDAO.login(id,pw);

		if(memberDTO==null) {
			mav.addObject ("display","/WEB-INF/main/loginForm.jsp");
			mav.addObject("reLogin", "reLogin");
			mav.setViewName("/WEB-INF/main/index");


		}else {
			//세션
			session.setAttribute("loginId", id);
			mav.addObject ("display","/include/body.jsp");
			mav.setViewName("/WEB-INF/main/index");
		}

		return mav;
	}

	@RequestMapping(value="/moviePointlogin.do", method=RequestMethod.POST)
	public @ResponseBody ModelAndView moviePointlogin(@RequestParam String inputIdText, 
			@RequestParam String inputPwText, @RequestParam String returnURL, @RequestParam String mv_seq,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String id = inputIdText;
		String pw = inputPwText;

		//DB
		MemberDTO memberDTO = memberDAO.login(id,pw);

		if(memberDTO==null) {
			mav.addObject ("display","/WEB-INF/main/loginForm.jsp");
			mav.addObject("reLogin", "reLogin");
			mav.addObject("returnURL", returnURL);
			mav.addObject("mv_seq", mv_seq);
			mav.setViewName("/WEB-INF/main/index");


		}else {
			//세션
			session.setAttribute("loginId", id);
			mav.setViewName("redirect:/moviePoint/moviePoint.do?mv_seq="+mv_seq);
		}

		return mav;
	}


	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session, Model model) {
		ModelAndView mav = new ModelAndView();
		
		List<MainCategoryDTO> list = mainCategoryDAO.getMovieList();
        mav.addObject("list", list);
		session.removeAttribute("loginId");
		mav.addObject ("display","/include/body.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	/* ---------- 회 원 가 입 ---------- */
	@RequestMapping(value="/registerForm.do",method=RequestMethod.GET)
	public ModelAndView registerForm() {

		ModelAndView mav = new ModelAndView();      
		mav.addObject ("display","/WEB-INF/member/registerForm.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;

	}


	/* ---------- 아이디 중복확인--------- */
	@RequestMapping(value="/idCheck.do",method=RequestMethod.POST)
	public @ResponseBody String idCheck(@RequestParam String id) {
		//DB
		MemberDTO memberDTO = memberDAO.idCheck(id);

		if(memberDTO==null)
			return "non_exist";
		else
			return "exist";   
	}

	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public ModelAndView register(@ModelAttribute MemberDTO memberDTO) {
		ModelAndView mav = new ModelAndView();

		//DB 연동
		memberDAO.register(memberDTO);

		mav.addObject ("display","/WEB-INF/main/loginForm.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;      
	}

	/* ---------------아이디찾기-------------- */
	@RequestMapping(value="/idSearchForm.do",method=RequestMethod.GET)
	public ModelAndView idSearchForm() {
		ModelAndView mav = new ModelAndView();

		String msg =(Math.random()*10000000+25807+"");
		msg = msg.substring(0, 6);

		

		mav.addObject("msg", msg);
		mav.addObject ("display","/WEB-INF/member/idSearchForm.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value="/smssend.do",method=RequestMethod.GET)
	public ModelAndView smsend(@RequestParam String action, 
			@RequestParam String msg,
			@RequestParam String rphone,
			@RequestParam String sphone1,
			@RequestParam String sphone2,
			@RequestParam String sphone3,
			@RequestParam String name,
			@RequestParam String birth) {
		ModelAndView mav = new ModelAndView();

		//문자전송
		mav.addObject("action", action);
		mav.addObject("msg", msg);
		mav.addObject("rphone", rphone);
		mav.addObject("sphone1", sphone1);
		mav.addObject("sphone2", sphone2);
		mav.addObject("sphone3", sphone3);
		mav.addObject("name", name);
		mav.addObject("birth", birth);

		mav.addObject ("display","/WEB-INF/member/smssend.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value="/idSearchResult.do",method=RequestMethod.POST)
	public ModelAndView idSearch(@RequestParam String name,@RequestParam String birth, @RequestParam String rphone) {

		ModelAndView mav = new ModelAndView();

		String birth1 = birth.substring(0, 4);
		String birth2 = birth.substring(4, 6);
		String birth3 = birth.substring(6, 8);

		String rphone1 = rphone.substring(0, 3);
		String rphone2 = rphone.substring(4, 8);
		String rphone3 = rphone.substring(9, 13);

		//디비확인
		String result = memberDAO.idSearch(name,birth1,birth2,birth3,rphone1,rphone2,rphone3);

		mav.addObject("result", result);

		mav.addObject ("display","/WEB-INF/member/idSearchResult.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	////////////////비밀번호 찾기
	@RequestMapping(value="/pwSearchForm.do",method=RequestMethod.GET)
	public ModelAndView pwSearchForm() {
		ModelAndView mav = new ModelAndView();

		mav.addObject ("display","/WEB-INF/member/pwSearchForm.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}
	@RequestMapping(value="/pwSearch_idCheck.do",method=RequestMethod.POST)
	public @ResponseBody String pwSearch_idCheck(@RequestParam String id) {
		MemberDTO memberDTO = memberDAO.idCheck(id);
		if(memberDTO == null){
			return "non_exist";
		}else {
			return "exist";
		}

	}

	@RequestMapping(value="/pwSearch_userVerifyForm.do",method=RequestMethod.GET)
	public ModelAndView pwSearch_userVerifyForm(String id) {
		ModelAndView mav = new ModelAndView();
		String msg =(Math.random()*10000000+25807+"");
		msg = msg.substring(0,6);
		

		mav.addObject("id",    id);
		mav.addObject("msg", msg);

		mav.addObject ("display","/WEB-INF/member/pwSearch_userVerifyForm.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value="/pw_smsSend.do",method=RequestMethod.POST)
	public ModelAndView pw_smsSend(@RequestParam String action, 
			@RequestParam String msg,
			@RequestParam String rphone,
			@RequestParam String sphone1,
			@RequestParam String sphone2,
			@RequestParam String sphone3,
			@RequestParam String name,
			@RequestParam String birth,
			@RequestParam String id) {
		ModelAndView mav = new ModelAndView();

		//문자전송
		mav.addObject("action", action);
		mav.addObject("msg", msg);
		mav.addObject("rphone", rphone);
		mav.addObject("sphone1", sphone1);
		mav.addObject("sphone2", sphone2);
		mav.addObject("sphone3", sphone3);
		mav.addObject("name", name);
		mav.addObject("birth", birth);
		mav.addObject("id", id);

		mav.addObject ("display","/WEB-INF/member/pw_smsSend.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value="/pwSearchResult.do",method=RequestMethod.POST)
	public ModelAndView pwChangeForm(@RequestParam String id) {
		ModelAndView mav = new ModelAndView();


		mav.addObject("id", id);
		mav.addObject ("display","/WEB-INF/member/pwChangeForm.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;

	}

	@RequestMapping(value="/pwChangeResult.do",method=RequestMethod.POST)
	public ModelAndView pwChangeResult(@RequestParam String id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String pw = request.getParameter("pw");      
		//DB
		memberDAO.UpdatePw(id, pw);

		mav.addObject ("display","/WEB-INF/member/pwChangeResult.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;

	}
}