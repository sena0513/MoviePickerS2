package admin.timeschedule.bean;

import lombok.Data;

@Data
public class AdminTimeScheduleDTO {
	private int seq;
	private String playingMovie;
	private String theaterBranch;
	private String theaterScreen;
	private String theaterMovieGrade;
	private String theaterDate;
	private String theaterTime;
	private String theaterRegion;
}
