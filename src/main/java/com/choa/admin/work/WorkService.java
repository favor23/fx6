package com.choa.admin.work;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class WorkService {

	@Inject
	private WorkDAO workDAO;

	// 추가
	public int insert(WorkDTO workDTO) {
		return workDAO.insert(workDTO);
	}

	// 수정
	public int update(WorkDTO workDTO) {
		return workDAO.update(workDTO);
	}

	// 삭제
	public int delete(WorkDTO workDTO) {
		return workDAO.delete(workDTO);
	}

	// 퍼센트 수정 0~100
	public int progress(WorkDTO workDTO) {
		return workDAO.progress(workDTO);
	}

	// 전체 리스트
	public List<WorkDTO> list() {
		return workDAO.list();
	}

	// 리스트 원
	public WorkDTO listone(WorkDTO workDTO) {
		return workDAO.listone(workDTO);
		
	}
}
