package com.choa.controllor;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.note.NoteDTO;
import com.choa.note.NoteService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value="/board/note/**")
public class NoteController {

	@Autowired
	private NoteService noteService;
	
	
	@RequestMapping(value="noteList", method=RequestMethod.GET)
	public String noteList(Model model, ListInfo listInfo){
		
		List<NoteDTO> ar = null;
		
		try {
			ar = noteService.noteList(listInfo);
			model.addAttribute("list", ar);
			model.addAttribute("listInfo", listInfo);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/note/noteList";
	}
	
	
	
	@RequestMapping(value="noteList2", method=RequestMethod.GET)
	public String noteList2(Model model, ListInfo listInfo){
		
		List<NoteDTO> ar = null;
		
		try {
			ar = noteService.noteList(listInfo);
			model.addAttribute("list", ar);
			model.addAttribute("listInfo", listInfo);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/note/noteList2";
	}
	
	
	//writeForm
	
	@RequestMapping(value="noteWrite", method=RequestMethod.GET)
	public String noteWrite(){
		return "board/note/noteWrite";
	}
	
	
	//write
	@RequestMapping(value="noteWrite", method=RequestMethod.POST)
	public String noteWrite(NoteDTO noteDTO, Model model){
		
		int result = 0;
		String message = "전송을 실패했습니다.";
		
		try {
			result = noteService.noteWrite(noteDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message = "쪽지를 성공적으로 보냈습니다.";
			
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "noteList");
		
		return "commons/result";
				
	}
	
	//view
	@RequestMapping(value="noteView", method=RequestMethod.GET)
	public String noteView(Integer num, Model model){
		
		
		NoteDTO noteDTO = null;
		
		
		try {
			noteDTO = noteService.noteView(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("view", noteDTO);
		
		return "board/note/noteView";
	}
	
	
	//delete
	@RequestMapping(value="noteDelete", method=RequestMethod.GET)
	public String noteDelete(int num, Model model){
		
		int result = 0;
		String message = null;
		
		try {
			result = noteService.noteDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		message = "삭제를 실패했습니다.";
		
		if(result>0){
			message="삭제를 성공했습니다.";
			
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "noteList");
		
		return "commons/result";
	}
	
	
	@RequestMapping(value="noteDelete2", method=RequestMethod.GET)
	public String noteDelete2(@RequestParam ArrayList<Integer> checkOne, Model model){
		int result = 0;
		String message = null;
		
		
		
		try {
			for(Integer num : checkOne){
			result = noteService.noteDelete(num);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		message = "삭제를 실패했습니다.";
		
		if(result>0){
			message="삭제를 성공했습니다.";
			
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "noteList");
		
		return "commons/result";
		
		
		
		
	}
	
	
}
