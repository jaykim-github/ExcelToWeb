package com.ojt.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDaoMapper loginDaoMapper;
	

	public int IdExist(String id)  throws Exception{
		int num = loginDaoMapper.IDExist(id);
		
		return num;
	}

	public String PExist(String phonenumber)  throws Exception{
		String number = loginDaoMapper.PnumberExist(phonenumber);

		return number;
	}
	

	public int Login(String id, String password)  throws Exception{
		
		int num = loginDaoMapper.IDExist(id);
		String result = loginDaoMapper.Login(id);
		
		if(num == 1) {

			if(password.equals(result)) {
				//로그인 성공하면 1리턴
				return num;
			}else {
				//비밀번호 다름
				num = -1;
			}
		}

		return num;
	}
	
	public int Register(HashMap<String, Object> req_data)throws Exception{
		int result = loginDaoMapper.Register(req_data);
		
		return result;
	}
	

	@Override
	public int ChangePW(HashMap<String, Object> req_data) throws Exception {
		// TODO Auto-generated method stub
		int result = loginDaoMapper.ChangePw(req_data);
		return result;
	}


}
