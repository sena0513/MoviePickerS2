package client.usagehistory.bean;

import java.util.Date;

import lombok.Data;

@Data
public class UsagehistoryDTO {
	private int seq;
	private String id;
	private String pointUsed;
	private String pointUsedDate;
	private String couponUsed;
	private String couponUsedDate;
	private String movieName;
	private String ticketmoviecode;
	private String ticketmovieRegion;
	private String ticketmovieBranch;
	private String ticketmovieScreen;
	private String ticketmovieDate;
}
