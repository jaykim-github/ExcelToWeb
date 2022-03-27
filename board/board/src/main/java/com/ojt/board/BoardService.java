package com.ojt.board;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	public List SelectBoardList(String location,int page) throws Exception;
	
	public List searchList(String searchid, String searchtxt)throws Exception;
	
	public int Register(HashMap<String, Object> req_data)throws Exception;
	
	public List DetailBoard(int seq) throws Exception;
	
	public int GetSEQ();
	
	public int Saveboard(HashMap<String, Object> req_data)throws Exception;
	
	public int Updateboard(HashMap<String, Object> req_data)throws Exception;
	
	public List DetailHistory(int seq) throws Exception;
	public int DeleteBoard(int seq) throws Exception;

}
