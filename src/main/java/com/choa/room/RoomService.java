package com.choa.room;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService {

	@Autowired
	private RoomDAO roomDAO;
	
	public RoomDTO playtime(Integer num)throws Exception{
		return roomDAO.playtime(num);
	}
	
	public int playtimeUpdate(RoomDTO roomDTO)throws Exception{
		return roomDAO.playtimeUpdate(roomDTO);
	}
}
