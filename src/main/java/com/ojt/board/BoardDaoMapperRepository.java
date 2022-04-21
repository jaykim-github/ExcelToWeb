package com.ojt.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoMapperRepository implements BoardDaoMapper{
	@Autowired
	@Resource(name="sql")
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> SelectBoardList(HashMap<String, Object> req_data) throws Exception{
		//본사 리스트
		List<Map<String, Object>> result = sqlSession.selectList("boardpage", req_data);
		return result;
	}
	
	@Override
	public List searchList(HashMap<String, Object> req_data)throws Exception{
		List<Map<String, Object>> result = sqlSession.selectList("searchboard",req_data);
		return result;
	};
	
	
	@Override
	public List DetailBoard(int seq) throws Exception{
		//결과값 받아서 List로 넣기
		List<Map<String, Object>> result = sqlSession.selectList("selectdetail",seq);
		return result;
	};
	
	@Override
	public int Register(HashMap<String, Object> req_data)throws Exception{
		return sqlSession.insert("registerboard", req_data);
	}
	
	@Override
	public int GetSEQ() {
		//다음 SEQ 값 구하기
		int result = sqlSession.selectOne("nextSEQ");

		System.out.println(result);
		return result;
	}
	
	@Override
	public int Saveboard(HashMap<String, Object> req_data)throws Exception{
		return sqlSession.insert("save_board", req_data);
	}
	
	@Override
	public int Updateboard(HashMap<String, Object> req_data)throws Exception{
		int result = sqlSession.update("updateboard",req_data);
		return result;
	};
	
	@Override
	public int InsertHistory(HashMap<String, Object> req_data)throws Exception{
		return sqlSession.insert("inserthistory", req_data);
	};
	
	@Override
	public List DetailHistory(int seq) throws Exception{
		List<Map<String, Object>> result = sqlSession.selectList("selecthistory",seq);
		return result;
	};
	
	@Override
	public int GetHSEQ(int num) {
		//다음 SEQ 값 구하기
		int result = sqlSession.selectOne("nextHSEQ", num);

		System.out.println(result);
		return result;
	}
	
	@Override
	public int DeleteBoard(int seq) throws Exception{
		return sqlSession.update("deleteboard", seq);
	}
	
	@Override
	public int countboard(HashMap<String, Object> req_data) {
		int result = sqlSession.selectOne("countBoard", req_data);

		System.out.println(result);
		return result;
	};
	
	@Override
	public int checkIP(String ip) {
		String result = sqlSession.selectOne("checkIP", ip);
		int num = 0;
		if(ip.equals(result)) {
			num = 2;
		}
		
		return num;
	};
}
