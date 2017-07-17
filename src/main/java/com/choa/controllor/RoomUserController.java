package com.choa.controllor;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.choa.room.roomuser.RoomUserService;

@Controller
public class RoomUserController {
	
	@Inject
	private RoomUserService roomUserService;	
}
