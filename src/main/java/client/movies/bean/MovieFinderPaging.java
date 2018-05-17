package client.movies.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MovieFinderPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;

	public void makePagingHTML(int startNum, int endNum, String searchtext, String searchfield, String genre, String nation, String ageLimit, String year_start, String year_end) {
		pagingHTML = new StringBuffer();

		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;

		if(startPage > pageBlock)
			pagingHTML.append("[<a id=paging href='/mvProject/movieFinder/movieFinderResult.do?pg="+(startPage-1)+"&searchtext="+searchtext+"&searchfield="+searchfield+"&genre="+genre+"&nation="+nation+"&ageLimit="+ageLimit+"&year_start"+year_start+"&year_end"+year_end+"'>이전</a>]");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='/mvProject/movieFinder/movieFinderResult.do?pg="+i+"&searchtext="+searchtext+"&searchfield="+searchfield+"&genre="+genre+"&nation="+nation+"&ageLimit="+ageLimit+"&year_start"+year_start+"&year_end"+year_end+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='/mvProject/movieFinder/movieFinderResult.do?pg="+i+"&searchtext="+searchtext+"&searchfield="+searchfield+"&genre="+genre+"&nation="+nation+"&ageLimit="+ageLimit+"&year_start"+year_start+"&year_end"+year_end+"'>"+i+"</a>]");
		}
		
		if(endPage < totalP)
			pagingHTML.append("[<a id=paging href='/mvProject/movieFinder/movieFinderResult.do?pg="+(endPage+1)+"&searchtext="+searchtext+"&searchfield="+searchfield+"&genre="+genre+"&nation="+nation+"&ageLimit="+ageLimit+"&year_start"+year_start+"&year_end"+year_end+"'>다음</a>]");
		
	}

}