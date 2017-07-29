package com.choa.controllor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.admin.work.WorkDTO;
import com.choa.admin.work.WorkService;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping(value="/admin/**")
public class WorkController {

	@Autowired
	private WorkService workService;

	// 추가
	@RequestMapping(value="work_insert")
	public String insert(WorkDTO workDTO) {
		workService.insert(workDTO);
		return null;

	}

	// 수정
	@RequestMapping(value="work_update")
	public int update(WorkDTO workDTO) {
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
	public Map<String, Object> list() {
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
}
