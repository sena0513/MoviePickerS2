package admin.report.dao;

import java.util.List;
import java.util.Map;

import admin.report.bean.AdminReviewReportDTO;

public interface AdminReviewReportDAO {
	public List<AdminReviewReportDTO> reviewList(int startNum, int endNum);
    public void updatereview(int rev_seq);
    public  void deletereview(int rev_seq);
    public int getreviewTotalA();
}
