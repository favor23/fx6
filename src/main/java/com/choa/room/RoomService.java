package com.choa.room;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class RoomService {

	@Autowired
	private RoomDAO roomDAO;
	
	//전체리스트
	public List<RoomDTO> playtimeList(ListInfo listInfo)throws Exception{
		return roomDAO.playtimeList(listInfo);
	}
	
	public RoomDTO playtime(Integer num)throws Exception{
		return roomDAO.playtime(num);
	}
	
	public int playtimeUpdate(RoomDTO roomDTO)throws Exception{
		return roomDAO.playtimeUpdate(roomDTO);
	}
}
