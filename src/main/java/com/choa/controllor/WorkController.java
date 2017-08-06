package com.choa.controllor;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.admin.AdminDTO;
import com.choa.admin.AdminServiceImpl;
import com.choa.admin.work.SchedulDTO;
import com.choa.admin.work.WorkDTO;
import com.choa.admin.work.WorkService;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping(value="/admin/**")
public class WorkController {

	@Autowired
	private WorkService workService;
	@Autowired
	private AdminServiceImpl adminService;
	
	// 추가
	@RequestMapping(value="work_insert")
	public String insert(WorkDTO workDTO) {
		System.out.println(workDTO.getId());
		System.out.println(workDTO.getIconcls());
		System.out.println(workDTO.getName());
		System.out.println(workDTO.getPersons());
		System.out.println(workDTO.getProgress());
		System.out.println(workDTO.getBegin());
		System.out.println(workDTO.getEnd());
		
		workService.insert(workDTO);
		return null;
	}
	
	// 추가 리스트
		@RequestMapping(value="work_insertlist")
		public String insertlist(String rows) {
			WorkDTO workDTO=new WorkDTO();
			System.out.println(rows);
			workService.insert(workDTO);
			return null;
		}

	// 수정
	@RequestMapping(value="work_update")
	public int update(WorkDTO workDTO) {
		System.out.println(workDTO.getId());
		System.out.println(workDTO.getIconcls());
		System.out.println(workDTO.getName());
		System.out.println(workDTO.getPersons());
		System.out.println(workDTO.getProgress());
		System.out.println(workDTO.getBegin());
		System.out.println(workDTO.getEnd());
		workService.update(workDTO);
		return 0;

	}

	// 삭제
	@RequestMapping(value="work_delete")
	public int delete(WorkDTO workDTO) {
		workService.delete(workDTO);
		return 0;

	}

	// 퍼센트 수정 0~100
	@RequestMapping(value="work_progress")
	public int progress(WorkDTO workDTO) {
		workService.progress(workDTO);
		return 0;

	}

	// 전체 리스트
	@ResponseBody
	@RequestMapping(value="work_list")
	public Map<String, Object> list(Model model) {
		List<WorkDTO> list=new ArrayList<WorkDTO>();
		list=workService.list();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("worklist", list);
		return map;
	}

	// 리스트 원
	@ResponseBody
	@RequestMapping(value="work_listone")
	public WorkDTO listone(WorkDTO workDTO) {
		workService.listone(workDTO);
		return workDTO;

	}
	
	// 전체 리스트
		@ResponseBody
		@RequestMapping(value="schedul_list")
		public Map<String, Object> schedul() {
			List<WorkDTO> list=new ArrayList<WorkDTO>();
			list=workService.list();
			List<SchedulDTO> list2=new ArrayList<SchedulDTO>();
			SchedulDTO schedulDTO;
			int i=0;
			String[] color={"#0054FF","#2F9D27","#993800","#C98500"};
			System.out.println(color[0]);
			
			for(WorkDTO ar: list){
				schedulDTO=new SchedulDTO();
				schedulDTO.setId(ar.getPersons());
				schedulDTO.setTitle(ar.getName());
				schedulDTO.setStart(ar.getBegin());
				schedulDTO.setEnd(ar.getEnd());
				schedulDTO.setColor(color[i++]);
				if(i==4){
					i=0;
				}
				list2.add(schedulDTO);
			}
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("schedullist", list2);
			return map;
		}
}
