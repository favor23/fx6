package com.choa.controllor;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.choa.file_matching.FileMatchingService;
import com.choa.matching.MatchingDTO;
import com.choa.matching.MatchingService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value="/board/matching/**")
public class MatchingController {

	@Autowired
	private MatchingService matchingService;
	
	
	
	
	@RequestMapping(value="matchingList")
	public void matchingList2(Model model){
		int totalCount = 0;
		
		try {
			totalCount = matchingService.matchingCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("totalCount", totalCount);
	}
	
	@RequestMapping(value ="getMatchingList", method = RequestMethod.GET)
	public void matchingList(Integer curPage, Model model){
		List<MatchingDTO> list = null;
		ListInfo listInfo = new ListInfo();
		
		listInfo.setCurPage(curPage);
		
		try {
			list = matchingService.matchingList(listInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		
	}
	
	
	@RequestMapping(value ="matchingDetail", method = RequestMethod.GET)
	public void MatchigView(Integer matching_num, Model model){
		MatchingDTO matchingDTO = null;
		
		try {
			matchingDTO = matchingService.matchingDetail(matching_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dto", matchingDTO);
		
	}
	
	
	@RequestMapping(value ="matchingSenario", method=RequestMethod.GET)
	public void MatchingDetail2(Integer matching_num, Model model){
		MatchingDTO matchingDTO=null;
		
		
		try {
			matchingDTO = matchingService.matchingDetail2(matching_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("matching", matchingDTO);
	}
	
	
	@RequestMapping(value="matchingWriteForm", method= RequestMethod.GET)
	public void matchingWrite(String path, Integer matching_num, Model model){
		if(matching_num!=null){
			MatchingDTO matchingDTO = null;
			
			try {
				
				
				matchingDTO.setScenario(matchingDTO.getScenario().replace("<br>", "\r\n"));
				matchingDTO.setStory(matchingDTO.getStory().replace("<br>", "\r\n"));
				matchingDTO.setNotice(matchingDTO.getNotice().replace("<br>", "\r\n"));
				
				matchingDTO = matchingService.matchingView(matching_num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			model.addAttribute("dto", matchingDTO);
		}
		model.addAttribute("path", path);
	}
	
	
	@RequestMapping(value="matchingWrite", method = RequestMethod.POST)
	public String matchingWrite(MatchingDTO matchingDTO, @RequestParam List<String> genre, @RequestParam("f1") MultipartFile f1, HttpSession session, Model model){
		
		int result=0;
		String message = "추가 실패! 자세한 사항은 담당자에게 문의하세요.";
		String temp = "";
		
		FileMatchingService fileMatchingService = new FileMatchingService();
		
		String fileName = "";
		
		for(String g: genre){
			temp += g + "/";
		}
		
		matchingDTO.setGenre(temp);
		
		
		try {
			fileName = fileMatchingService.fileSave(f1, session);
			
			matchingDTO.setMatching_img("/img/matching-img/" +fileName);
			
			
			
			matchingDTO.setScenario(matchingDTO.getScenario().replace("\r\n", "<br>"));
			matchingDTO.setStory(matchingDTO.getStory().replace("\r\n", "<br>"));
			matchingDTO.setNotice(matchingDTO.getNotice().replace("\r\n", "<br>"));
			
			result = matchingService.matchingWrite(matchingDTO);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message ="추가 성공! 리스트에서 확인하세요.";
		}
		
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../matching/matchingList");
		
		return "commons/result";
	}
	
	
	@RequestMapping(value="matchingUpdate", method=RequestMethod.POST)
	public String matchingUpdate(MatchingDTO matchingDTO, @RequestParam List<String> genre, Model model){
		int result = 0;
		String message = "수정 실패! 자세한 사항은 담당자에게 문의하세요.";
		String temp="";
		
		for(String g: genre){
			temp +=g +"/";
		}
		
		matchingDTO.setGenre(temp);
		
		try {
			result=matchingService.matchingUpdate(matchingDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="수정 성공! 수정된 사항은 리스트에서 확인하세요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../matching/matchingList");
		
		return "commons/result";
	}
	
	
	@RequestMapping(value="matchingDelete", method=RequestMethod.GET)
	public String matchingDelete(Integer matching_num, Model model){
		int result= 0;
		String message="삭제 실패! 자세한 사항은 담당자에게 문의하세요.";
		
		try {
			result=matchingService.matchingDelete(matching_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="삭제 성공!";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../matching/matchingList");
		
		
		return "commons/result";
	}
	
	
}
