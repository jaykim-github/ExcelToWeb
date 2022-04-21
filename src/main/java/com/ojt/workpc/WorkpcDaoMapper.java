package com.ojt.workpc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface WorkpcDaoMapper {
	public List<Map<String, Object>> SelectBoardList(HashMap<String, Object> req_data) throws Exception;

	public int countboard(HashMap<String, Object> req_data);
	
	public List searchList(HashMap<String, Object> req_data)throws Exception;
	
	public int Register(HashMap<String, Object> req_data)throws Exception;
	public int GetSEQ();
	public List DetailHistory(int seq) throws Exception;
	public List DetailBoard(int seq) throws Exception;
	public int DeleteBoard(int seq) throws Exception;
	public int Updateboard(HashMap<String, Object> req_data)throws Exception;
	public int InsertHistory(HashMap<String, Object> req_data)throws Exception;
	public int GetHSEQ(int num);
	public int checkIP(String ip);
}
