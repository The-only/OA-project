package com.dlnu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.MeetingDao;
import com.dlnu.pojo.Meeting;
import com.dlnu.pojo.Users;

@Service
public class MeetingService {
	public MeetingDao getMeetingDao() {
		return meetingDao;
	}

	public void setMeetingDao(MeetingDao meetingDao) {
		this.meetingDao = meetingDao;
	}

	@Autowired
	private MeetingDao meetingDao;
	public void addM(Meeting m){
		meetingDao.save(m);
	}
	public void updateM(Meeting m){
		meetingDao.update(m);
	}
	public Meeting get(int id){
		return meetingDao.getMeeting(id);
	}

}
