package admin.report.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import admin.report.bean.AdminReviewReportDTO;
@Transactional
@Component
public class AdminReivewReportMybatis implements AdminReviewReportDAO{
	@Autowired
	   private SqlSession sqlSession;
	@Override
	public List<AdminReviewReportDTO> reviewList(int startNum, int endNum) {
		Map<String,String> map = new HashMap<String, String>();
	      map.put("startNum", Integer.toString(startNum));
	      map.put("endNum", Integer.toString(endNum));
		return sqlSession.selectList("AdminReviewReportSQL.reviewreportList", map);
	}

	@Override
	public void updatereview(int rev_seq) {
		sqlSession.update("AdminReviewReportSQL.updatereview",rev_seq);
	}

	@Override
	public void deletereview(int rev_seq) {
		sqlSession.delete("AdminReviewReportSQL.deletereview",rev_seq);
	}

	@Override
	public int getreviewTotalA() {
	      return sqlSession.selectOne("AdminReviewReportSQL.getreviewTotalA");
	}

}
