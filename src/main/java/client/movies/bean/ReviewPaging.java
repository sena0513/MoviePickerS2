package client.movies.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReviewPaging {
	private String mv_seq;
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private int totalP;// 총 페이지 수 
	private int startPage;
	private int endPage;
	   
	   



			   
}
