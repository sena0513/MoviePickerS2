package client.review.bean;

import lombok.Data;

@Data
public class ReviewDTO {
	private int rev_seq;
	private int mv_seq;
	private String movienameforkr;
	private String reviewcontents;
	private int reviewpoint;
	private int reviewgood;
	private String id;
	private String reviewdate;
	private int reportnumber;
	private int charmdirector;
	private int charmstory;
	private int charmvisual;
	private int charmactor;
	private int charmost;
}
