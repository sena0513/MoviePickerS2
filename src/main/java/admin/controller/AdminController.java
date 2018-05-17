package admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.AdminMemberDTO;
import admin.bean.AdminMoviePaging;
import admin.dao.AdminMemberDAO;
import admin.movie.dao.MovieplatformDAO;
import client.movies.bean.MovieplatformDTO;

@Component
@Controller
public class AdminController {
	@Autowired
	private AdminMemberDAO service;
	
	@Autowired
	private AdminMoviePaging moviePaging;
	
	@Autowired
	private MovieplatformDAO mservice;
	
	@RequestMapping(value="/adminmember/index.do", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/adminmember/adminindex");
		return mav;
	}
	
	@RequestMapping(value="/adminmember/login.do", method=RequestMethod.POST)
	public ModelAndView tologin(@RequestParam Map<String,String> map ,HttpSession session)  {
		ModelAndView mav = new ModelAndView(); 
		String adminid = map.get("adminid");
	      String adminpw = map.get("adminpw");
	      if(adminid==null) {
	         adminid="";
	         map.put("adminid", adminid);
	      }else if(adminpw==null) {
	         map.put("adminpw", adminpw);
	      }
	      List<AdminMemberDTO> memberDTO = service.adminlogin(map);
	      
	      mav.addObject("result",memberDTO);
	      mav.setViewName("/WEB-INF/adminmember/adminindex");
	      return mav;
	}
	
	@RequestMapping(value = "/adminmember/movieregitform.do")
	public ModelAndView movieregit()  {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/adminmember/movieregit");
		return mav;
	}
	
	@RequestMapping(value = "/adminmember/movieregit.do", method=RequestMethod.POST)
	public ModelAndView movieregit(@RequestParam Map<String,String> map)  {
		ModelAndView mav = new ModelAndView(); 
		mservice.InsertMovie(map);
		mservice.InsertMoviePoint(map);
		mav.setViewName("redirect:adminmovieList.do");
		return mav;
	}
	@RequestMapping(value="/adminmember/adminmovieList.do", method=RequestMethod.GET)
	public String boardList(@RequestParam(required=false) String pg, Model model) {   // 데이터 값이 안 들어올 경우도 있기 때문에 required=false로 설정해야함
		if(pg==null) pg="1"; // pg = 현재 페이지

		/*
	      select * from
	      (select rownum rn, tt.* from
	      (select * from BOARD order by ref desc, step asc)tt
	      )where rn>=1 and rn<=5; 

	      ex)
	              startNum  endNum
	      pg=1   rn>=1 and rn<=5
	      pg=2   rn>=6 and rn<=10
	      pg=3   rn>=11 and rn<=15

		 */
		int endNum = Integer.parseInt(pg)*5; // 한 폐이지당 5개 뿌리고 싶을 때
		int startNum = endNum-4;

		// DB 
		// 1폐이지당 글 5개
		List<MovieplatformDTO> list = mservice.getMovieList(startNum, endNum);
		
		// 페이징 처리
		int totalA = mservice.getTotalA(); // 총 글수
		moviePaging.setCurrentPage(Integer.parseInt(pg));
		moviePaging.setPageBlock(3);
		moviePaging.setPageSize(5);
		moviePaging.setTotalA(totalA);
		moviePaging.makePagingHTML();

		// 응답
		model.addAttribute("pg", pg);
		model.addAttribute("list", list);
		model.addAttribute("moviePaging", moviePaging);
		return "/WEB-INF/adminmember/movieList";
	}
	
	@RequestMapping("/adminmember/fixmovie.do")
	public ModelAndView fixtomovie(@RequestParam Map<String,String> map,@RequestParam String seq,
									HttpServletRequest request,@RequestParam(required=false) String pg)  {
		ModelAndView mav = new ModelAndView(); 
		map.put("seq", seq);
		mservice.fixdata(map);
		mav.addObject("pg",pg);
		mav.setViewName("redirect:adminmovieList.do");
		return mav;
	}
	@RequestMapping("/adminmember/modifymovieform.do")
	public ModelAndView modifymovie(@RequestParam String seq,@RequestParam(required=false) String pg)  {
		ModelAndView mav = new ModelAndView(); 
		MovieplatformDTO movieplatformDTO = mservice.modifymovieform(seq);
		mav.addObject("pg",pg);
		mav.addObject("list",movieplatformDTO);
		mav.setViewName("/WEB-INF/adminmember/modifymovieform");
		return mav;
	}
	@RequestMapping("/adminmember/modifymovie.do")
	public ModelAndView modifymovie(@RequestParam Map<String,String> map,@RequestParam(required=false) String pg)  {
		ModelAndView mav = new ModelAndView();
		mservice.modifymovie(map);
		mav.addObject("pg",pg);
		mav.setViewName("redirect:adminmovieList.do");
		return mav;
	}
	@RequestMapping("/adminmember/deletemovie.do")
	public ModelAndView deletemovie(@RequestParam String number,@RequestParam(required=false) String pg)  {
		ModelAndView mav = new ModelAndView();
		mservice.deletemovie(number);
		mav.setViewName("redirect:adminmovieList.do");
		return mav;
	}
//	@RequestMapping("/adminmember/itemregitform.do")
//	public ModelAndView toitemregitform(HttpServletRequest request ,HttpSession session)  {
//		ModelAndView mav = new ModelAndView(); 
//		List<CategoryDTO> result = cservice.getalldata();
//		mav.addObject("result",result);
//		mav.setViewName("Itemregit");
//		return mav;
//	}
//	@RequestMapping("/adminmember/Categorylist.do")
//	public ModelAndView toCategoryList(HttpServletRequest request ,HttpSession session)  {
//		ModelAndView mav = new ModelAndView(); 
//		List<CategoryDTO> result = cservice.getalldata();
//		mav.addObject("result",result);
//		mav.setViewName("Categorylist");
//		// mav.addObject("result",result); -> request.setAttribute("result",result);
//		return mav;
//	}
//	@RequestMapping("/adminmember/Itemregit.do")
//	public ModelAndView toregitItem(HttpServletRequest request)  {
//		ModelAndView mav = new ModelAndView(); 
//		List<CategoryDTO> result = cservice.getalldata();
//		mav.addObject("result",result);
//		mav.setViewName("Itemregit");
//		// mav.addObject("result",result); -> request.setAttribute("result",result);
//		return mav;
//	}
//	@RequestMapping("/adminmember/Itemlist.do")
//	public ModelAndView toItemList(HttpServletRequest request)  {
//		ModelAndView mav = new ModelAndView(); 
//		List<ProductDTO> result = pservice.getalldata();
//		mav.addObject("result",result);
//		mav.setViewName("Itemlist");
//		// mav.addObject("result",result); -> request.setAttribute("result",result);
//		return mav;
//	}
//	@RequestMapping("/adminmember/insertItem.do")
//	public ModelAndView toInsertItem(HttpServletRequest request,HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//
//		String product_code = request.getParameter("product_code");
//		String category = request.getParameter("category_name");
//		String product_name = request.getParameter("product_name");
//		String brand_name = request.getParameter("brand_name");
//		int product_price = Integer.parseInt(request.getParameter("product_price"));
//		int product_stock = Integer.parseInt(request.getParameter("product_stock"));
//
//		pservice.InsertProduct(product_code, category, product_name, brand_name, product_price, product_stock);
//		mav.setViewName("redirect:Itemlist.do");
//
//		return mav;
//	}
//	@RequestMapping("/adminmember/Itemfix.do")
//	public ModelAndView toItemfix(HttpServletRequest request)  {
//		ModelAndView mav = new ModelAndView();
//		int number = Integer.parseInt(request.getParameter("number"));
//		List<ProductDTO> result = pservice.selectdata(number);
//		List<CategoryDTO> cresult = cservice.getalldata();
//		mav.addObject("cresult",cresult);
//		mav.addObject("result",result);
//		mav.addObject("product_num",number);
//		mav.setViewName("Itemfixintro");
//		// mav.addObject("result",result); -> request.setAttribute("result",result);
//		return mav;
//	}
//	@RequestMapping("/adminmember/fixItem.do")
//	public ModelAndView tofixItem(HttpServletRequest request)  {
//		ModelAndView mav = new ModelAndView();
//		int product_num = Integer.parseInt(request.getParameter("product_num"));
//		System.out.println(product_num);
//		String product_code = request.getParameter("product_code");
//		String category = request.getParameter("category");
//		String product_name = request.getParameter("product_name");
//		String brand_name = request.getParameter("brand_name");
//		int product_price = Integer.parseInt(request.getParameter("product_price"));
//		int product_stock = Integer.parseInt(request.getParameter("product_stock"));
//		pservice.FixProduct(product_num, product_code, category, product_name, brand_name, product_price, product_stock);
//		mav.setViewName("redirect:Itemlist.do");
//
//		return mav;
//	}
//	@RequestMapping("/adminmember/deletecategory.do")
//	public ModelAndView toDeletecategory(HttpServletRequest request)  {
//		ModelAndView mav = new ModelAndView(); 
//		int number = Integer.parseInt(request.getParameter("number"));
//		cservice.Deleteincategory(number);
//		mav.setViewName("redirect:Categorylist.do");
//		return mav;
//	}
//	@RequestMapping("/adminmember/deleteproduct.do")
//	public ModelAndView toDeleteitem(HttpServletRequest request)  {
//		ModelAndView mav = new ModelAndView(); 
//		int number = Integer.parseInt(request.getParameter("number"));
//		pservice.DeleteProduct(number);
//		mav.setViewName("redirect:Itemlist.do");
//		return mav;
//	}
}
	// --------------------------------------------�쐞 �뼱�뱶誘� 諛� �겢�씪 -----------------------------------------------
	/*@Autowired
	private MemberService mservice;

	@RequestMapping("main.do")
	public ModelAndView tomain() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		mav.setViewName("Main");
		return mav;
	}
	@RequestMapping("Memberlogin.do")
	public ModelAndView toLogin() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		mav.setViewName("Client_Login");
		return mav;
	}

	@RequestMapping("loginProc.do")
	public ModelAndView toLoginProc(HttpSession session, MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		int result = mservice.isLoginOk(dto.getId(), dto.getPw());
		if(result>0) {
			session.setAttribute("loginId", dto.getId());
		}
		mav.setViewName("main.do");
		mav.addObject("loginId", dto.getId());
		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping("logout.do")
	public ModelAndView toLogout(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		session.invalidate();
		mav.setViewName("main.do");
		return mav;
	}

	@RequestMapping("MemberRegister.do")
	public ModelAndView toMemberRegister() {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		mav.setViewName("Client_Register");
		return mav;
	}
	@RequestMapping("MemberRegisterProc.do")
	public ModelAndView toMemberRegisterProc(HttpSession session, MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		String name = dto.getId();
		mservice.insertNewData(dto);
		mav.setViewName("main.do");
		return mav;
	}
	@RequestMapping("myPage.do")
	public ModelAndView toMyPage() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		mav.setViewName("Client_MyPage");
		return mav;
	}
	@RequestMapping("MemberDelete.do")
	public ModelAndView toMemberDelete(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		String loginId = (String) session.getAttribute("loginId");
		mservice.deleteData(loginId);
		session.invalidate();
		mav.setViewName("main.do");
		return mav;
	}
	@RequestMapping("MemberModify.do")
	public ModelAndView toMemberModify(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		List<MemberDTO> result = mservice.selectData(loginId);
		mav.addObject("result", result);
		mav.setViewName("Client_Modify");
		return mav;
	}

	@RequestMapping("MemberModifyProc.do")
	public ModelAndView toMemberModifyProc(HttpSession session, MemberDTO dto){
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		mservice.UpdateData(dto, loginId);
		mav.setViewName("Client_MyPage");
		return mav;
	}

	// ------------------------------ 클라이언트 보여주기 -----------------------------------

	@RequestMapping("productList.do")
	public ModelAndView toCategorySelect(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		String category_name = request.getParameter("category_name");
		List<ProductDTO> result = pservice.selectCategorydata(category_name);
		mav.addObject("result", result);
		mav.setViewName("Client_Category");
		return mav;
	}
	
	@RequestMapping("productDetail.do")
	public ModelAndView toProductDetail(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> cresult = cservice.getalldata();
		mav.addObject("cresult",cresult);
		String product_code = request.getParameter("product_code");
		List<ProductDTO> result = pservice.selectProductdata(product_code);
		mav.addObject("result", result);
		mav.setViewName("Product_detail");
		return mav;
	}
}*/
