package com.ojt.login;

import java.util.HashMap;

public interface LoginDaoMapper {

	public String Login(String id) throws Exception;
	
	public int IDExist(String id) ;
	public String PnumberExist(String phonenumber) ;
	
	public int Register(HashMap<String, Object> req_data) throws Exception;
	
	public int ChangePw(HashMap<String, Object> req_data) throws Exception;
}
