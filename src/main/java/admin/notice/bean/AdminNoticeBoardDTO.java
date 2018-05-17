package admin.notice.bean;

import lombok.Data;

@Data
public class AdminNoticeBoardDTO {
	private int seq;
	private String title;
	private String contents;
	private String logtime;
	private int viewcount;
	private int prev_seq;
	private String prev_title;
	private String prev_logtime;
	private int next_seq;
	private String next_title;	
	private String next_logtime;
	private String searchtext;
	private String searchfield;
	
}
