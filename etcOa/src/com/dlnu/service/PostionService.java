package com.dlnu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.PostionDao;

@Service
public class PostionService {
	@Autowired
	private PostionDao PostionDao;

	public PostionDao getPostionDao() {
		return PostionDao;
	}

	public void setPostionDao(PostionDao postionDao) {
		PostionDao = postionDao;
	}

	public List<String> getPostions() {
		return PostionDao.getPositions();
	}
}
