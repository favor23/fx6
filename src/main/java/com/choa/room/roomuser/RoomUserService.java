package com.choa.room.roomuser;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.customer.CustomerDTO;
import com.choa.movie.MovieDTO;
import com.choa.util.ListInfo;

@Service
public class RoomUserService {

	@Inject
	private RoomUserDAO roomUserDAO;
	
	public List<RoomUserDTO> selectList() throws Exception {	
		System.out.println("서비스실행");
		return roomUserDAO.selectList();
	}
	
	public int count() throws Exception{
		return roomUserDAO.count();
	}
	
	public int update(RoomUserDTO rDto){
		return roomUserDAO.update(rDto);		
	}
	
	public RoomUserDTO selectone(int num){
		return roomUserDAO.selectone(num);
	}
}
