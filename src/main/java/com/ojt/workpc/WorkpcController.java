package com.ojt.workpc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class WorkpcController {
	
	@Autowired
	WorkpcService service;
	
	@ResponseBody
	@RequestMapping(value = "/workpcboard",  method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView boardlist(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/workpcboard");
		//디폴트 값 본사 석포로 선택 후 검색 누르면 석포로 검색
		String location = "본사";
		List<Map<String, Object>> result = service.SelectBoardList(location,1);
		
		mv.addObject("list", result);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/location3",  method = {RequestMethod.GET,RequestMethod.POST})
	public  List<Map<String, Object>> boardlist2(HttpServletRequest	 request) throws Exception {

		String result = request.getParameter("location");
		List<Map<String, Object>> list = service.SelectBoardList(result,1);

		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/pagelist2",  method = {RequestMethod.GET,RequestMethod.POST})
	public  List<Map<String, Object>> pagelist(HttpServletRequest request) throws Exception {
		String searchid = request.getParameter("searchid");
		String searchtxt = request.getParameter("searchtxt");
		String location = request.getParameter("location");
		int page = Integer.parseInt(request.getParameter("page"));
		
		List<Map<String, Object>> list = service.searchList(searchid, searchtxt, location, page);

		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchlist2",  method = {RequestMethod.GET,RequestMethod.POST})
	public  List<Map<String, Object>> searchlist(HttpServletRequest	 request, RedirectAttributes rattr, HttpServletResponse response) throws Exception {
		String searchid = request.getParameter("searchid");
		String searchtxt = request.getParameter("searchtxt");
		String location = request.getParameter("location");
		
		int page = 1;
			
		List<Map<String, Object>> list = service.searchList(searchid, searchtxt, location, page);

		return list;
	}
	
	@RequestMapping("/writeworkpc")
	public String write() {
		return "writeworkpc";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardsave2",  method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Integer> boardsave(@RequestParam HashMap<String,Object> allParameters) throws Exception {

		int result = service.Register(allParameters);
		
		Map<String, Integer> resultMap = new HashMap<>();
		resultMap.put("value",result);

		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailpc",  method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView detail(int seq, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/detailpc");
		List<Map<String, Object>> result = service.DetailBoard(seq);
		List<Map<String, Object>> result2 = service.DetailHistory(seq);
		
		mv.addObject("list", result);
		mv.addObject("list2", result2);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deletelist2",  method = {RequestMethod.GET,RequestMethod.POST})
	public int deletelist(HttpServletRequest request) throws Exception {
		System.out.println("삭제하기");
		String seq = request.getParameter("SEQ");
		int num = service.DeleteBoard(Integer.parseInt(seq));
		Map<String, Integer> resultMap = new HashMap<>();
		resultMap.put("value", num);		
		return num;
	}
	
	@ResponseBody
	@RequestMapping(value = "/btnupdate2", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Integer> boardupdate(HttpServletRequest request, @RequestParam HashMap<String,Object> allParameters) throws Exception {		
		//update문 추가하여 update
		int num = service.Updateboard(allParameters);
		Map<String,Integer> resultMap = new HashMap<>();
		resultMap.put("value", num);
		
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/changepcboard",  method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updateboard(int seq, HttpServletRequest	 request, RedirectAttributes rattr, HttpServletResponse response) throws Exception {
		System.out.println("수정페이지");
		ModelAndView mv = new ModelAndView("/changepcboard");
		List<Map<String, Object>> result = service.DetailBoard(seq);
		
		mv.addObject("list", result);
		return mv;
	}
}
