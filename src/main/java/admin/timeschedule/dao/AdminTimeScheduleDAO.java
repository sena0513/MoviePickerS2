package admin.timeschedule.dao;

import java.util.List;
import java.util.Map;

import admin.timeschedule.bean.AdminTimeScheduleDTO;

public interface AdminTimeScheduleDAO {
	public void inserttimeschedulemovie(Map<String,String> map);
	public List<AdminTimeScheduleDTO> getalldate();
	public void modifytimeschedulemovie(Map<String,String> map);
	public void deletetimeschedulemovie(Map<String,String> map);
}
