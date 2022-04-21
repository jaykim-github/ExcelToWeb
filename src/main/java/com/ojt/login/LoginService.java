package com.ojt.login;

import java.util.HashMap;

public interface LoginService {
	public int IdExist(String id)  throws Exception;
	
	public String PExist(String phonenumber)  throws Exception;
	
	public int Login(String id, String password)  throws Exception;
	
	public int Register(HashMap<String, Object> req_data)throws Exception;
	
	public int ChangePW(HashMap<String, Object> req_data)throws Exception;
}
