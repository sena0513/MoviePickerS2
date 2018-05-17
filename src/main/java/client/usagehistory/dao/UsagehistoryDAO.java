package client.usagehistory.dao;

import java.util.List;
import java.util.Map;

import client.usagehistory.bean.UsagehistoryDTO;

public interface UsagehistoryDAO {
	public List<UsagehistoryDTO> getusedpointhistory(Map<String,String> map);
	public List<UsagehistoryDTO> getusedcouponhistory(Map<String,String> map);
	public List<UsagehistoryDTO> getmoviehistory(Map<String,String> map);
}
