package com.choa.note;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class NoteService {
	
	@Autowired
	private NoteDAO noteDAO;
	
	public List<NoteDTO> noteList(ListInfo listInfo) throws Exception{
	
		int result=noteDAO.noteCount(listInfo);
		listInfo.makePage(result);
		listInfo.setRow();
		
		return noteDAO.noteList(listInfo);		
	}
	
	public int noteWrite(NoteDTO noteDTO) throws Exception{
		return noteDAO.noteWrite(noteDTO);
	}
	
	public NoteDTO noteView(int num) throws Exception{
		return noteDAO.noteView(num);
	}
	
	public int noteDelete(int num) throws Exception{
		return noteDAO.noteDelete(num);
	}

}
