package client.helpCenter.bean;

import lombok.Data;

@Data
public class QnaBoardDTO {
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
}
