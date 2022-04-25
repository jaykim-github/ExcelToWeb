package com.ojt.board;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDaoMapper BoardDaoMapper;
	
	public List SelectBoardList(String location ,int page) throws Exception{
		if(location.equals("location1")) {
			location = "본사";
			System.out.println("본사 리스트");
		}else if(location.equals("본사")) {
			System.out.println("본사 리스트");
		}else{
			System.out.println("석포 리스트");
			location = "석포";
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("location",location);
		
		
		int limit = 10;
		int listcount = BoardDaoMapper.countboard(map);
		
		int maxpage = (listcount + limit -1) / limit;
		
		int startpage = ((page -1)/10)*10+1;
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		

		List<Map<String, Object>> result = BoardDaoMapper.SelectBoardList(map);
		map.put("endpage",endpage);
		map.put("startpage",startpage);
		result.add(map);
		
		return result;
	}
	
	public List pingList() throws Exception{
		
		List<Map<String, Object>> result = new ArrayList();
		String ipList[] = {"211.35.173.43","211.35.173.45","211.35.173.22","211.35.173.7","211.35.173.24","211.35.173.25","211.35.173.21",
		                     "121.134.200.227","121.134.200.226","211.35.173.12","211.35.173.6","211.35.173.33","211.35.173.11","211.35.173.18"};
		String ipName[] = {"SAP ERP ECC 운영(YP-PRD)","SAP ERP CA 운영(CAPCI)","조업경영정보 시스템(YPZBBI)","웹포털 운영(ypwebportal)","펌뱅킹 서버(FIRM BANK)","ESS 연말정산 서버(YETA)",
							"홈페이지 서버(homepage)", "스팸 아웃(SpamOut)","그룹웨어 운영서버(YPZBGWPRD)","그룹웨어 DB서버(YPZBGWDB)", "전산팀 파일공유 서버","백업 DISK 장비",
							"안전보건환경 시스템(YPSHE)","PDA 중계 서버"};
		
		for(int i = 0; i<ipList.length; i++) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("seq", i+1);
			map.put("servername", ipName[i]);
			map.put("ipname", ipList[i]);
			map.put("status",InetAddress.getByName(ipList[i]).isReachable(1000));
			result.add(map);
		}
		
		//System.out.println(result);
		
		return result;
	}
	
	public List searchList(String searchid, String searchtxt, String location, int page)throws Exception{
		System.out.println("검색");
		if(location.equals("location1")) {
			location = "본사";
			System.out.println("본사 리스트");
		}else if(location.equals("본사")) {
			System.out.println("본사 리스트");
		}else{
			System.out.println("석포 리스트");
			location = "석포";
		}
		
		int limit = 10;
		HashMap<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("location",location);
		
		if(searchid.equals("PRIVATE_IP")) {
			map.put("PRIVATE_IP", searchtxt);
		}else if(searchid.equals("SERVER_NAME")) {
			map.put("SERVER_NAME", searchtxt);
		}else if(searchid.equals("MANAGER")) {
			map.put("MANAGER", searchtxt);
		}
		
		int listcount = BoardDaoMapper.countboard(map);
		
		int maxpage = (listcount + limit -1) / limit;
		
		int startpage = ((page -1)/10)*10+1;
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
				
		System.out.println(map);
		
		List<Map<String, Object>> result = BoardDaoMapper.searchList(map);
		map.put("endpage",endpage);
		map.put("startpage",startpage);
		
		System.out.println(result);
		result.add(map);
		return result;
	};
	
	public List DetailBoard(int seq) throws Exception{
		System.out.println("상세페이지");

		List<Map<String, Object>> result = BoardDaoMapper.DetailBoard(seq);
		return result;
	};

	public int Saveboard(HashMap<String, Object> req_data)throws Exception{
		int result = BoardDaoMapper.Saveboard(req_data);
		
		return result;
	};
	
	public int Register(HashMap<String, Object> req_data)throws Exception{
		System.out.println("저장");
		
		int seq = BoardDaoMapper.GetSEQ();
		seq++;
		
		req_data.put("seq", seq);
		System.out.println(req_data);
		String privateip = (String) req_data.get("private_ip");

		int num = BoardDaoMapper.checkIP(privateip);
		int result;
		if(num == 0) {
			result = BoardDaoMapper.Register(req_data);
		}else {
			result = num;
		}
		
		return result;
	}
	
	public int GetSEQ() {
		int num = BoardDaoMapper.GetSEQ();
		
		num++;
		return num;
	}
	
	public int Updateboard(HashMap<String, Object> req_data)throws Exception{
		System.out.println("수정");
		//수정한 내역 다 가져온 것
		System.out.println(req_data);
		//여기서 selectdetail 값과 올파라미터 값을 비교해서 다른 것 -> 문자열화 시켜 server history에 저장(변경내역)
		//List<Map<String, Object>> result = BoardDaoMapper.DetailBoard(seq);

		int result3 = 0;
		int seq = Integer.parseInt(req_data.get("SEQ").toString());
		
		String privateip = (String) req_data.get("private_ip");

		int num2 = BoardDaoMapper.checkIP(privateip);
		int result2;
		if(num2 == 0) {
			result2 = BoardDaoMapper.Updateboard(req_data);
		}else {
			result2 = num2;
		}
		
		
		Map<String, String> change = new HashMap<>();
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		
		HashMap<String, Object> history = new HashMap<>();
		int num = BoardDaoMapper.GetHSEQ(seq);
		num++;
		
		history.put("SEQ",seq);
		history.put("CHANGE_DATE",date);
		history.put("CHANGE_CONTENT",req_data.get("changecontent"));
		history.put("CHANGE_USER",req_data.get("ID"));
		history.put("H_SEQ",num);
		
		
		System.out.println(history);
		
		
		if (result2 == 1) {
			//수정 성공시 1 
			result3 = BoardDaoMapper.InsertHistory(history);
		}else {
			result3 = result2;
		}
		
		return result3;
	};
	
	public List DetailHistory(int seq) throws Exception{
		List<Map<String, Object>> result = BoardDaoMapper.DetailHistory(seq);
		return result;
	};
	
	public int DeleteBoard(int seq) throws Exception{
		int num = BoardDaoMapper.DeleteBoard(seq);
		return num;
	};
	
	
}
