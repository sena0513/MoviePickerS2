package client.usagehistory.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.usagehistory.bean.UsagehistoryDTO;

@Component
@Transactional
public class UsageHistoryDAOMybatis implements UsagehistoryDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UsagehistoryDTO> getusedpointhistory(Map<String,String> map) {
		System.out.println(map.get("startdate")+"나오냐"+map.get("enddate"));
		return sqlSession.selectList("usageSQL.pointhistory",map);
	}

	@Override
	public List<UsagehistoryDTO> getusedcouponhistory(Map<String,String> map) {
		return sqlSession.selectList("usageSQL.couponhistory", map);
	}

	@Override
	   public List<UsagehistoryDTO> getmoviehistory(Map<String,String> map) {
	      return sqlSession.selectList("usageSQL.getmoviehistory",map);
	   }

}
