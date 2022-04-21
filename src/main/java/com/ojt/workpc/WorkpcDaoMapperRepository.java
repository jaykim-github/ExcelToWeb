package com.ojt.workpc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkpcDaoMapperRepository implements WorkpcDaoMapper {

	@Autowired
	@Resource(name="sql")
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> SelectBoardList(HashMap<String, Object> req_data) throws Exception{
		//본사 리스트
		List<Map<String, Object>> result = sqlSession.selectList("workpcboardpage", req_data);
		return result;
	}
	
	@Override
	public int countboard(HashMap<String, Object> req_data){
		int result = sqlSession.selectOne("countpcBoard", req_data);

		System.out.println(result);
		return result;
	};
	
	@Override
	public List searchList(HashMap<String, Object> req_data)throws Exception{
		List<Map<String, Object>> result = sqlSession.selectList("searchboard2",req_data);
		return result;
	};
	
	@Override
	public int Register(HashMap<String, Object> req_data)throws Exception{
		return sqlSession.insert("registerpcboard", req_data);
	}
	
	@Override
	public int GetSEQ() {
		//다음 SEQ 값 구하기
		int result = sqlSession.selectOne("nextSEQ2");

		System.out.println(result);
		return result;
	}
	
	@Override
	public List DetailBoard(int seq) throws Exception{
		//결과값 받아서 List로 넣기
		List<Map<String, Object>> result = sqlSession.selectList("selectpcdetail",seq);
		return result;
	};
	
	@Override
	public List DetailHistory(int seq) throws Exception{
		List<Map<String, Object>> result = sqlSession.selectList("selectpchistory",seq);
		return result;
	};
	
	@Override
	public int DeleteBoard(int seq) throws Exception{
		return sqlSession.update("deletepcboard", seq);
	}
	
	@Override
	public int Updateboard(HashMap<String, Object> req_data)throws Exception{
		int result = sqlSession.update("updatepcboard",req_data);
		return result;
	};
	
	@Override
	public int InsertHistory(HashMap<String, Object> req_data)throws Exception{
		return sqlSession.insert("insertpchistory", req_data);
	};
	
	@Override
	public int GetHSEQ(int num) {
		//다음 SEQ 값 구하기
		int result = sqlSession.selectOne("nextHSEQ2", num);

		System.out.println(result);
		return result;
	}
}
