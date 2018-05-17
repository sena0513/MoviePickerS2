package client.helpCenter.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class NoticeBoardPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML(String searchtext, String searchfield) {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			pagingHTML.append("[<a id=paging href='/mvProject/helpCenter/notice_list.do?pg="+(startPage-1)+"&searchtext="+searchtext+"&searchfield="+searchfield+"'>이전</a>]");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='/mvProject/helpCenter/notice_list.do?pg="+i+"&searchtext="+searchtext+"&searchfield="+searchfield+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='/mvProject/helpCenter/notice_list.do?pg="+i+"&searchtext="+searchtext+"&searchfield="+searchfield+"'>"+i+"</a>]");
		}
		
		if(endPage < totalP)
			pagingHTML.append("[<a id=paging href='/mvProject/helpCenter/notice_list.do?pg="+(endPage+1)+"&searchtext="+searchtext+"&searchfield="+searchfield+"'>다음</a>]");
			
	}
	
}
